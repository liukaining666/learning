package cn.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSON;

import cn.entity.Kaoshi;
import cn.entity.Kind;
import cn.entity.Score;
import cn.entity.Timu;
import cn.entity.User;
import cn.service.KaoshiService;
import cn.service.KindService;
import cn.service.ScoreService;
import cn.service.TimuService;
import cn.service.UserService;

@Controller
@RequestMapping("/timu")
public class TimuController {

	@Autowired
	private TimuService timuService;
	@Autowired
	private KindService kindService;
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private KaoshiService kaoshiService;
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("getKaoshilist")
	public String getKaoshilist(String username,Model model){
		List<Score> sList=scoreService.getAll(username)	;
		model.addAttribute("list",sList);
		return "score";
	}
	
	@RequestMapping("lookT/{id}")
	public String lookT(@PathVariable("id")Integer id,Model model,HttpSession session){
		Score score=scoreService.selectByPrimaryKey(id);
		User user=userService.selectByPrimaryKey(score.getUid());
		List<Kaoshi> kList=kaoshiService.getMykaoshi(score.getUid(), id);
		List<Timu> tList=new ArrayList<Timu>();
		Timu timu =new Timu();
		for(int i=0;i<kList.size();i++){
			timu=timuService.selectByPrimaryKey(kList.get(i).getTid());
			timu.setDaan(kList.get(i).getDaan());
			tList.add(i, timu);
		}
		Kind kind=kindService.selectByPrimaryKey(timu.getKindid());
		model.addAttribute("tlist",tList);
		model.addAttribute("klist",kList);
		model.addAttribute("kind",kind);
		model.addAttribute("user",user);
		return "shijuan";
	}
	
	@RequestMapping("look/{id}")
	public String look(@PathVariable("id")Integer id,Model model,HttpSession session){
		User user=(User) session.getAttribute("userSession");
		
		List<Kaoshi> kList=kaoshiService.getMykaoshi(user.getId(), id);
		List<Timu> tList=new ArrayList<Timu>();
		Timu timu =new Timu();
		for(int i=0;i<kList.size();i++){
			timu=timuService.selectByPrimaryKey(kList.get(i).getTid());
			timu.setDaan(kList.get(i).getDaan());
			tList.add(i, timu);
		}
		Kind kind=kindService.selectByPrimaryKey(timu.getKindid());
		model.addAttribute("tlist",tList);
		model.addAttribute("klist",kList);
		model.addAttribute("kind",kind);
		return "admin/shijuan";
	}
	
	@RequestMapping("getTimulist")
		public String getTimulist(Integer kindid,Model model){
			List<Timu> tList=timuService.getBykindid(kindid);
			List<Kind> kList=kindService.getAll();
			model.addAttribute("kindList",kList);
			model.addAttribute("list",tList);
			return "timulist";
		}
	
	
	@RequestMapping("addTimu")
	public String addkind(Timu kind){
		timuService.insert(kind);
		return "redirect:/timu/getTimulist";
	}
	@RequestMapping("importTimu")
	@ResponseBody
    public Map<String,Object> importTimu(@RequestParam("cmFile") CommonsMultipartFile cmFile, HttpServletResponse response,HttpServletRequest request){//导入试题
        

        Map<String,Object> resultMap = new HashMap<String,Object>();
        final FileItem fileItem = cmFile.getFileItem();
        String fileName = "timu_"+System.currentTimeMillis()+".xlsx";
        File localFile = new File(fileName);
        FileInputStream fc = null;
        Workbook wb = null;
        try {
            cmFile.transferTo(localFile);
            try {
                fc = new FileInputStream(localFile);
                wb = new XSSFWorkbook(fc);
            } catch (Exception e) {
                fc = new FileInputStream(localFile);
                wb = new HSSFWorkbook(fc);
            }
        }catch(IOException e){
        }
        //读取excel数据
        List<Timu> sheetList = new ArrayList<Timu>();
        try {
            Sheet sheet = wb.getSheetAt(0);
            if (null == sheet)
                return null;

            List<Timu> rowsList = new ArrayList<Timu>();
            int rows = sheet.getPhysicalNumberOfRows();
            //记录下成功  失败的个数
            int failNum  = 0;
            int successNum = 0;
            Date countDate = new Date();//存个年月日  用于记录批次
            // 循环行
            for (int r = 1; r < rows; r++) {
                // 一行数据
                StringBuffer sb =new StringBuffer();
                Row row = sheet.getRow(r);

                Timu evo = new Timu();
                if (null != row ) {

                    Cell cell0 = row.getCell(0);
                    evo.setTitle(getCellData(cell0).trim());
                    Cell cell1 = row.getCell(1);
                    evo.setOpa(getCellData(cell1).trim());
                    Cell cell2 = row.getCell(2);
                    evo.setOpb(getCellData(cell2).trim());
                    Cell cell3 = row.getCell(3);
                    evo.setOpc(getCellData(cell3).trim());
                    Cell cell4 = row.getCell(4);
                    evo.setOpd(getCellData(cell4).trim());
                    Cell cell5 = row.getCell(5);
                    evo.setAnswer(getCellData(cell5).trim());
                    Cell cell6 = row.getCell(6);
                    evo.setScore(Integer.parseInt(getCellData(cell6).trim()));
                    Cell cell7 = row.getCell(7);
                    evo.setOpd(getCellData(cell7).trim());
                    Cell cell8 = row.getCell(8);
                    evo.setKindid(Integer.parseInt(getCellData(cell8).trim()));
                    evo.setIsdel(0);
                    System.out.println("存入一个试卷:"+ JSON.toJSONString(evo));
                    try {
                        timuService.insert(evo);
                        successNum++;
                    }catch (Exception e){//有异常 失败+1
                        failNum++ ;
                    }
                }
            };

            //删除 文件
            if (localFile.exists() && localFile.isFile()) {
                localFile.delete();
            }
            resultMap.put("msg", "导入完成，成功:"+successNum+"条，失败:"+failNum+"条");
            resultMap.put("success", true);
        } catch (Exception e) {
            System.out.println("导入失败，异常为:"+e);
        }
        return resultMap;
    }
	/**
     * 获取单元格数据
     *
     * @param cell
     *            :数据单元格
     * @return
     */
    private static String getCellData(final Cell cell) {
        // 单元格数据
        String value = null;
        if (null != cell) {
            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_FORMULA:
                    switch (cell.getCachedFormulaResultType()) {
                        case Cell.CELL_TYPE_NUMERIC:
                            // value = Double.toString(cell.getNumericCellValue());
                            cell.setCellType(Cell.CELL_TYPE_STRING);//数字类型的转为文本类型读取
                            value = cell.getStringCellValue();
                            break;
                        case Cell.CELL_TYPE_STRING:
                            value = cell.getStringCellValue();
                            break;
                        default:
                            value = cell.getStringCellValue();
                            break;
                    }
                    break;
                case Cell.CELL_TYPE_NUMERIC:
                    if (HSSFDateUtil.isCellDateFormatted(cell)) {
                        value = new SimpleDateFormat("yyyy-MM-dd").format(cell.getDateCellValue());

                    } else {
                   /* value = Double.toString(cell.getNumericCellValue());
                    BigDecimal bd = new BigDecimal(value);
                    value = bd.toPlainString();*/
                        cell.setCellType(Cell.CELL_TYPE_STRING);//数字类型的转为文本类型读取
                        value = cell.getStringCellValue();
                    }
                    break;
                case Cell.CELL_TYPE_STRING:
                    value = cell.getStringCellValue();
                    break;
                case Cell.CELL_TYPE_BOOLEAN:
                    value = Boolean.toString(cell.getBooleanCellValue());
                    break;
                case Cell.CELL_TYPE_BLANK:
                    value = "";
                    break;
                case Cell.CELL_TYPE_ERROR:
                    value = "";
                    break;
                default:
                    value = "";
                    break;
            }
        } else {
            value = "";
        }
        return value;
    }

	@RequestMapping("delTimu")
	public String delTimu(int id) {
		Timu timu=timuService.selectByPrimaryKey(id);
		timu.setIsdel(1);
		timuService.updateByPrimaryKeySelective(timu);
		return "redirect:/timu/getTimulist";
	}
	
	@RequestMapping("toupdateTimu/{id}")
	@ResponseBody
	public Timu toupdateTimu(@PathVariable("id") int id){
		Timu kind=timuService.selectByPrimaryKey(id);
		return kind;
	}

	@RequestMapping("updateTimu")
	public String updateKind(Timu kind) {
		
		timuService.updateByPrimaryKeySelective(kind);
		return "redirect:/timu/getTimulist";
	}
	@RequestMapping("kaoshi")
	public String ksoshi(Integer id,Model model) {
		List<Timu> timus= timuService.getBykindid(id);
		Kind kind=kindService.selectByPrimaryKey(id);
		model.addAttribute("list",timus);
		model.addAttribute("count",timus.size());
		model.addAttribute("kind",kind);
		return "admin/kaoshi";
	}
	@RequestMapping("tijiao")
	public String tijiao(String daans,Integer kindid,Model model,HttpSession session) {
		int score=0;
		List<Timu> timus = timuService.getBykindid(kindid);
		String[]  list=daans.split(",");
		for(int i=0;i<list.length;i++){
			if(list[i].equals(timus.get(i).getAnswer())){
				score+=timus.get(i).getScore();		
			}
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		User user=(User) session.getAttribute("userSession");
		Score score2= new Score();
		score2.setCtime(sdf.format(new Date()));
		score2.setScore(score);
		score2.setUid(user.getId());
		scoreService.insert(score2);//分数
		
		
		for(int i=0;i<timus.size();i++){
			Kaoshi kaoshi=new Kaoshi();
			kaoshi.setUid(user.getId());
			kaoshi.setSid(scoreService.getAllScore(user.getId()).get(0).getId());
			kaoshi.setTid(timus.get(i).getId());
			kaoshi.setDaan(list[i]);
			kaoshiService.insertSelective(kaoshi);
		}
		
		return "redirect:/timu/getMyScore";
	}
	
	@RequestMapping("getMyScore")
	public String getMyScore(Model model,HttpSession session){
		User user=(User) session.getAttribute("userSession");
		List<Score> scores= scoreService.getAllScore(user.getId());
		model.addAttribute("list",scores);
		return "admin/score";
	}
	@RequestMapping("getAllscore")
	public String getAllscore(Model model,HttpSession session){
		
		List<Score> scores= scoreService.getAllScore(null);
		model.addAttribute("list",scores);
		return "admin/score";
	}
	
}

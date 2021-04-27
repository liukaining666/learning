package cn.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;

import cn.entity.Hufu;
import cn.entity.Kind;
import cn.entity.User;
import cn.entity.Void;
import cn.service.HufuService;
import cn.service.KindService;
import cn.service.RecordService;
import cn.service.UserService;
import cn.service.VoidService;
import cn.util.Const;
import cn.util.FileLoadUtil;

@Controller
@RequestMapping("/void")
public class VoidController {
	@Autowired
	private VoidService voidService;
	@Autowired
	private KindService kindServices;
	@Autowired
	private UserService userService;
	@Autowired
	private RecordService recordService;
	@Autowired
	private HufuService hufuService;
	
	

	@RequestMapping("getziliaolist")
	public String getziliaolist(Integer pageNum,String voidname,HttpSession session, String teachername,
			Integer kindid,Model model,Integer role){
			if (pageNum == null) {
				pageNum = 1;
			}
			
				List<Kind> kindlist= kindServices.getAll();
				model.addAttribute("kindlist", kindlist);
				
				model.addAttribute("teachername", teachername);
				model.addAttribute("voidname", voidname);
				model.addAttribute("kindid", kindid);
				
				if(role!=null&&role==3){
					
						PageInfo<Void> pageInfo =voidService.getziliaoList(voidname, teachername, kindid, pageNum,0);
						model.addAttribute("pageInfo", pageInfo);
					
					return "admin/ziliaolist";
				}else{
					User user = (User) session.getAttribute("userSession");
					if(user!=null&&user.getRole()==2){
						PageInfo<Void> pageInfo =voidService.getziliaoList(voidname, teachername, kindid, pageNum,user.getId());
						model.addAttribute("pageInfo", pageInfo);
					}else{
						PageInfo<Void> pageInfo =voidService.getziliaoList(voidname, teachername, kindid, pageNum,0);
						model.addAttribute("pageInfo", pageInfo);
					}
					return "ziliaolist";
				}
		
	}
	
	@RequestMapping("getVoidlist")
	public String getAllKind(Integer pageNum,String voidname,HttpSession session, String teachername,
			Integer kindid,Model model,Integer role){
			if (pageNum == null) {
				pageNum = 1;
			}
			User user = (User) session.getAttribute("userSession");
			List<Kind> kindlist= kindServices.getAll();
			model.addAttribute("kindlist", kindlist);
			model.addAttribute("teachername", teachername);
			model.addAttribute("voidname", voidname);
			model.addAttribute("kindid", kindid);
			if(kindid!=null&&kindid==-1){
				kindid=null;
			}
			if(role!=null&&role==3){
					PageInfo<Void> pageInfo =voidService.getVoidList(voidname, teachername, kindid, pageNum,0);
					model.addAttribute("pageInfo", pageInfo);
				
				return "admin/voidlist";
			}else{
				if(user!=null&&user.getRole()!=1){
					PageInfo<Void> pageInfo =voidService.getVoidList(voidname, teachername, kindid, pageNum,user.getId());
					model.addAttribute("pageInfo", pageInfo);
				}else{
					PageInfo<Void> pageInfo =voidService.getVoidList(voidname, teachername, kindid, pageNum,0);
					model.addAttribute("pageInfo", pageInfo);
				}
				return "voidlist";
			}
	}
	
	
	@RequestMapping("addVoid")
	public String addkind(Void record,Integer role,@RequestParam("file") MultipartFile file,HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException{
		record.setViodpath(FileLoadUtil.upload(request, file));
		record.setTime(Const.getCurrentTime());
		record.setRole(role);
		User user = (User) session.getAttribute("userSession");
		record.setUid(user.getId());
		record.setTeachername(user.getUsername());
		voidService.insert(record);
		if(record.getRole()==1){
			return "redirect:/void/getVoidlist";
		}else{
			return "redirect:/void/getziliaolist";
		}
		
	}
	
	@RequestMapping("delVoid")
	public String delKind(Integer id) {
		
		Void record=voidService.selectByPrimaryKey(id);
		if(record.getRole()==1){
			voidService.deleteByPrimaryKey(id);
			return "redirect:/void/getVoidlist";
		}else{
			voidService.deleteByPrimaryKey(id);
			return "redirect:/void/getziliaolist";
		}
	}
	
	//置顶
	@RequestMapping("zhidin")
	public String zhidin(Integer id,HttpSession session){
		Void void1=voidService.selectByPrimaryKey(id);
		void1.setTop(1);
		voidService.updateByPrimaryKeySelective(void1);
		return "redirect:/void/getVoidlist";
	}
	
	
	//收藏
	@RequestMapping("addRecordFir/{id}")
	public String addRecordFir(@PathVariable("id")Integer id,HttpSession session){
		User user=(User) session.getAttribute("userSession");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		cn.entity.Record record = new cn.entity.Record();
		record.setRole(1);
		record.setUid(user.getId());
		record.setNid(id);
		record.setTime(sdf.format(new Date()));
		recordService.insert(record);
		return "redirect:/void/lookVoidT/"+id;
		
	}
	//关注
	@RequestMapping("addRecordFou/{id}")
	public String addRecordFou(@PathVariable("id")Integer id,HttpSession session){
		User user=(User) session.getAttribute("userSession");
		Void record1=voidService.selectByPrimaryKey(id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		cn.entity.Record record = new cn.entity.Record();
		record.setRole(4);
		record.setUid(user.getId());
		record.setNid(record1.getUid());
		record.setTime(sdf.format(new Date()));
		recordService.insert(record);
		return "redirect:/void/lookVoidT/"+id;
		
	}
	
	//回复
	@RequestMapping("addhufu")
	public String addhufu(String content,Integer role,Integer nid,HttpSession session){
		User user=(User) session.getAttribute("userSession");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		cn.entity.Record record=recordService.selectByPrimaryKey(nid);
		Hufu hufu=new Hufu();
		hufu.setContent(content);
		hufu.setTime(sdf.format(new Date()));
		
		hufu.setUid(user.getId());
		hufu.setRid(nid);
		hufuService.insert(hufu);
		return "redirect:/void/lookVoidT/"+record.getNid();
	}
	
	//评论
	@RequestMapping("addRecordthr")
	public String addRecordthr(String content,Integer role,Integer nid,HttpSession session){
		User user=(User) session.getAttribute("userSession");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		cn.entity.Record record = new cn.entity.Record();
		record.setRole(role);
		record.setUid(user.getId());
		record.setNid(nid);
		record.setContent(content);
		record.setTime(sdf.format(new Date()));
		recordService.insert(record);
		return "redirect:/void/lookVoidT/"+nid;
	}
	
	@RequestMapping("addbiji")
	public String addbiji(String content,Integer role,Integer nid,HttpSession session){
		User user=(User) session.getAttribute("userSession");
		cn.entity.Record record = new cn.entity.Record();
		record.setUid(user.getId());
		record.setRole(role);
		record.setContent(content);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		record.setTime(sdf.format(new Date()));
		record.setNid(nid);
		recordService.insert(record);
		return "redirect:/void/lookVoidT/"+nid;
	}
	@RequestMapping("getMyGuanZhu")
	public String lookVoidV(Integer id,Model model,HttpSession session,Integer pageNum) {
		if(pageNum==null){
			pageNum=1;
		}
		PageInfo<Void> pageInfo = voidService.getVoidList(null, null, null, pageNum, id);
		model.addAttribute("pageInfo",pageInfo);
		return "admin/voidlist";
	}
	
	//做笔记或者评论回复刷新void.jsp不新增播放记录
	@RequestMapping("lookVoidT/{id}")
	public String lookVoidT(@PathVariable("id")Integer id,Model model,HttpSession session) {
		Void record=voidService.selectByPrimaryKey(id);
		User user=(User) session.getAttribute("userSession");
		Void void1=voidService.selectByPrimaryKey(id);
		
        List<cn.entity.Record> recordlist=recordService.getMybijiList(user.getId(),id);
        cn.entity.Record record2=recordService.shifoushoucang(user.getId(), id);
        List<cn.entity.Record> pinglunlist=recordService.getpinglunList(id);//评论集合
        cn.entity.Record record4=recordService.shifouguanzhu(user.getId(), void1.getUid());//判断是否关注
        model.addAttribute("recordguan",record4);
        model.addAttribute("record",record2);
		model.addAttribute("item",record);
		model.addAttribute("recordlist",recordlist);//笔记集合
		model.addAttribute("pinglunlist",pinglunlist);
		return "void";
	}
	
	
	//观看视频新增一条播放记录
	@RequestMapping("lookVoid/{id}")
	public String lookVoid(@PathVariable("id")int id,Model model,HttpSession session) {
		Void record=voidService.selectByPrimaryKey(id);
		 User user=(User) session.getAttribute("userSession");
		if(user!=null){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	        System.out.println(sdf.format(new Date()));// new Date()为获取当前系统时间
	        cn.entity.Record record2=new cn.entity.Record(); 
	        record2.setTime(sdf.format(new Date()));
	        record2.setRole(2);
	        record2.setNid(id);
	        Void void1=voidService.selectByPrimaryKey(id);
	        record2.setUid(user.getId());
	        recordService.insert(record2);//新增播放记录
	        List<cn.entity.Record> recordlist=recordService.getMybijiList(user.getId(),id);//笔记集合
	        cn.entity.Record record3=recordService.shifoushoucang(user.getId(), id);//判断是否收藏
	        cn.entity.Record record4=recordService.shifouguanzhu(user.getId(), void1.getUid());//判断是否关注
	        model.addAttribute("recordguan",record4);
	        model.addAttribute("record",record3);
	        model.addAttribute("recordlist",recordlist);
		}
		
        
        List<cn.entity.Record> pinglunlist=recordService.getpinglunList(id);//评论集合
        
		model.addAttribute("item",record);
		
		model.addAttribute("pinglunlist",pinglunlist);
		
			return "void";
		
	}
	
	@RequestMapping("lookziliao/{id}")
	public String lookziliao(@PathVariable("id")int id,Model model,HttpSession session) {
		Void record=voidService.selectByPrimaryKey(id);
		model.addAttribute("item",record);
		
		return "ziliao";
		
		
	}
	
	
	@RequestMapping("toupdateVoid/{id}")
	@ResponseBody
	public Void toupdateKind(@PathVariable("id") int id){
		Void kind=voidService.selectByPrimaryKey(id);
		return kind;
	}


	@RequestMapping("updateVoid")
	public String updateKind(Void record,Integer role,@RequestParam("file") MultipartFile file,HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException{
		record.setViodpath(FileLoadUtil.upload(request, file));
		
		
		
		voidService.updateByPrimaryKeySelective(record);
	
			return "redirect:/void/getVoidlist";
	
	}
	@RequestMapping("down")
	public ResponseEntity<byte[]> down(Integer id,HttpServletRequest request) throws IOException{
		Void v=voidService.selectByPrimaryKey(id);
		return FileLoadUtil.downLoad(request, v.getViodpath());
	}
	
	@RequestMapping("getAllMybijilist")
	public String getAllMybijiList(HttpSession session,Model model,Integer pageNum,String voidname) {
		if (pageNum == null) {
			pageNum = 1;
		}
		 User user=(User) session.getAttribute("userSession");
		 PageInfo< cn.entity.Record> pageInfo =recordService.getAllMybijiList(user.getId(), 0, pageNum,voidname);
		 model.addAttribute("pageInfo",pageInfo);
		 model.addAttribute("voidname",voidname);
		return "bijilist";
	}
	@RequestMapping("delRecordById")
	public String delRecordById(Integer id){
		cn.entity.Record record=recordService.selectByPrimaryKey(id);
		if(record.getRole()==5){
			recordService.deleteByPrimaryKey(id);
			return "redirect:/void/getAllMybijilist";
		}
		if(record.getRole()==1){
			recordService.deleteByPrimaryKey(id);
			return "redirect:/void/getMyLoveRecordList";
		}
		if(record.getRole()==2){
			recordService.deleteByPrimaryKey(id);
			return "redirect:/void/getMySeeRecordListed";
		}
		return null;
	}
	
	@RequestMapping("getMyLoveRecordList")
	public String getMyLoveRecordList(HttpSession session,Model model,Integer pageNum) {
		if (pageNum == null) {
			pageNum = 1;
		}
		 User user=(User) session.getAttribute("userSession");
		 PageInfo< cn.entity.Record> pageInfo =recordService.getMyLoveRecordList(user.getId(), pageNum);
		 model.addAttribute("pageInfo",pageInfo);
		
		return "shoucanglist";
	}
	
	
	@RequestMapping("getMySeeRecordListed")
	public String getMySeeRecordListed(HttpSession session,Model model,Integer pageNum) {
		if (pageNum == null) {
			pageNum = 1;
		}
		 User user=(User) session.getAttribute("userSession");
		 PageInfo< cn.entity.Record> pageInfo =recordService.getMySeeRecordListed(user.getId(), pageNum);
		 model.addAttribute("pageInfo",pageInfo);
		
		return "seelist";
	}
}

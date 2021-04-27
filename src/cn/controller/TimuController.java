package cn.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

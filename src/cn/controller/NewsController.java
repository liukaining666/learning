package cn.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.entity.Hufu;
import cn.entity.Kind;
import cn.entity.News;
import cn.entity.User;
import cn.entity.Void;
import cn.service.HufuService;
import cn.service.KindService;
import cn.service.NewsService;
import cn.service.RecordService;

@Controller
@RequestMapping("/news")
public class NewsController {

	@Autowired
	private NewsService newsService;
	@Autowired
	private KindService kindService;
	@Autowired
	private RecordService recordService;
	@Autowired
	private HufuService hufuService;
	
	@RequestMapping("getNewslist")
	public String getAllKind(Integer pageNum,String username, 
			Integer kindid,Model model,HttpSession session,Integer role){
			if (pageNum == null) {
				pageNum = 1;
			}
			
			List<Kind> kindlist= kindService.getAll();
			model.addAttribute("kindList", kindlist);
		
			model.addAttribute("username", username);
			model.addAttribute("kindid", kindid);
			if(role!=null&&role==3){
				
					PageInfo<News> pageInfo =newsService.getNewsList(username,  kindid, pageNum,0);
					model.addAttribute("pageInfo", pageInfo);
			
				return "admin/newslist";
			}else{
				User user = (User) session.getAttribute("userSession");
				 if(user!=null&&user.getRole()!=1){
					 PageInfo<News> pageInfo =newsService.getNewsList(username, kindid, pageNum,user.getId());
					
					model.addAttribute("pageInfo", pageInfo);
				}else{
					PageInfo<News> pageInfo =newsService.getNewsList(username,  kindid, pageNum,0);
					model.addAttribute("pageInfo", pageInfo);
				}
				return "newslist";
			}
	}
	@RequestMapping("addNews")
	public String addNews(News news,HttpSession session){
		User user=(User) session.getAttribute("userSession");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		news.setUid(user.getId());
		news.setPubtime(sdf.format(new Date()));
		newsService.insert(news);
		
		return "redirect:/news/getNewslist";
	}
	
	@RequestMapping("toupdateNews/{id}")
	@ResponseBody
	public News toupdateKind(@PathVariable("id") int id){
		News news=newsService.selectByPrimaryKey(id);
		return news;
	}

	@RequestMapping("updateNews")
	public String updateKind(News kind) {
		newsService.updateByPrimaryKeySelective(kind);
		return "redirect:/news/getNewslist";
	}
	
	@RequestMapping("delNews")
	public String delKind(int id) {
		newsService.deleteByPrimaryKey(id);
		return "redirect:/news/getNewslist";
	}
	
	@RequestMapping("lookNews/{id}")
	public String lookNews(@PathVariable("id")Integer id,Model model,HttpSession session) {
		News record=newsService.selectByPrimaryKey(id);
		List<cn.entity.Record> pinglunlist=recordService.getpinglunListT(id);//评论集合
        model.addAttribute("item",record);
        model.addAttribute("pinglunlist",pinglunlist);
        
		return "news";
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
		return "redirect:/news/lookNews/"+nid;
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
		return "redirect:/news/lookNews/"+record.getNid();
	}
}

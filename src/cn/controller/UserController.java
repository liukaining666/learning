package cn.controller;

import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;

import cn.entity.Kind;
import cn.entity.Message;
import cn.entity.News;
import cn.entity.Record;
import cn.entity.User;
import cn.service.KindService;
import cn.service.MessageService;
import cn.service.NewsService;
import cn.service.RecordService;
import cn.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private RecordService recordService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private NewsService newsService;
	@Autowired
    private KindService kindService;
	
	@RequestMapping("getUserlist")//查询学生
	public String getUserlist(String username, Integer pageNum,
			Model model) {
		if (pageNum == null) {
			pageNum = 1;
		}
		PageInfo<User> pageInfo = userService.getUserList(username,
				pageNum);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("username", username);
		return "user";
	}
	@RequestMapping("getNoClassesStudents")//查询未选班级的学生
	@ResponseBody
    public List<User> getNoClassesStudents() {
     
        return userService.getNoClassesStudents();
    }
	@RequestMapping("getTeacherDeskStudents")//查询选了当前登陆老师的课程的学生
	@ResponseBody
    public PageInfo<User> getTeacherDeskStudents(Integer pageNum,
            Model model,HttpSession session) {
        if (pageNum == null) {
            pageNum = 1;
        }
        //获取当前登陆的老师的id
        User user = (User) session.getAttribute("userSession");
        Integer teacherId = user.getId();
        //Integer teacherId = teacherId = 4;
        PageInfo<User> pageInfo = userService.getUserListByTeacherid(teacherId,pageNum);
        return pageInfo;
    }
	@RequestMapping("getTeacherlist")//查询老师
	public String getTeacherlist(String username, Integer pageNum,
			Model model) {
		if (pageNum == null) {
			pageNum = 1;
		}
		PageInfo<User> pageInfo = userService.getTeacherList(username, pageNum);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("username", username);
		return "teacher";
	}
	
	@RequestMapping("login")
	public String login(String username, String password,
			HttpSession session, Model model) {
		System.out.println("login ============ ");
		User user = userService.login(username, password);
		if (null != user) {//登陆成功
			session.setAttribute("userSession", user);
			session.setAttribute("role", user.getRole());
			List<News> nList=newsService.getgonggaolist();
			model.addAttribute("gonggao",nList.get(0));
			return "index";
				
		}else{//登陆失败
			model.addAttribute("wrong", "请输入正确的用户名或者登录密码");
			return "login/login";
		}
		
	}
    
    @RequestMapping("logout")
	public String LoginOut(HttpSession session) {
		session.removeAttribute("userSession");
		session.removeAttribute("role");
		return "index";
	}
	
	 @RequestMapping("addUser")
		public String adduser(User user,@RequestParam("file") MultipartFile file,Model model,HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException{
		 if(!file.isEmpty()){
			 String path = request.getSession().getServletContext().getRealPath("/headpic");
			 String filename=file.getOriginalFilename();
				File filepath=new File(path,filename);
				if(!filepath.getParentFile().exists()){
					filepath.getParentFile().mkdirs();
				}
				file.transferTo(new File(path+File.separator+filename));
				user.setHeadpic(filename);
			 
				User user2=userService.selectByUserName(user.getUsername());
		    	Integer i=(Integer)session.getAttribute("role");
		    	
		    	if(i!=null){
		    		if(user2!=null){
		    			model.addAttribute("wrong","注册失败，用户名已存在");
		    		}else{
		    			userService.insert(user);
		    		}
		    		if(user.getRole()==2){
		    			return "redirect:/user/getTeacherlist";
		    		}
		    		if(user.getRole()==3){
		    			return "redirect:/user/getUserlist";
		    		}
		    		
		    	}else{
		    		if(user2!=null){
		    			model.addAttribute("wrong","注册失败，用户名已存在");
		    		}else{
		    			model.addAttribute("success","注册成功，请登录---");
		    			userService.insert(user);
		    		}
		    		return "login/login";
		    	}
		 }
		 	return null;
		} 
	 
	 @RequestMapping("delGuanZhu")
		public String delGuanZhu(int id) {
			recordService.deleteByPrimaryKey(id);
			
			return "redirect:/user/getMyGuanZhu";
			
		}
	
	    
	    @RequestMapping("delUser")
		public String delUser(int id) {
			User user=userService.selectByPrimaryKey(id);
			if(user.getRole()==3){
				userService.deleteByPrimaryKey(id);
				return "redirect:/user/getUserlist";
			}else{
				userService.deleteByPrimaryKey(id);
				return "redirect:/user/getTeacherlist";
			}
		}
	    @RequestMapping("delUserT")
		public String delUserT(int id) {
				User user=userService.selectByPrimaryKey(id);
				user.setRole(-1);
				userService.updateByPrimaryKeySelective(user);
				return "redirect:/user/getTeacherlist";
			
		}
	    
	    @RequestMapping("delUserJ")
		public String delUserJ(int id) {
				User user=userService.selectByPrimaryKey(id);
				user.setRole(2);
				userService.updateByPrimaryKey(user);
				return "redirect:/user/getTeacherlist";
			
		}
	    
	    @RequestMapping("toupdateMe")
		public String toupdateMe(HttpSession session,Model model){
			User user=(User) session.getAttribute("userSession");
			model.addAttribute("item",user);
			return "register";
		}
	    @RequestMapping("updateMe")
		public String updateMe(@RequestParam("file") MultipartFile file,HttpServletRequest request,User record,Model model,HttpSession session) throws IllegalStateException, IOException{
	    	if(!file.isEmpty()){
				 String path = request.getSession().getServletContext().getRealPath("/headpic");
				 String filename=file.getOriginalFilename();
					File filepath=new File(path,filename);
					if(!filepath.getParentFile().exists()){
						filepath.getParentFile().mkdirs();
					}
					file.transferTo(new File(path+File.separator+filename));
					record.setHeadpic(filename);
	    		}		
	    			
			userService.updateByPrimaryKeySelective(record);
			session.removeAttribute("userSession");
			session.removeAttribute("role");
			session.setAttribute("userSession", record);
			session.setAttribute("role", record.getRole());
			return "index";
		}
		
		@RequestMapping("toupdateUser/{id}")
		@ResponseBody
		public User toupdateUser(@PathVariable("id") int id){
			User user=userService.selectByPrimaryKey(id);
			return user;
		}

		@RequestMapping("updateUser")
		public String updateUser(@RequestParam("file") MultipartFile file,HttpServletRequest request,User user,HttpSession session) throws IllegalStateException, IOException {
		
			 if(!file.isEmpty()){
				 String path = request.getSession().getServletContext().getRealPath("/headpic");
				 String filename=file.getOriginalFilename();
					File filepath=new File(path,filename);
					if(!filepath.getParentFile().exists()){
						filepath.getParentFile().mkdirs();
					}
					file.transferTo(new File(path+File.separator+filename));
					user.setHeadpic(filename);
			 }
				userService.updateByPrimaryKeySelective(user);
			 if(user.getRole()==3){
				return "redirect:/user/getUserlist";
			}else{
				return "redirect:/user/getTeacherlist";
			}
			
		}
		
		@RequestMapping("getMyGuanZhu")
		public String getMyGuanZhu(HttpSession session,Model model, Integer pageNum){
			if (pageNum == null) {
				pageNum = 1;
			}
			User user=(User) session.getAttribute("userSession");
			PageInfo<Record> pageInfo = recordService.getMyGuanZhu(user.getId(), pageNum);
			model.addAttribute("pageInfo",pageInfo);
			return "guanzhu";
		}
		
		@RequestMapping("sixin")
		public String sixin(Integer nid,String content,HttpSession session,Model model){
			Message message=new Message();
			User user=(User) session.getAttribute("userSession");
			message.setNid(nid);
			message.setUid(user.getId());
			message.setContent(content);
			message.setIsread(0);
			messageService.insert(message);
			return "redirect:/user/getMyGuanZhu";
			
		}
		@RequestMapping("getMysixin")
		public String getMysixin(Integer nid,String content,HttpSession session,Model model){
			User user=(User) session.getAttribute("userSession");
			List<Message> mList=messageService.getMyMessageList(user.getId());
			model.addAttribute("list",mList);
			return "sixin";
		}
		
		@RequestMapping("tolooksixin/{id}")
		@ResponseBody
		public Message tolooksixin(@PathVariable("id") int id){
			Message user=messageService.selectByPrimaryKey(id);
			return user;
		}
}

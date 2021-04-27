package cn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.entity.Kind;
import cn.entity.Record;
import cn.entity.User;
import cn.entity.Void;
import cn.service.KindService;
import cn.service.RecordService;
import cn.service.VoidService;

@Controller
@RequestMapping("/kind")
public class KindController {
	@Autowired
	private KindService kindServices;
	@Autowired
	private VoidService voidService;
	@Autowired
	private RecordService recordService;
	
	@RequestMapping("getKindlist")
	public String getAllKind(Integer pageNum,Model model){
			if (pageNum == null) {
				pageNum = 1;
			}
			PageInfo<Kind> pageInfo =kindServices.getAllKindList(pageNum);
			model.addAttribute("pageInfo", pageInfo);
		return "kind";
	}
	@RequestMapping("addKind")
	public String addkind(Kind kind){
		kindServices.insert(kind);
		return "redirect:/kind/getKindlist";
	}
	
	@RequestMapping("delKind")
	public String delKind(int id) {
		kindServices.deleteByPrimaryKey(id);
		return "redirect:/kind/getKindlist";
	}
	
	@RequestMapping("toupdateKind/{id}")
	@ResponseBody
	public Kind toupdateKind(@PathVariable("id") int id){
		Kind kind=kindServices.selectByPrimaryKey(id);
		return kind;
	}

	@RequestMapping("updateKind")
	public String updateKind(Kind kind) {
		kindServices.updateByPrimaryKeySelective(kind);
		return "redirect:/kind/getKindlist";
	}
	
	@RequestMapping("getVoidlist/{kindid}")
	public String getVoidlist(@PathVariable("kindid")Integer kindid,Integer pageNum,Model model){
		if (pageNum == null) {
			pageNum = 1;
		}
		PageInfo<Void> pageInfo =voidService.getVoidList(null, null, kindid, pageNum, null);
		model.addAttribute("pageInfo", pageInfo);
		return "admin/voidlist";
	}
	@RequestMapping("getziliaolist/{kindid}")
	public String getziliaolist(@PathVariable("kindid")Integer kindid,Integer pageNum,Model model){
		if (pageNum == null) {
			pageNum = 1;
		}
		PageInfo<Void> pageInfo =voidService.getziliaoList(null, null, kindid, pageNum, null);
		model.addAttribute("pageInfo", pageInfo);
		return "admin/ziliaolist";
	}
	@RequestMapping("getMyjihua")
	public String getMyjihua(Integer pageNum,Model model,HttpSession session){
		if (pageNum == null) {
			pageNum = 1;
		}
		List<Kind> kList=kindServices.getAll();
		User user = (User) session.getAttribute("userSession");
		PageInfo<Record> pageInfo =recordService.getMyjihua(user.getId(), pageNum);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("kindList",kList);
		return "admin/kind";
	}
	
	@RequestMapping("addjihua")
	public String addjihua(Integer kindid,Model model,HttpSession session){
		Record record=new Record();
		User user = (User) session.getAttribute("userSession");
		record.setUid(user.getId());
		record.setNid(kindid);
		record.setRole(7);
		recordService.insertSelective(record);
		return "redirect:/kind/getMyjihua";
	
	}
	@RequestMapping("getshenhe")
	public String getshenhe(Integer pageNum,Model model,HttpSession session){
		if (pageNum == null) {
			pageNum = 1;
		}
		PageInfo<Record> pageInfo =recordService.getshenhe(pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "shenhe";
	
	}
	@RequestMapping("doshenhe")
	public String doshenhe(Integer id,Model model,HttpSession session){
		
		Record record = recordService.selectByPrimaryKey(id);
		record.setRole(8);
		recordService.updateByPrimaryKey(record);
		return "redirect:/kind/getshenhe";
	
	}
}

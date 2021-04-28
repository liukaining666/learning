package cn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;

import cn.entity.Classes;
import cn.entity.Kind;
import cn.entity.Record;
import cn.entity.User;
import cn.entity.Void;
import cn.service.ClassesService;
import cn.service.KindService;
import cn.service.RecordService;
import cn.service.VoidService;

@Controller
@RequestMapping("/classes")
public class ClassesController {
    @Autowired
    private ClassesService classesService;
    
    @RequestMapping("getClassesList")
    @ResponseBody
    public List<Classes>  getClassesList(){
        return classesService.getClassesList();
    }
}

package cn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.entity.Student;
import cn.entity.Sumscore;
import cn.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    
    @RequestMapping("getStudentList")
    @ResponseBody
    public List<Student>  getStudentList(){
        return studentService.getStudentList();
    }
    @RequestMapping("addStudent")
    @ResponseBody
    public void addStudent(Student student){
        studentService.addStudent(student);
    }
    
    @RequestMapping("sumScore")
    @ResponseBody
    public Sumscore sumScore(){
        return studentService.sumScore();
    }
}

package cn.service;

import java.util.List;

import cn.entity.Student;
import cn.entity.Sumscore;

public interface StudentService {
    List<Student> getStudentList();
    void addStudent(Student s);
    Sumscore sumScore();
    
}

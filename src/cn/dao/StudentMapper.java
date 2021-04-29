package cn.dao;

import java.util.List;

import cn.entity.Classes;
import cn.entity.Student;

public interface StudentMapper {
    List<Student> getStudentList();
    void addStudent(Student s);
}
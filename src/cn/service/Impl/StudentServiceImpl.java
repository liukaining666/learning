package cn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dao.StudentMapper;
import cn.dao.SumscoreMapper;
import cn.entity.Student;
import cn.entity.Sumscore;
import cn.service.StudentService;
@Service("studentService")
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private StudentMapper studentMapper;

	@Autowired
    private SumscoreMapper sumscoreMapper;
    @Override
    public List<Student> getStudentList() {
        // TODO Auto-generated method stub
        return studentMapper.getStudentList();
    }

    @Override
    public void addStudent(Student s) {
        // TODO Auto-generated method stub
         studentMapper.addStudent(s);
    }

    @Override
    public Sumscore sumScore() {
        // TODO Auto-generated method stub
        return sumscoreMapper.sumScore();
    }
}

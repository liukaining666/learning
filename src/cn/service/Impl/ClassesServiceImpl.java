package cn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.dao.ClassesMapper;
import cn.dao.KindMapper;
import cn.entity.Classes;
import cn.entity.Kind;
import cn.service.ClassesService;
import cn.service.KindService;
@Service("classesService")
public class ClassesServiceImpl implements ClassesService{
	
	@Autowired
	private ClassesMapper classesMapper;

	public List<Classes> getClassesList(){
	    return classesMapper.getClassesList();
	}
}

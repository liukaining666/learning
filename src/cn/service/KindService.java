package cn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;

import cn.entity.Kind;
import cn.entity.User;

public interface KindService {

	 int deleteByPrimaryKey(Integer id);

	    int insert(Kind record);

	    int insertSelective(Kind record);

	    Kind selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(Kind record);

	    int updateByPrimaryKey(Kind record);
	    
	    PageInfo<Kind> getAllKindList(Integer pageNum);
	    
	    List<Kind> getAll();
}

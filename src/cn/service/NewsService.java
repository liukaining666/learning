package cn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;

import cn.entity.News;
import cn.entity.User;
import cn.entity.Void;

public interface NewsService {

	 int deleteByPrimaryKey(Integer id);

	    int insert(News record);

	    int insertSelective(News record);

	    News selectByPrimaryKey(Integer id);

	    List<News> getgonggaolist();
	    int updateByPrimaryKeySelective(News record);

	    int updateByPrimaryKey(News record);
	    
	    PageInfo<News> getNewsList(@Param("username") String username,@Param("kindid")Integer kindid,Integer pageNum,@Param("uid")Integer uid);
}

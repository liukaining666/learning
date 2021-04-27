package cn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.entity.News;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);
    
    List<News> getgonggaolist();

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
    
    List<News> getNewsList(@Param("username") String username,@Param("kindid")Integer kindid,@Param("uid")Integer uid);
}
package cn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.entity.Timu;

public interface TimuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Timu record);

    int insertSelective(Timu record);

    Timu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Timu record);

    int updateByPrimaryKey(Timu record);
    
    List<Timu> getBykindid(@Param("kindid")Integer kindid);
}
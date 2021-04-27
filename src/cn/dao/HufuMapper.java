package cn.dao;

import cn.entity.Hufu;

public interface HufuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Hufu record);

    int insertSelective(Hufu record);

    Hufu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Hufu record);

    int updateByPrimaryKey(Hufu record);
}
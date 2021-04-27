package cn.dao;

import java.util.List;

import cn.entity.Kind;

public interface KindMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Kind record);

    int insertSelective(Kind record);

    Kind selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Kind record);

    int updateByPrimaryKey(Kind record);
    
    List<Kind> getAllKindList();
}
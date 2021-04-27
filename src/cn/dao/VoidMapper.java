package cn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.entity.Void;

public interface VoidMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Void record);

    int insertSelective(Void record);

    Void selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Void record);

    int updateByPrimaryKey(Void record);
    
    List<Void> getVoidList(@Param("voidname") String voidname,@Param("teachername")String teachername,@Param("kindid")Integer kindid,@Param("uid")Integer uid);
    
    List<Void> getziliaoList(@Param("voidname") String voidname,@Param("teachername")String teachername,@Param("kindid")Integer kindid,@Param("uid")Integer uid);
}
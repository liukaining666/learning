package cn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.entity.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
    
   
    List<Message> setMyMessageList(@Param("uid")Integer uid);
    
    List<Message> getMyMessageList(@Param("nid")Integer nid);
}
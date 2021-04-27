package cn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import cn.entity.Message;
import cn.entity.User;

public interface MessageService {
	int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
    
    //收信
    List<Message> getMyMessageList(@Param("uid")Integer uid);
    //发信
    List<Message> setMyMessageList(@Param("nid")Integer nid);
}

package cn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dao.MessageMapper;
import cn.entity.Message;
import cn.service.MessageService;
@Service("messageService")
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageMapper messageMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return messageMapper.deleteByPrimaryKey(id);
	}

	public List<Message> getMyMessageList(Integer uid) {
		// TODO Auto-generated method stub
		return messageMapper.getMyMessageList(uid);
	}

	public int insert(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.insert(record);
	}

	public int insertSelective(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.insertSelective(record);
	}

	public Message selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return messageMapper.selectByPrimaryKey(id);
	}

	public List<Message> setMyMessageList(Integer nid) {
		// TODO Auto-generated method stub
		return messageMapper.setMyMessageList(nid);
	}

	public int updateByPrimaryKey(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelective(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.updateByPrimaryKeySelective(record);
	}

}

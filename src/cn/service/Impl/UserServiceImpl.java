package cn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.dao.UserMapper;
import cn.entity.User;
import cn.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.deleteByPrimaryKey(id);
	}

	public PageInfo<User> getLoverUserList(String username,Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<User> userlist=userMapper.getLoverUserList(username);
		PageInfo<User> pageInfo=new PageInfo<User>(userlist);
		return pageInfo;
	}

	public PageInfo<User> getTeacherList(String username,Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<User> userlist=userMapper.getTeacherList(username);
		PageInfo<User> pageInfo=new PageInfo<User>(userlist);
		return pageInfo;
	}

	public PageInfo<User> getUserList(String username,Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<User> userlist=userMapper.getUserList(username);
		PageInfo<User> pageInfo=new PageInfo<User>(userlist);
		return pageInfo;
	}

	public int insert(User record) {
		// TODO Auto-generated method stub
		return userMapper.insert(record);
	}

	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return userMapper.insertSelective(record);
	}

	public User login(String username, String password) {
		// TODO Auto-generated method stub
		return userMapper.login(username, password);
	}

	public User selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(record);
	}

	public User selectByUserName(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectByUserName(username);
	}

}

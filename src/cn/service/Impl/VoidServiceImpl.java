package cn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.dao.VoidMapper;
import cn.entity.User;
import cn.entity.Void;
import cn.service.VoidService;
@Service("voidService")
public class VoidServiceImpl implements VoidService{
	
	@Autowired
	private VoidMapper voidMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return voidMapper.deleteByPrimaryKey(id);
	}

	public PageInfo<Void> getVoidList(String voidname, String teachername,
			Integer kindid,Integer pageNum,Integer uid) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 12);
		
		List<Void> userlist=voidMapper.getVoidList(voidname,teachername,kindid,uid);
		PageInfo<Void> pageInfo=new PageInfo<Void>(userlist);
		return pageInfo;
	}

	public int insert(Void record) {
		// TODO Auto-generated method stub
		return voidMapper.insert(record);
	}

	public int insertSelective(Void record) {
		// TODO Auto-generated method stub
		return voidMapper.insertSelective(record);
	}

	public Void selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return voidMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(Void record) {
		// TODO Auto-generated method stub
		return voidMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelective(Void record) {
		// TODO Auto-generated method stub
		return voidMapper.updateByPrimaryKeySelective(record);
	}

	public PageInfo<Void> getziliaoList(String voidname, String teachername,
			Integer kindid,Integer pageNum,Integer uid) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 12);
		List<Void> userlist=voidMapper.getziliaoList(voidname,teachername,kindid, uid);
		PageInfo<Void> pageInfo=new PageInfo<Void>(userlist);
		return pageInfo;
	}

	
}

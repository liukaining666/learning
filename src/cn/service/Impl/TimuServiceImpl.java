package cn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dao.TimuMapper;
import cn.entity.Timu;
import cn.service.TimuService;
@Service("timuService")
public class TimuServiceImpl implements TimuService{
	
	@Autowired
	private TimuMapper timuMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return timuMapper.deleteByPrimaryKey(id);
	}

	public List<Timu> getBykindid(Integer kindid) {
		// TODO Auto-generated method stub
		return timuMapper.getBykindid(kindid);
	}

	public int insert(Timu record) {
		// TODO Auto-generated method stub
		return timuMapper.insert(record);
	}

	public int insertSelective(Timu record) {
		// TODO Auto-generated method stub
		return timuMapper.insertSelective(record);
	}

	public Timu selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return timuMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(Timu record) {
		// TODO Auto-generated method stub
		return timuMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelective(Timu record) {
		// TODO Auto-generated method stub
		return timuMapper.updateByPrimaryKeySelective(record);
	}

}

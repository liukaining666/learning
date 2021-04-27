package cn.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dao.HufuMapper;
import cn.entity.Hufu;
import cn.service.HufuService;
@Service("hufuService")
public class HufuServiceImpl implements HufuService{
	@Autowired
	private HufuMapper hufuMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return hufuMapper.deleteByPrimaryKey(id);
	}

	public int insert(Hufu record) {
		// TODO Auto-generated method stub
		return hufuMapper.insert(record);
	}

	public int insertSelective(Hufu record) {
		// TODO Auto-generated method stub
		return hufuMapper.insertSelective(record);
	}

	public Hufu selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return hufuMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(Hufu record) {
		// TODO Auto-generated method stub
		return hufuMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelective(Hufu record) {
		// TODO Auto-generated method stub
		return hufuMapper.updateByPrimaryKeySelective(record);
	}

}

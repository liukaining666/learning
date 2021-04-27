package cn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dao.ScoreMapper;
import cn.dao.TimuMapper;
import cn.entity.Score;
import cn.entity.Timu;
import cn.service.ScoreService;
import cn.service.TimuService;
@Service("scoreService")
public class ScoreServiceImpl implements ScoreService{
	
	@Autowired
	private ScoreMapper scoreMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return scoreMapper.deleteByPrimaryKey(id);
	}

	public List<Score> getAllScore(Integer uid) {
		// TODO Auto-generated method stub
		return scoreMapper.getAllScore(uid);
	}

	public int insert(Score record) {
		// TODO Auto-generated method stub
		return scoreMapper.insert(record);
	}

	public int insertSelective(Score record) {
		// TODO Auto-generated method stub
		return scoreMapper.insertSelective(record);
	}

	public Score selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return scoreMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(Score record) {
		// TODO Auto-generated method stub
		return scoreMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelective(Score record) {
		// TODO Auto-generated method stub
		return scoreMapper.updateByPrimaryKeySelective(record);
	}

	public List<Score> getAll(String username) {
		// TODO Auto-generated method stub
		return scoreMapper.getAll(username);
	}

	


}

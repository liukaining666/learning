package cn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dao.KaoshiMapper;
import cn.entity.Kaoshi;
import cn.service.KaoshiService;
@Service("kaoshiService")
public class KaoshiServiceImpl implements KaoshiService{

	@Autowired
	private KaoshiMapper kaoshiMapper;
	
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return kaoshiMapper.deleteByPrimaryKey(id);
	}

	public int insert(Kaoshi record) {
		// TODO Auto-generated method stub
		return kaoshiMapper.insert(record);
	}

	public int insertSelective(Kaoshi record) {
		// TODO Auto-generated method stub
		return kaoshiMapper.insertSelective(record);
	}

	public Kaoshi selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return kaoshiMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(Kaoshi record) {
		// TODO Auto-generated method stub
		return kaoshiMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelective(Kaoshi record) {
		// TODO Auto-generated method stub
		return kaoshiMapper.updateByPrimaryKeySelective(record);
	}

	public List<Kaoshi> getMykaoshi(Integer uid, Integer sid) {
		// TODO Auto-generated method stub
		return kaoshiMapper.getMykaoshi(uid, sid);
	}

	
}

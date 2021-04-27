package cn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.dao.KindMapper;
import cn.entity.Kind;
import cn.service.KindService;
@Service("kindService")
public class KindServiceImpl implements KindService{
	
	@Autowired
	private KindMapper kindMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return kindMapper.deleteByPrimaryKey(id);
	}

	public PageInfo<Kind> getAllKindList(Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<Kind> userlist=kindMapper.getAllKindList();
		PageInfo<Kind> pageInfo=new PageInfo<Kind>(userlist);
		return pageInfo;
	}

	public int insert(Kind record) {
		// TODO Auto-generated method stub
		return kindMapper.insert(record);
	}

	public int insertSelective(Kind record) {
		// TODO Auto-generated method stub
		return kindMapper.insertSelective(record);
	}

	public Kind selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return kindMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(Kind record) {
		// TODO Auto-generated method stub
		return kindMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelective(Kind record) {
		// TODO Auto-generated method stub
		return kindMapper.updateByPrimaryKeySelective(record);
	}

	public List<Kind> getAll() {
		// TODO Auto-generated method stub
		return kindMapper.getAllKindList();
	}

}

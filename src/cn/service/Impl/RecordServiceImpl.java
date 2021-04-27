package cn.service.Impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.dao.RecordMapper;
import cn.entity.Record;
import cn.entity.Void;
import cn.service.RecordService;
@Service("recordService")
public class RecordServiceImpl implements RecordService{
	
	@Autowired
	private RecordMapper recordMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return recordMapper.deleteByPrimaryKey(id);
	}

	public PageInfo<Record> getAllRecordList(String username,Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 12);
		List<Record> userlist=recordMapper.getAllRecordList(username);
		PageInfo<Record> pageInfo=new PageInfo<Record>(userlist);
		return pageInfo;
	}

	public PageInfo<Record> getMyLoveRecordList(Integer uid,Integer pageNum) {
		// TODO Auto-generated method stub
		
		PageHelper.startPage(pageNum, 12);
		List<Record> userlist=recordMapper.getMyLoveRecordList(uid);
		PageInfo<Record> pageInfo=new PageInfo<Record>(userlist);
		return pageInfo;
	}

	public PageInfo<Record> getMyRecordList(Integer uid,Integer nid,Integer pageNum) {
		// TODO Auto-generated method stub
		
		PageHelper.startPage(pageNum, 12);
		List<Record> userlist=recordMapper.getMyRecordList(uid,nid);
		PageInfo<Record> pageInfo=new PageInfo<Record>(userlist);
		return pageInfo;
	}

	public PageInfo<Record> getMySeeRecordListed(Integer uid,Integer pageNum) {
		// TODO Auto-generated method stub
	
		PageHelper.startPage(pageNum, 12);
		List<Record> userlist=recordMapper.getMySeeRecordListed(uid);
		PageInfo<Record> pageInfo=new PageInfo<Record>(userlist);
		return pageInfo;
	}
	
	
	public PageInfo<Record> getAllMybijiList(Integer uid, Integer nid,
			Integer pageNum,String voidname) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 12);
		List<Record> userlist=recordMapper.getMybijiList(uid,0, voidname);
		PageInfo<Record> pageInfo=new PageInfo<Record>(userlist);
		return pageInfo;
	}

	public int insert(Record record) {
		// TODO Auto-generated method stub
		return recordMapper.insert(record);
	}

	public int insertSelective(Record record) {
		// TODO Auto-generated method stub
		return recordMapper.insertSelective(record);
	}

	public Record selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return recordMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(Record record) {
		// TODO Auto-generated method stub
		return recordMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelective(Record record) {
		// TODO Auto-generated method stub
		return recordMapper.updateByPrimaryKeySelective(record);
	}

	public List<Record> getMybijiList(Integer uid, Integer nid) {
		// TODO Auto-generated method stub
		return recordMapper.getMybijiList(uid, nid,null);
	}

	public Record shifoushoucang(Integer uid, Integer nid) {
		// TODO Auto-generated method stub
		return recordMapper.shifoushoucang(uid, nid);
	}

	public List<Record> getpinglunList(Integer nid) {
		// TODO Auto-generated method stub
		return recordMapper.getpinglunList(nid);
	}

	public PageInfo<Record> getMyGuanZhu(Integer uid, Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 12);
		List<Record> userlist=recordMapper.getMyGuanZhu(uid);
		PageInfo<Record> pageInfo=new PageInfo<Record>(userlist);
		return pageInfo;
	}

	public Record shifouguanzhu(Integer uid, Integer nid) {
		// TODO Auto-generated method stub
		return recordMapper.shifouguanzhu(uid, nid);
	}

	public List<Record> getpinglunListT(Integer nid) {
		// TODO Auto-generated method stub
		return recordMapper.getpinglunListT(nid);
	}

	public PageInfo<Record> getMyjihua(Integer uid, Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<Record> userlist=recordMapper.getMyjihua(uid);
		PageInfo<Record> pageInfo=new PageInfo<Record>(userlist);
		return pageInfo;
	}

	public PageInfo<Record> getshenhe(Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<Record> userlist=recordMapper.getshenhe();
		PageInfo<Record> pageInfo=new PageInfo<Record>(userlist);
		return pageInfo;
	}

	

	

}

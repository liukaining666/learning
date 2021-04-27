package cn.service.Impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.dao.NewsMapper;
import cn.entity.News;
import cn.entity.Void;
import cn.service.NewsService;
@Service("newsService")
public class NewsServiceImpl implements NewsService{
	
	@Autowired
	private NewsMapper newsMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return newsMapper.deleteByPrimaryKey(id);
	}

	public PageInfo<News> getNewsList(String username, Integer kindid,Integer pageNum,Integer uid) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 12);
		List<News> userlist=newsMapper.getNewsList(username, kindid,uid);
		PageInfo<News> pageInfo=new PageInfo<News>(userlist);
		return pageInfo;
	}

	public int insert(News record) {
		// TODO Auto-generated method stub
		return newsMapper.insert(record);
	}

	public int insertSelective(News record) {
		// TODO Auto-generated method stub
		return newsMapper.insertSelective(record);
	}

	public News selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return newsMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(News record) {
		// TODO Auto-generated method stub
		return newsMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelective(News record) {
		// TODO Auto-generated method stub
		return newsMapper.updateByPrimaryKeySelective(record);
	}

	public List<News> getgonggaolist() {
		// TODO Auto-generated method stub
		return newsMapper.getgonggaolist();
	}

}

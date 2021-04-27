package cn.service;

import java.util.List;

import cn.entity.Timu;

public interface TimuService {
	 int deleteByPrimaryKey(Integer id);

	    int insert(Timu record);

	    int insertSelective(Timu record);

	    Timu selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(Timu record);

	    int updateByPrimaryKey(Timu record);
	    
	    List<Timu> getBykindid(Integer kindid);
}

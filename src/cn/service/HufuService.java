package cn.service;

import cn.entity.Hufu;

public interface HufuService {
	 int deleteByPrimaryKey(Integer id);

	    int insert(Hufu record);

	    int insertSelective(Hufu record);

	    Hufu selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(Hufu record);

	    int updateByPrimaryKey(Hufu record);
}

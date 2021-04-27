package cn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.entity.Kaoshi;

public interface KaoshiService {

	 int deleteByPrimaryKey(Integer id);

	    int insert(Kaoshi record);

	    int insertSelective(Kaoshi record);

	    Kaoshi selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(Kaoshi record);

	    int updateByPrimaryKey(Kaoshi record);
	    
	    List<Kaoshi> getMykaoshi(@Param("uid")Integer uid,@Param("sid")Integer sid);
}

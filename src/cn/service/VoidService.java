package cn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;

import cn.entity.Record;
import cn.entity.User;
import cn.entity.Void;

public interface VoidService {

	int deleteByPrimaryKey(Integer id);

	int insert(Void record);

	int insertSelective(Void record);

	Void selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Void record);

	int updateByPrimaryKey(Void record);

	PageInfo<Void> getVoidList(@Param("voidname") String voidname,
			@Param("teachername") String teachername,
			@Param("kindid") Integer kindid,Integer pageNum,@Param("uid")Integer uid);
	
	PageInfo<Void> getziliaoList(@Param("voidname") String voidname,@Param("teachername")String teachername,@Param("kindid")Integer kindid,Integer pageNum,@Param("uid")Integer uid);
}

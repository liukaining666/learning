package cn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;

import cn.entity.Record;
import cn.entity.User;

public interface RecordService {
	int deleteByPrimaryKey(Integer id);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);
    //所有评论
    PageInfo<Record> getAllRecordList(@Param("username") String username,Integer pageNum);
    //评论
    List<Record> getpinglunList(@Param("nid") Integer nid);
    //评论
    List<Record> getpinglunListT(@Param("nid") Integer nid);
    //我的评论
    PageInfo<Record> getMyRecordList(@Param("uid") Integer uid,@Param("nid") Integer nid,Integer pageNum);
    //我的笔记
    List<Record> getMybijiList(@Param("uid") Integer uid,@Param("nid") Integer nid);
    //我的所有笔记
    PageInfo<Record> getAllMybijiList(@Param("uid") Integer uid,@Param("nid") Integer nid,Integer pageNum,String voidname);
    //我的收藏
    PageInfo<Record> getMyLoveRecordList(@Param("uid") Integer uid,Integer pageNum);
    //我的播放记录
    PageInfo<Record> getMySeeRecordListed(@Param("uid") Integer uid,Integer pageNum);
    
    Record shifoushoucang(@Param("uid") Integer uid,@Param("nid") Integer nid);
    
    Record shifouguanzhu(@Param("uid") Integer uid,@Param("nid") Integer nid);
    PageInfo<Record> getMyGuanZhu(@Param("uid") Integer uid,Integer pageNum);
    
    PageInfo<Record> getMyjihua(@Param("uid") Integer uid,Integer pageNum);
    PageInfo<Record> getshenhe(Integer pageNum);
}

package cn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.entity.Record;

public interface RecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);
    //所有评论
    List<Record> getAllRecordList(@Param("username") String username);
    //视频评论
    List<Record> getpinglunList(@Param("nid") Integer nid);
  //话题评论
    List<Record> getpinglunListT(@Param("nid") Integer nid);
    //我的评论
    List<Record> getMyRecordList(@Param("uid") Integer uid,@Param("nid") Integer nid);
    //我的biji
    List<Record> getMybijiList(@Param("uid") Integer uid,@Param("nid") Integer nid,@Param("voidname")String voidname);
    //我的收藏
    List<Record> getMyLoveRecordList(@Param("uid") Integer uid);
    //是否收藏
    Record shifoushoucang(@Param("uid") Integer uid,@Param("nid") Integer nid);
  //是否关注
    Record shifouguanzhu(@Param("uid") Integer uid,@Param("nid") Integer nid);
    //我的播放记录
    List<Record> getMySeeRecordListed(@Param("uid") Integer uid);
    //我的关注
    List<Record> getMyGuanZhu(@Param("uid") Integer uid);
    //我的学习计划
    List<Record> getMyjihua(@Param("uid") Integer uid);
    //未审核的学习计划
    List<Record> getshenhe();
}
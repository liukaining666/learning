package cn.dao;

import java.util.List;

import cn.entity.Score;

public interface ScoreMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Score record);

    int insertSelective(Score record);

    Score selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Score record);

    int updateByPrimaryKey(Score record);
    
    List<Score> getAllScore(Integer uid);
    
    List<Score> getAll(String username);
}
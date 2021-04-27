package cn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
    
    User selectByUserName(@Param("username")String username);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User login(@Param("username")String username,@Param("password")String password);
    
    List<User> getUserList(@Param("username") String username);
    
    List<User> getTeacherList(@Param("username") String username);
    //我的关注
    List<User> getLoverUserList(@Param("username") String username);
}
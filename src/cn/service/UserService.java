package cn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;

import cn.entity.User;

public interface UserService {

	int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
    
    User selectByUserName(String username);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User login(@Param("username")String username,@Param("username")String password);
    
    PageInfo<User> getUserList(@Param("username") String username,Integer pageNum);
    
    PageInfo<User> getTeacherList(@Param("username") String username,Integer pageNum);
    //我的关注
    PageInfo<User> getLoverUserList(@Param("username") String username,Integer pageNum);
    
    PageInfo<User> getUserListByUserIds(String userIds,Integer pageNum);
    //通过老师的id找到老师的课程  再找到该课程下的学生
    PageInfo<User> getUserListByTeacherid(@Param("teacherId")Integer teacherId,Integer pageNum);
    //查询没有选班级的学生
    List<User> getNoClassesStudents();
    //修改学生班级
    void updateStudentById(User user);
}

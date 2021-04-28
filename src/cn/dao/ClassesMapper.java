package cn.dao;

import java.util.List;

import cn.entity.Classes;

public interface ClassesMapper {
    List<Classes> getClassesList();
    Classes getClassesById(Integer id);
}
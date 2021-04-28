package cn.service;

import java.util.List;

import cn.entity.Classes;

public interface ClassesService {
    List<Classes> getClassesList();
    Classes getClassesById(Integer id);
}

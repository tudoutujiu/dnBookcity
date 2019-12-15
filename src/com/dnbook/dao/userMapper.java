package com.dnbook.dao;

import com.dnbook.entity.user;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface userMapper {
    int delet(@Param("nid") int nid);

    int insert(user record);

    int insertSelective(user record);

    List<user> getbyid(@Param("id") int id);

    int updateByPrimaryKeySelective(user record);

    int updateByPrimaryKey(user record);

    List<user> getAll();

    List<user> login(@Param("name") String name);

    int total();

    List<user> getpaing(@Param("sta")int sta, @Param("ends")int ends);
}
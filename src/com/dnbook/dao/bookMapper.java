package com.dnbook.dao;

import com.dnbook.entity.book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface bookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(book record);

    int insertSelective(book record);

    book selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(book record);

    int updateByPrimaryKey(book record);

    int total();

    List<book> getpaing(@Param("sta")int sta,@Param("ends")int ends);
}
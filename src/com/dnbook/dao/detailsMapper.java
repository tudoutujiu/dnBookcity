package com.dnbook.dao;

import com.dnbook.entity.details;

public interface detailsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(details record);

    int insertSelective(details record);

    details selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(details record);

    int updateByPrimaryKey(details record);
}
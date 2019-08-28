package com.web.mapper;

import com.web.entity.Stanards;

public interface StanardsMapper {
    int deleteByPrimaryKey(Integer standardId);

    int insert(Stanards record);

    int insertSelective(Stanards record);
}
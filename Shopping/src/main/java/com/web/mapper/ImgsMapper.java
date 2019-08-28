package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Imgs;
@Repository("ImgsMapper")
public interface ImgsMapper {
    /*int delete(Integer imgId);*/

    int insert(Imgs imgs);

    Imgs findById(Integer imgId);
    
    List<Imgs> findAll();

    int update(Imgs imgs);
    
    List<Imgs> findByGoodsId(Integer goodsId);
    
}
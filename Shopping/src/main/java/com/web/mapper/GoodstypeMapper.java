package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Goods;
import com.web.entity.Goodstype;
@Repository("GoodstypeMapper")
public interface GoodstypeMapper {
    /*int delete(Integer typeId);*/
	
	List<Goodstype> findByTypePid(Integer typePid);

    int insert(Goodstype goodsType);

    Goodstype findById(Integer typeId);

    int update(Goodstype goodsType);
    
    List<Goodstype> findAll();
    
    List<Goodstype> finAllParent();
    List<Goodstype> findAllMuying();
    List<Goodstype> findAllMeizhuang();
    List<Goodstype> findAllJiaju();
    List<Goodstype> findAllYinyang();
}
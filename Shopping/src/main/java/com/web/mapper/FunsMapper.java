package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Funs;

@Repository("FunsMapper")
public interface FunsMapper {
    
	public Funs findByFunsId(Integer funsId);
	public List<Funs> findByFunsPid(Integer funsPid);
}
package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Imgs;
import com.web.mapper.ImgsMapper;

@Service("ImgsService")
public class ImgsService {
	@Autowired
	@Qualifier("ImgsMapper")
	private ImgsMapper imgsMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Imgs> findByGoodsId(Integer goodsId){
		return imgsMapper.findByGoodsId(goodsId);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int saveImgs(Imgs imgs){
		return imgsMapper.insert(imgs);
	}
}

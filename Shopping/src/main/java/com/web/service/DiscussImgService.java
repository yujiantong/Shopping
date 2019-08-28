package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.DiscussImg;
import com.web.mapper.DiscussImgMapper;

@Service("DiscussImgService")
public class DiscussImgService {
	@Autowired
	@Qualifier("DiscussImgMapper")
	private DiscussImgMapper discussImgMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public void saveDiscussImg(DiscussImg discussImg){
		discussImgMapper.saveDiscussImg(discussImg);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<DiscussImg> findAll(){
		return discussImgMapper.findAll();
	}
}

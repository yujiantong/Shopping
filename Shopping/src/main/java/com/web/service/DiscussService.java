package com.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Discuss;
import com.web.entity.DiscussImg;
import com.web.mapper.DiscussImgMapper;
import com.web.mapper.DiscussMapper;
import com.web.mapper.ImgsMapper;

@Service("DiscussService")
public class DiscussService {

	@Autowired
	@Qualifier("DiscussMapper")
	private DiscussMapper discussMapper;
	@Autowired
	@Qualifier("DiscussImgMapper")
	private DiscussImgMapper imgMapper;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Map<String, Object>> countDiscussByStyle(Integer goodsId) {
		return this.discussMapper.countDiscussByStyle(goodsId);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Discuss> findByGoodsIdJoinUsers(Integer goodsId) {
		return this.discussMapper.findByGoodsIdJoinUsers(goodsId);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Discuss> findByGoodsIdAndStyleIdJoinUsers(Integer goodsId, Integer styleId) {
		return this.discussMapper.findByGoodsIdAndStyleIdJoinUsers(goodsId, styleId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public void saveDiscuss(Discuss discuss){
		List<DiscussImg> imgList=discuss.getImgList();
		discussMapper.saveDiscuss(discuss);
		for (DiscussImg discussImg : imgList) {
			imgMapper.saveDiscussImg(discussImg);
		}
		
	}
	
}

package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Footmark;
import com.web.mapper.FootmarkMapper;

@Service("FootmarkService")
public class FootmarkService {

	@Autowired
	@Qualifier("FootmarkMapper")
	private FootmarkMapper footmarkMapper;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int saveFootmark(Footmark footmark) {
		int res = 0;
		try {
			res = this.footmarkMapper.saveFootmark(footmark);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public Footmark findByGoodsId(Integer goodsId, Integer userId) {
		return this.footmarkMapper.findByGoodsId(goodsId, userId);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int updateFootmark(Footmark footmark) {
		int res = 0;
		try {
			res = this.footmarkMapper.updateFootmark(footmark);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	/**
	 * 商城首页推荐
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
    public List<Footmark> findAllTuijian(){
    	return footmarkMapper.findAllTuijian();
    }
	
	/**
	 * 购物车及积分页的热销商品
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
    public List<Footmark> findAllCart_Re(){
    	return footmarkMapper.findAllCart_Re();
    }
	
	/**
	 * 热销商品的查询，下面4块
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Footmark> findAllMuyinGoods_Re(){
		return footmarkMapper.findAllMuyinGoods_Re();
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Footmark> findAllMeizhuang_Re(){
		return footmarkMapper.findAllMeizhuang_Re();
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Footmark> findAllJiaju_Re(){
		return footmarkMapper.findAllJiaju_Re();
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<Footmark> findAllYinyang_Re(){
		return footmarkMapper.findAllYinyang_Re();
	}

}

package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Ads;
import com.web.entity.Goods;
import com.web.mapper.AdsMapper;

@Service("AdsService")
public class AdsService {
	
	@Autowired
	@Qualifier("AdsMapper")
	private AdsMapper adsMapper;
	
	//后台广告查询
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Ads> findAllAds(){
		return adsMapper.findAllAds();
	}
	
	//后台添加广告
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public Integer saveAds(Ads ads){
		return adsMapper.saveAds(ads);
	}
	//更新广告状态
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public Integer updateAdsState(Integer statuId,Integer adsId){
		return adsMapper.updateAdsState(statuId,adsId);
	}
	
	/**
	 * 查询一个广告Id
	 */

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Ads findByAdsId(Integer adsId){
		return adsMapper.findByAdsId(adsId);
	}
	
	//删除广告、只修改状态
		@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
		public Integer delete(Integer adsId){
			return adsMapper.delete(adsId);
		}

		/**
		 * 批量删除后台商品、修改状态
		 */
		@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
		public boolean deleteAllAds(List<Ads> list){
			try {
				for (Ads ads : list) {
					adsMapper.deleteAllAds(ads);
				}
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
}

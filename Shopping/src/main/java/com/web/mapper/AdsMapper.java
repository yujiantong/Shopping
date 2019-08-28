package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Ads;
import com.web.entity.Goods;

@Repository("AdsMapper")
public interface AdsMapper {
    public List<Ads> findAllAds();
    public Integer updateAds(Ads ads);
    public Integer delAds(Integer adsId);
    public Integer saveAds(Ads ads);
    
    //广告启用，停用
    public Integer updateAdsState(Integer statuId,Integer adsId);
    //删除广告、只修改状态
    public Integer delete(Integer adsId);
	public boolean deleteAllAds(Ads ads);
	public Ads findByAdsId(Integer adsId);
}
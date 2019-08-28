package com.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.web.entity.Footmark;

@Repository("FootmarkMapper")
public interface FootmarkMapper {
    
	public int saveFootmark(Footmark footmark);
	public int deleteFootmarkById(Integer footmarkId);
	public int updateFootmark(Footmark footmark);
	public List<Footmark> findAllFootmark();
	public Footmark findByGoodsId(@Param("goodsId")Integer goodsId, @Param("userId")Integer userId);
	//热销母婴
	public List<Footmark> findAllMuyinGoods_Re();
	//热销美妆
    public List<Footmark> findAllMeizhuang_Re();
    //热销家具
    public List<Footmark> findAllJiaju_Re();
    //热销营养
    public List<Footmark> findAllYinyang_Re();
    //购物车及积分页的热销商品
    public List<Footmark> findAllCart_Re();
    //商城首页推荐
    public List<Footmark> findAllTuijian();
}
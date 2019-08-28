package com.web.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.web.entity.Discuss;

@Repository("DiscussMapper")
public interface DiscussMapper {
    
	public int saveDiscuss(Discuss discuss);
	public int deleteDiscussByDiscussId(Integer discussId);
	public int updateDiscuss(Discuss discuss);
	public List<Discuss> findAllDiscuss();
	public List<Discuss> findByGoodsIdJoinUsers(@Param("goodsId")Integer goodsId);
	public List<Map<String, Object>> countDiscussByStyle(Integer discussGoods);
	
	public List<Discuss> findByGoodsIdAndStyleIdJoinUsers(@Param("goodsId")Integer goodsId, @Param("styleId")Integer styleId);
}
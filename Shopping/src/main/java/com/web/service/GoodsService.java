package com.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Goods;
import com.web.entity.Status;
import com.web.entity.Users;
import com.web.mapper.GoodsMapper;
import com.web.mapper.StatusMapper;
import com.web.vo.SearchGoodsVO;

@Service("GoodsService")
public class GoodsService {
	
	@Autowired
	@Qualifier("GoodsMapper")
	private GoodsMapper goodsMapper;
	
	@Autowired
	@Qualifier("StatusMapper")
	private StatusMapper statusMapper;
	
	/**
	 * 前台单个商品详情
	 * @return
	 */
	//@Transactional(propagation=Propagation.REQUIRED,readOnly=true)这里注释为了防止切面出错（商品详情切入）
	public Goods goodsDetail(Integer goodsId, Users user){
		return goodsMapper.goodsDetail(goodsId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int updateGoods(Goods goods){
		return goodsMapper.updateGoods(goods);
	}
	
	/**
	 * 删除后台商品、修改状态
	 */
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int delete(Integer goodsId){
		 return goodsMapper.delete(goodsId);
	}
	/**
	 * 批量删除后台商品、修改状态
	 */
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public boolean deleteAll(List<Goods> list){
		try {
			for (Goods goods : list) {
				goodsMapper.deleteAll(goods);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 后台商品上下架
	 */
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int updateStatu(Integer statuId,Integer goodsId){
		 return goodsMapper.updateStatu(statuId,goodsId);
	}
	/**
	 * 后台添加商品
	 */
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int saveGoods(Goods goods){
		return goodsMapper.insert(goods);
	} 
	
	/**
	 * 后台商品展示
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goods> findAll(SearchGoodsVO vo){
		return goodsMapper.findAll(vo);
	}
	/**
	 * 查询单个商品
	 */

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Goods findById(Integer goodsId){
		return goodsMapper.findById(goodsId);
	}
	/**
	 * 后台商品状态查询
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Status> findAllStatus(){
		return statusMapper.findAllStatus();
	}
	/**
	 * 前台展示母婴商品
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goods> findAllMuyinGoods(){
		return goodsMapper.findAllMuyinGoods();
	}
	/**
	 * 前台展示美妆商品
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goods> findAllMeizhuangGoods(){
		return goodsMapper.findAllMeizhuangGoods();
	}
	/**
	 * 根据类型查找商品
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goods> findByTypeId(Integer typeId){
		return goodsMapper.findByTypeId(typeId);
	}

	/**
	 * 前台展示家居商品
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goods> findAllJiajuGoods(){
		return goodsMapper.findAllJiajuGoods();
	}
	/**
	 * 前台展示营养商品
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goods> findAllYingyangGoods(){
		return goodsMapper.findAllYingyangGoods();
	}
	/**
	 * 根据商品类型查找商品集合
	 * @param typeId
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goods> findByType(Integer typeId){
		return goodsMapper.findByType(typeId);
	}
	
	/**
	 * 前台展示新品推荐
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goods> findnewGoods(){
		return goodsMapper.findnewGoods();
	}
	/**
	 * 前台展示热门唇妆
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goods> findnewGoods_ReLip(){
		return goodsMapper.findnewGoods_ReLip();
	}
	/**
	 * 前台展示休闲零食 
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goods> findnewGoods_Arder(){
		return goodsMapper.findnewGoods_Arder();
	}
	
}

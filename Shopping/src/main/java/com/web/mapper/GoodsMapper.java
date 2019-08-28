package com.web.mapper;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Goods;
import com.web.entity.Goodstype;
import com.web.entity.Imgs;
import com.web.vo.SearchGoodsVO;
@Repository("GoodsMapper")
public interface GoodsMapper {
	
	List<Goods> findByTypeId(Integer typeId);

	/**
	 * 这里的删除只修改状态
	 * @param goodsId
	 * @return
	 */
    int delete(Integer goodsId);
    //批量删除修改状态
    boolean deleteAll(Goods goods);
	int insert(Goods goods);
	List<Goods> findAll(SearchGoodsVO vo);
	Goods findById(Integer goodsId);
	int updateGoods(Goods goods);
	List<Goods> findAllMuyinGoods();
    List<Goods> findAllMeizhuangGoods();
    List<Goods> findAllJiajuGoods();
    List<Goods> findAllYingyangGoods();
    List<Goods> findByType(Integer typeId);
    int updateStatu(Integer statuId,Integer goodsId);
    //查商品详情
    Goods goodsDetail(Integer goodsId);
    //新品推荐
    List<Goods> findnewGoods();
    //热门唇妆
    List<Goods> findnewGoods_ReLip();
    //休闲零食
    List<Goods> findnewGoods_Arder();
}

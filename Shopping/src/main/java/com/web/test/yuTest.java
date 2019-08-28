package com.web.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.web.entity.Footmark;
import com.web.entity.Goods;
import com.web.entity.Imgs;
import com.web.mapper.FootmarkMapper;
import com.web.mapper.GoodsMapper;
import com.web.service.GoodsService;
import com.web.service.ImgsService;
import com.web.vo.SearchGoodsVO;

public class yuTest {
    private SqlSession session;
	@Test
	public void yu_test() {
		ApplicationContext appc=new ClassPathXmlApplicationContext("applicationContext.xml");
		GoodsService goodsService=appc.getBean(GoodsService.class);
		/*List<Goods> list=goodsService.findAll();
		for (Goods goods : list) {
			System.out.println(goods.getGoodsName()+"\t"+goods.getGoodsType().getTypeName());
		}*/
		Goods g=goodsService.findById(4);
		System.out.println(g.getGoodsName());
		
	}
	@Test
	public void yu_test2(){
	ApplicationContext appc=new ClassPathXmlApplicationContext("applicationContext.xml");
		GoodsService goodsService=appc.getBean(GoodsService.class);
		Goods goods=goodsService.findById(1);
		System.out.println(goods.getGoodsId()+"\t\t"+goods.getGoodsName());
		ImgsService imgService=appc.getBean(ImgsService.class);
			List<Imgs> list=imgService.findByGoodsId(goods.getGoodsId());
			for (Imgs goodsImg : list) {
				System.out.println(goodsImg.getImgPath());
			}
	}
	@Test
	public void yu_test3(){
		
	ApplicationContext appc=new ClassPathXmlApplicationContext("applicationContext.xml");
		SqlSessionFactory  sqlf=(SqlSessionFactory) appc.getBean("sqlSessionFactory");
		SqlSession seesion = sqlf.openSession();
		GoodsMapper goodsMapper=appc.getBean(GoodsMapper.class);
		Goods g=new Goods();
		g.setGoodsName("安慕希");
		int num=goodsMapper.insert(g);
		seesion.commit();
	}
	@Test
	public void yu_test4(){
		
	ApplicationContext appc=new ClassPathXmlApplicationContext("applicationContext.xml");
		GoodsMapper goodsMapper=appc.getBean(GoodsMapper.class);
		//Goods g=new Goods();
		Goods g=goodsMapper.goodsDetail(1);
		/*g.setGoodsName("安慕希");
		int num=goodsMapper.insert(g);*/
		System.out.println(g.getImgsList().size());
	}
	
	@Test
	public void yu_test5(){
		
	ApplicationContext appc=new ClassPathXmlApplicationContext("applicationContext.xml");
		GoodsMapper goodsMapper=appc.getBean(GoodsMapper.class);
		SearchGoodsVO vo=new SearchGoodsVO();
		vo.setGoodsName("纽太特中文版 乳蛋白深度水解配方粉450g 适用婴儿牛奶蛋白过敏");
		List<Goods> list=goodsMapper.findAll(vo);
		for (Goods goods : list) {
			System.out.println(goods.getGoodsName());
		}
	}
	
	@Test
	public void yu_test6(){
	ApplicationContext appc=new ClassPathXmlApplicationContext("applicationContext.xml");
		FootmarkMapper markMapper=appc.getBean(FootmarkMapper.class);
		List<Footmark> list=markMapper.findAllYinyang_Re();
		for (Footmark footmark : list) {
			System.out.println(footmark.getFootmarkGood().getGoodsName());
		}
	}
	
}

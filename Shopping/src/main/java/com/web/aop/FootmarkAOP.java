package com.web.aop;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.web.entity.Footmark;
import com.web.entity.Goods;
import com.web.entity.Users;
import com.web.service.FootmarkService;

@Aspect
@Component("FootmarkAOP")
public class FootmarkAOP {
	
	@Autowired
	@Qualifier("FootmarkService")
	private FootmarkService footmarkService;

	@Pointcut("execution(* com.web.service.GoodsService.goodsDetail(..))")
	public void pointCut(){
		
	}
	
	@After("pointCut()")
	public void updateFootmark(JoinPoint joinPoint) {
		Integer goodsId = (Integer)joinPoint.getArgs()[0];
		Users user = (Users)joinPoint.getArgs()[1];
		if(user == null) {
			user = new Users();
			user.setUserId(1);
		}
		Footmark footmark = this.footmarkService.findByGoodsId(goodsId, user.getUserId());
		if(footmark == null) {
			footmark = new Footmark();
			footmark.setFootmarkDate(new Date());
			Goods footmarkGood = new Goods();
			footmarkGood.setGoodsId(goodsId);
			footmark.setFootmarkGood(footmarkGood );
			footmark.setFootmarkUser(user);
			footmark.setFootmarkTimes(1);
			this.footmarkService.saveFootmark(footmark);
		} else {
			footmark.setFootmarkDate(new Date());
			footmark.setFootmarkTimes(footmark.getFootmarkTimes()+1);
			this.footmarkService.updateFootmark(footmark);
		}
	}
}












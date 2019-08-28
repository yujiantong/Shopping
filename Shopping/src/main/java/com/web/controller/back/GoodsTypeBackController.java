package com.web.controller.back;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.Goodstype;
import com.web.service.GoodstypeService;

@Controller
@RequestMapping("backType")
public class GoodsTypeBackController {
	
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService goodsTypeService;
	
	@RequestMapping("saveType")
	public String saveType(Goodstype goodsType, HttpSession session){
		session.setAttribute("msg", null);
		System.out.println(goodsType.getTypePid().getTypeId()+"#######");
		goodsType.setTypeLevel(2);
		goodsType.setTypePath("|"+goodsType.getTypePid().getTypeId()+"|"+goodsType.getTypeId()+"|");
		goodsTypeService.saveType(goodsType);
		
		Goodstype goodsType2=goodsTypeService.findByTypeId(goodsType.getTypeId());
		
		goodsType2.setTypePath("|"+goodsType.getTypePid().getTypeId()+"|"+goodsType2.getTypeId()+"|");
		goodsTypeService.updateType(goodsType2);
		
		System.out.println("#######下"+goodsType2.getTypeId());
		return "manager/product-category-add";
	}

}

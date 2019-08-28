package com.web.controller.font;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.Goodstype;
import com.web.service.GoodstypeService;

@Controller
@RequestMapping("path")
public class CommentsController {
	
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService goodstypeService;

	@RequestMapping("/{pathName}")
	public String path(@PathVariable("pathName")String pathName) {
		return pathName;
	}
	
	@RequestMapping("/{path1}/{path2}")
	public String paths(@PathVariable("path1")String pathName, @PathVariable("path2")String pathName2, HttpServletRequest request) {
		List<Goodstype> typeListMuying=goodstypeService.findAllMuying();
		List<Goodstype> typeListMeizhuang=goodstypeService.findAllMeizhuang();
		List<Goodstype> typeListJiaju=goodstypeService.findAllJiaju();
		List<Goodstype> typeListYinyang=goodstypeService.findAllYinyang();
		List<List<Goodstype>> typeList = new ArrayList<List<Goodstype>>();
		typeList.add(typeListMuying);
		typeList.add(typeListMeizhuang);
		typeList.add(typeListJiaju);
		typeList.add(typeListYinyang);
		request.setAttribute("typeList", typeList);
		return pathName+"/"+pathName2;
	}
	
}

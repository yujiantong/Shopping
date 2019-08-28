/*package com.web.controller.font;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.entity.Goods;
import com.web.entity.Goodstype;
import com.web.lucene.LuceneService;
import com.web.service.GoodstypeService;
import com.web.vo.KeyWord;

@Controller
@RequestMapping("LuceneController")
public class LuceneController {
	
	@Autowired
	@Qualifier("luceneService")
	private LuceneService luceneService;
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService goodstypeService;
	
	@RequestMapping("searchKeyWord")
	@ResponseBody
	public List<KeyWord> searchKeyWord(String q) {
		System.out.println("lucene测试Key======="+q);
		List<KeyWord> keywordList = luceneService.getTermKey(q);
		for (KeyWord keyWord : keywordList) {
			System.out.println(keyWord.getWord()+"\t"+keyWord.getNum());
		}
		return keywordList;
	}
	
	@RequestMapping("searchGoods")
	public String searchGoods(String sname, Model model, Integer page, HttpSession session) {
		System.out.println("lucene测试keyWord======="+sname);
		int countPage = this.luceneService.countPage(sname);
		if(page == null || page < 1)
			page = 1;
		if(page > countPage)
			page = countPage;
		List<Goods> goodsList = this.luceneService.query(sname, page);
		session.setAttribute("sname", sname);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("page", page);
		model.addAttribute("countPage", countPage);
		//商品类型
		List<Goodstype> typeListMuying=goodstypeService.findAllMuying();
		List<Goodstype> typeListMeizhuang=goodstypeService.findAllMeizhuang();
		List<Goodstype> typeListJiaju=goodstypeService.findAllJiaju();
		List<Goodstype> typeListYinyang=goodstypeService.findAllYinyang();
		List<List<Goodstype>> typeList = new ArrayList<List<Goodstype>>();
		typeList.add(typeListMuying);
		typeList.add(typeListMeizhuang);
		typeList.add(typeListJiaju);
		typeList.add(typeListYinyang);
		model.addAttribute("typeList", typeList);
		return "shop/luceneSearch";
	}
	
	@RequestMapping("searchGoodsNotPage")
	public String searchGoodsNotPage(String sname, Model model,HttpSession session) {
		System.out.println("lucene测试keyWord======="+sname);
		List<Goods> goodsList = this.luceneService.queryNotPage(sname);
		session.setAttribute("sname", sname);
		model.addAttribute("goodsList", goodsList);
		//商品类型
		List<Goodstype> typeListMuying=goodstypeService.findAllMuying();
		List<Goodstype> typeListMeizhuang=goodstypeService.findAllMeizhuang();
		List<Goodstype> typeListJiaju=goodstypeService.findAllJiaju();
		List<Goodstype> typeListYinyang=goodstypeService.findAllYinyang();
		List<List<Goodstype>> typeList = new ArrayList<List<Goodstype>>();
		typeList.add(typeListMuying);
		typeList.add(typeListMeizhuang);
		typeList.add(typeListJiaju);
		typeList.add(typeListYinyang);
		model.addAttribute("typeList", typeList);
		return "shop/luceneSearch";
	}

	public LuceneService getLuceneService() {
		return luceneService;
	}

	public void setLuceneService(LuceneService luceneService) {
		this.luceneService = luceneService;
	}
	
}
*/
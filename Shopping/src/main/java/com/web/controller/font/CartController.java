package com.web.controller.font;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.entity.Cart;
import com.web.entity.Footmark;
import com.web.entity.Goods;
import com.web.entity.Goodstype;
import com.web.entity.Users;
import com.web.service.CartService;
import com.web.service.FootmarkService;
import com.web.service.GoodsService;
import com.web.service.GoodstypeService;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	@Qualifier("CartService")
	private CartService cartService;
	@Autowired
	@Qualifier("GoodsService")
	private GoodsService goodsService;
	@Autowired
	@Qualifier("FootmarkService")
	private FootmarkService footmarkService;
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService goodstypeService;
	
	
	@RequestMapping("showCart")
	public String showCart(Model model,HttpSession session){
		boolean cartState=(Boolean) session.getAttribute("cartState");
		Users user=(Users) session.getAttribute("loginUsers");
		if(user!=null&&!"".equals(user)&&user.getUserId()!=null&&!"".equals(user.getUserId())){
			//用户已登录，
			if(cartState){
				//1 将cart表中的数据查出来,有就赋给cartList
				List<Cart> cartList=cartService.findCartGoodsByUserId(user.getUserId());
				//2查看session中是否有临时存储的
				List<Cart> cartList1=(List<Cart>) session.getAttribute("cartList");
				List<Cart> cartList3=new ArrayList<Cart>();
				if(cartList!=null&&cartList.size()>0){
					//cart表中有数据，放到cartList3中
					for(int i=0;i<cartList.size();i++){
						cartList3.add(cartList.get(i));
					}
				}
				if(cartList1!=null&&cartList1.size()>0){
					//session中有临时存放的商品，经过与cart表中对比去重，更新数量
					
					
					for(int i=0;i<cartList1.size();i++){
						boolean flag=true;//判别cartList1（session）中这商品是否cart表中也有
						for(int j=0;j<cartList.size();j++){
							if((cartList1.get(i).getCartGoods().getGoodsId()).equals(cartList.get(j).getCartGoods().getGoodsId())){
								//说明session中存放的这个商品数据库中有，更新数据库（改变数量）
								int n1=cartList.get(j).getCartNum();//数据库中的数量
								int n2=cartList1.get(i).getCartNum();//session中的数量
								cartList.get(j).setCartNum(n1+n2);
								int res=cartService.updateCartGoods(cartList.get(j));
								//再去更改cartList3中该商品的数量
								for (Cart cart : cartList3) {
									if(cart.getCartGoods().getGoodsId().equals(cartList.get(j).getCartGoods().getGoodsId())){
										cart.setCartNum(cartList.get(j).getCartNum());
										flag=false;//cartList1（session）中这商品cart表中也有,已修改完数量，可以看cartList1中下一个商品
									}
								}
							}
						}
						if(flag){
							cartList3.add(cartList1.get(i));
							cartList1.get(i).setCartUser(user);
							cartService.saveCart(cartList1.get(i));
						}
					}
				}
				for (Cart cart : cartList3) {
					Goods g=goodsService.findById(cart.getCartGoods().getGoodsId());
					cart.setCartGoods(g);
				}
				/*for (int i = 0; i < cartList1.size(); i++) {
					cartList1.remove(i);
				}*/
				cartList1.clear();
				/*cartList1.removeAll(cartList1);*/
				
				for (int i = 0; i < cartList3.size(); i++) {
					cartList1.add(cartList3.get(i));
				}
				/*boolean cartState=(Boolean) session.getAttribute("cartState");*/
				cartState=false;
				session.setAttribute("cartState", cartState);
				/*session.setAttribute("cartList", cartList1);*/
				model.addAttribute("cartList", cartList3);
				int goodsNum=0;
				for (Cart cart : cartList3) {
					goodsNum+=cart.getCartNum();
				}
				model.addAttribute("goodsNum", goodsNum);
			}else{
				List<Cart> cartList=(List<Cart>) session.getAttribute("cartList");
				int goodsNum=0;
				for (Cart cart : cartList) {
					goodsNum+=cart.getCartNum();
				}
				model.addAttribute("cartList", cartList);
				model.addAttribute("goodsNum", goodsNum);
			}
		}else if(user==null){
			//用户未登录，将session中的cartList拿出来放到model中
			List<Cart> cartList=(List<Cart>) session.getAttribute("cartList");
			int goodsNum=0;
			for (Cart cart : cartList) {
				goodsNum+=cart.getCartNum();
			}
			model.addAttribute("cartList", cartList);
			model.addAttribute("goodsNum", goodsNum);
		}
		//购物车及积分页的热销商品
		List<Footmark> cart_ReList=footmarkService.findAllCart_Re();
		model.addAttribute("cart_ReList", cart_ReList);
		//购物车及积分页的热销商品结束
		//导航栏类型start
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
				//导航栏类型end
		return "shop/gouwuche";
	}
	/**
	 * 将购物车中选中的放入cartToOrderList，如果取消选中，再移除
	 * @param model
	 * @param session
	 * @param goodsId
	 * @param type
	 * @return
	 */
	@RequestMapping("addGoodsToCartToOrderList")
	@ResponseBody
	public String addGoodsToCartToOrderList(Model model,HttpSession session,Integer goodsId,Integer type){
		System.out.println("addGoodsToCartToOrderList============"+goodsId+"===="+type);
		//type=1就是将这个goods加到CartToOrderList，2就是减 
		List<Cart> cartToOrderList=(List<Cart>) session.getAttribute("cartToOrderList");
		List<Cart> cartList=(List<Cart>) session.getAttribute("cartList");
		Cart cart=new Cart();
		if(type==1){
			for (int i = 0; i < cartList.size(); i++) {
				if(goodsId.equals(cartList.get(i).getCartGoods().getGoodsId())){
					cart=cartList.get(i);
					cartToOrderList.add(cart);
					System.out.println("存入addGoodsToCartToOrderList成功"+goodsId);
					return "success";
				}
			}
		}else if(type==2){
			for(int i=0;i<cartToOrderList.size();i++){
				if(goodsId.equals(cartToOrderList.get(i).getCartGoods().getGoodsId())){
					cartToOrderList.remove(i);
					System.out.println("删除存入addGoodsToCartToOrderList成功"+goodsId);
					return "success";
				}
			}
		}
		return "fail";
	}
	
	/**
	 * 先判断是否登录，登录后则将sesiion中的cartList中的数据录入到cart表里，
	 * 如果没有登录，就打到登录界面
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("readyToJieSuan1")
	public String readyToJieSuan1(Model model,HttpSession session){
		System.out.println("readyToJieSuan1============");
		Users user=(Users) session.getAttribute("loginUsers");
		if(user!=null&&user.getUserId()!=null){
			List<Cart> cartToOrderList=(List<Cart>) session.getAttribute("cartToOrderList");
			if(cartToOrderList.size()>=1){
				return "redirect:/ordersFont/readyToShowOrder";
			}else{
				return "redirect:/cart/showCart";
			}
		}
		return "shop/login";
	}
	@RequestMapping("deleteGoodsNum")
	public String deleteGoodsNum(Model model,HttpSession session,Integer goodsId){
		System.out.println("deleteGoodsNum============"+goodsId);
		Integer cartNum=(Integer) session.getAttribute("cartNum");
		List<Cart> cartList=(List<Cart>) session.getAttribute("cartList");
		for (int i = 0; i < cartList.size(); i++) {
			if(goodsId.equals(cartList.get(i).getCartGoods().getGoodsId())){
				cartNum=cartNum-cartList.get(i).getCartNum();
				session.setAttribute("cartNum", cartNum);
				cartList.remove(i);
			}
		}
		Users user=(Users) session.getAttribute("loginUsers");
		if(user!=null){
			List<Cart> cartList1=cartService.findCartGoodsByUserId(user.getUserId());
			for (Cart cart : cartList1) {
				if(goodsId.equals(cart.getCartGoods().getGoodsId())){
					int res=cartService.deleteCartByCartId(cart.getCartId());
				}
			}
		}
		
		return "redirect:/cart/showCart";
		
	}
	@RequestMapping("changeGoodsNum")
	@ResponseBody
	public Cart changeGoodsNum(Model model,HttpSession session,Integer goodsId,String type){
		System.out.println("changeGoodsNum============");
		System.out.println(goodsId);
		System.out.println(type);
		Integer cartNum=(Integer) session.getAttribute("cartNum");
		Cart c=new Cart();
		List<Cart> cartList=(List<Cart>) session.getAttribute("cartList");
		if("jia".equals(type)){
			for (Cart cart : cartList) {
				if(goodsId.equals(cart.getCartGoods().getGoodsId())){
					cart.setCartNum(cart.getCartNum()+1);
					cart.setCartPrice(cart.getCartNum()*cart.getCartGoods().getGoodsPrice());
					System.out.println(cart.getCartPrice());
					cartNum=cartNum+1;
					session.setAttribute("cartNum", cartNum);
					return cart;
				}
			}
			
		}else if("jian".equals(type)){
			for (Cart cart : cartList) {
				if(goodsId.equals(cart.getCartGoods().getGoodsId())){
					if(cart.getCartNum()>1){
					cart.setCartNum(cart.getCartNum()-1);
					cartNum=cartNum-1;
					session.setAttribute("cartNum", cartNum);
					cart.setCartPrice(cart.getCartNum()*cart.getCartGoods().getGoodsPrice());
					System.out.println(cart.getCartPrice());
					}else if(cart.getCartNum()==1){
						return cart;
					}
					return cart;
				}
			}
		}
		return c;
	}
	@RequestMapping("readyToJieSuan")
	@ResponseBody
	public String readyToJieSuan(Model model,HttpSession session,Integer goodsId){
		//System.out.println("readyToOrder++==================");
		System.out.println("goodsId="+goodsId);
		List<Cart> cartList=(List<Cart>) session.getAttribute("cartList");
		for (Cart cart : cartList) {
			if(goodsId.equals(cart.getCartGoods().getGoodsId())){
				double price=cart.getCartNum()*cart.getCartGoods().getGoodsPrice();
				return price+"";
			}
		}
		return "0";
	}
	/**
	 * 添加商品到购物车（不管登不登录都可以加）
	 * @param model
	 * @param goodsId
	 * @param session
	 * @return
	 */
	@RequestMapping("addGoodsToCart")
	@ResponseBody
	public String addGoodsToCart(Model model,int goodsId,HttpSession session,Integer goodsNum){
		System.out.println("addGoodsToCart+++++++++++++++++++");
		int num=0;
		Goods goods=this.goodsService.findById(goodsId);
		//获取购物车（从session）
		Integer cartNum=(Integer) session.getAttribute("cartNum");
		
		List<Cart> cartList=(List<Cart>) session.getAttribute("cartList");
		for (Cart cart : cartList) {
			if(goods.getGoodsId().equals(cart.getCartGoods().getGoodsId())){
				//该商品已经存在，只需要uapdate
				cart.setCartNum(cart.getCartNum()+goodsNum);
				cart.setCartPrice(cart.getCartGoods().getGoodsPrice()*cart.getCartNum());
				for (Cart cart2 : cartList) {
					num+=cart2.getCartNum();
				}
				cartNum=cartNum+goodsNum;
				session.setAttribute("cartNum", cartNum);
				return num+"";
			}
		}
		//该商品不存在
		Cart cart=new Cart();
		cart.setCartGoods(goods);
		cart.setCartNum(goodsNum);
		cart.setCartPrice(goods.getGoodsPrice());
		cart.setCartUser(null);
		cartList.add(cart);
		cartNum=cartNum+goodsNum;
		for (Cart cart1 : cartList) {
			num+=cart1.getCartNum();
		}
	    session.setAttribute("cartNum", cartNum);
	    Integer h=(Integer) session.getAttribute("cartNum");
		return num+"";
	}
	
	
	
}

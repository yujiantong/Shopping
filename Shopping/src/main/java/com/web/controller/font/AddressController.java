package com.web.controller.font;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.entity.Goodstype;
import com.web.entity.Toaddress;
import com.web.entity.Users;
import com.web.service.GoodstypeService;
import com.web.service.ToAddressService;

@Controller
@RequestMapping("ordersAddress")
public class AddressController {
	@Autowired
	@Qualifier("ToAddressService")
	private ToAddressService addressMapper;
	@Autowired
	@Qualifier("GoodstypeService")
	private GoodstypeService goodstypeService;
	
	
	@RequestMapping("addAddress")
	public String addAddress(Toaddress address,HttpSession session){
		System.out.println("addAddress========================");
		Toaddress address1=new Toaddress();
		address1.setAddressDesc(address.getAddressDesc());
		address1.setAddressName(address.getAddressName());
		address1.setAddressPhone(address.getAddressPhone());
		Users user=(Users) session.getAttribute("loginUsers");
		address1.setAddressUser(user);
		address1.setAddressState(1);
		addressMapper.saveAddress(address1);
		return "shop/saveSuccess";
	}
	@RequestMapping("addAddressFirst")
	public String addAddressFirst(){
		System.out.println("addAddressFirst========================");
		
		return "shop/addAddress";
	}
	@RequestMapping("deleteAddress1")
	public String deleteAddress1(Integer addressId,HttpSession session){
		System.out.println("deleteAddress================"+addressId);
		int res=addressMapper.deleteAddressByAddressId(addressId);
		return "redirect:/ordersFont/readyToShowOrder";
	}
	@RequestMapping("deleteAddress")
	public String deleteAddress(Integer addressId,HttpSession session){
		System.out.println("deleteAddress================"+addressId);
		int res=addressMapper.deleteAddressByAddressId(addressId);
		return "redirect:/ordersAddress/tiaoMyAddressJsp";
	}
	
	@RequestMapping("findAddressByAddressId")
	public String findAddressByAddressId(Integer addressId,Model model){
		System.out.println(addressId);
		Toaddress address=addressMapper.findByAddressId(addressId);
		model.addAttribute("address", address);
		return "shop/editAddress";
	}
	/*@RequestMapping("findAddressByAddressId")
	@ResponseBody
	public Toaddress findAddressByAddressId(Integer addressId){
		System.out.println(addressId);
		Toaddress address=addressMapper.findByAddressId(addressId);
		return address;
	}*/
	 
	/**
	 * 修改地址（只能改姓名地址电话）
	 * @param toaddress
	 * @return
	 */
	@RequestMapping("updateAddress")
	public String updateAddress(Toaddress toaddress){
		System.out.println("updateAddress====id===="+toaddress.getAddressId());
		Toaddress address=addressMapper.findByAddressId(toaddress.getAddressId());
		if(toaddress.getAddressDesc()!=null&&!"".equals(toaddress.getAddressDesc())){
			address.setAddressDesc(toaddress.getAddressDesc());
		}
		if(toaddress.getAddressName()!=null&&!"".equals(toaddress.getAddressName())){
			address.setAddressName(toaddress.getAddressName());
		}
		if(toaddress.getAddressPhone()!=null&&!"".equals(toaddress.getAddressPhone())){
			address.setAddressPhone(toaddress.getAddressPhone());
		}
		int res=addressMapper.updateAddress(address);
		Toaddress a=addressMapper.findByAddressId(toaddress.getAddressId());
		return "shop/saveSuccess";
	}
	@RequestMapping("updateAddress1")
	@ResponseBody
	public Toaddress updateAddress1(Integer addressId1,String addressDesc1,String addressName1,String addressPhone1){
		System.out.println("updateAddress====id===="+addressId1);
		Toaddress address=addressMapper.findByAddressId(addressId1);
		if(addressDesc1!=null&!"".equals(addressDesc1)){
			address.setAddressDesc(addressDesc1);
		}
		if(addressName1!=null&!"".equals(addressName1)){
			address.setAddressName(addressName1);
		}
		if(addressPhone1!=null&!"".equals(addressPhone1)){
			address.setAddressPhone(addressPhone1);
		}
		int res=addressMapper.updateAddress(address);
		Toaddress a=addressMapper.findByAddressId(addressId1);
		return a;
	}
	@RequestMapping("tiaoMyAddressJsp")
	public String tiaoMyAddressJsp(Model model,HttpSession session){
		System.out.println("tiaoMyAddressJsp=============================");
		Users user=(Users) session.getAttribute("loginUsers");
		List<Toaddress> addressList=addressMapper.findAddresByUserId(user.getUserId());
		model.addAttribute("addressList", addressList);
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
		return "shop/address";
	}
	@RequestMapping("changeAddressFirst")
	public String changeAddressFirst(Integer addressId,Model model){
		System.out.println("changeAddressFirst============"+addressId);
		Toaddress address=addressMapper.findByAddressId(addressId);
		model.addAttribute("address", address);
		return "shop/editAddress";
		
	}
	@RequestMapping("changeMorenAddress")
	@ResponseBody
	public String changeMorenAddress(Integer addresId,HttpSession session){
		Users user=(Users) session.getAttribute("loginUsers");
		List<Toaddress> addressList=addressMapper.findAddresByUserId(user.getUserId());
		for (Toaddress toaddress : addressList) {
			//先将用户名下的地址状态都设为2（不默认）
			toaddress.setAddressState(2);
			int res1=addressMapper.updateAddress(toaddress);
			if(addresId.equals(toaddress.getAddressId())){
				//找到我所选中的地址，将其状态改为1
				toaddress.setAddressState(1);
				int res=addressMapper.updateAddress(toaddress);
				if(res!=1){
					return "fail";
				}
			}
		}
		return "success";
		
	}
}

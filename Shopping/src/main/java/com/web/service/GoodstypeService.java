package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Goodstype;
import com.web.mapper.GoodstypeMapper;

@Service("GoodstypeService")
public class GoodstypeService {
	
	@Autowired
	@Qualifier("GoodstypeMapper")
	private GoodstypeMapper goodstypeMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goodstype> findByTypePid(Integer typePid){
		return goodstypeMapper.findByTypePid(typePid);
	}
	
	
	/**
	 * 更新商品类型
	 */
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int updateType(Goodstype goodsType){
		return goodstypeMapper.update(goodsType);
	}
	/**
	 * 添加商品类型
	 */
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	public int saveType(Goodstype goodsType){
		return goodstypeMapper.insert(goodsType);
	}
	/**
	 * 查找商品类型ID
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Goodstype findByTypeId(Integer typeId){
		return goodstypeMapper.findById(typeId);
	}
	
	/**
	 * 监听类型
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goodstype> findAll(){
		return goodstypeMapper.findAll();
	}
	/**
	 * 查询一
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goodstype> findAllMuying(){
		return goodstypeMapper.findAllMuying();
	}
	/**
	 * 查询二
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goodstype> findAllMeizhuang(){
		return goodstypeMapper.findAllMeizhuang();
	}
	
	/**
	 * 查询三
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goodstype> findAllJiaju(){
		return goodstypeMapper.findAllJiaju();
	}
	/**
	 * 查询四
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goodstype> findAllYinyang(){
		return goodstypeMapper.findAllYinyang();
	}
	/**
	 * 查询所有顶级类型
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Goodstype> findParent(){
		return goodstypeMapper.finAllParent();
	}

}

package com.web.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.web.entity.Funs;
import com.web.entity.Permissions;
import com.web.mapper.FunsMapper;
import com.web.mapper.PermissionsMapper;

@Service("FunsService")
public class FunsService {

	@Autowired
	@Qualifier("PermissionsMapper")
	private PermissionsMapper permissionsMapper;
	
	@Autowired
	@Qualifier("FunsMapper")
	private FunsMapper funsMapper;
	
	public List<Funs> funs(Integer roleId) {
		List<Permissions> permissionList = this.permissionsMapper.findByRole(roleId);
		List<Funs> funsList = new ArrayList<Funs>();
		for (Permissions permissions : permissionList) {
			Funs fun = this.funsMapper.findByFunsId(permissions.getPermissionFun().getFunId());
			fun.setFundsList(this.funsMapper.findByFunsPid(fun.getFunId()));
			funsList.add(fun);
		}
		return funsList;
	}
}

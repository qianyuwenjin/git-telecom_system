package org.wenjin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wenjin.entitly.Admin;
import org.wenjin.mapper.AdminUserMapper;
import org.wenjin.mapper.RoleMapper;
import org.wenjin.service.AdminUserService;

@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired
	private AdminUserMapper adminUserMapper;
	
	@Autowired
	private RoleMapper  roleMapper;
	
	@Override
	public List<Admin> selectAdminUsers() {
		List<Admin> lau = adminUserMapper.selectAdminUsers();
		return lau;
	}

	@Override
	public boolean insertAdminUser(Admin admin) {
		int a = adminUserMapper.insertAdminUser(admin);
		if(a != -1){
			admin.setAid(admin.getAid());
			adminUserMapper.insertAdminUserRole(admin);
		}
		if(a != -1) return true;
		else return false;
	}

	@Override
	public Admin selectAdminUserByAid(int aid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteAdminUser(int aid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateAdminUser(Admin admin) {
		// TODO Auto-generated method stub
		return false;
	}

}

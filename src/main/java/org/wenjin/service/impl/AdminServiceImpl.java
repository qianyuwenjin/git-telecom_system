package org.wenjin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wenjin.entitly.Admin;
import org.wenjin.entitly.Power;
import org.wenjin.entitly.Role;
import org.wenjin.mapper.AdminMapper;
import org.wenjin.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public Admin selectAdmin(Admin admin) {
		
		return adminMapper.selectAdmin(admin);
	}
	
	@Override
	public boolean updateAdminPwd(Admin admin) {
		int emp = adminMapper.updateAdminPwd(admin);
		if(emp>0) return true;
		return false;
	}
	
	@Override
	public boolean updateAdminInform(Admin admin) {
		int emp = adminMapper.updateAdminInform(admin);
		if(emp>0) return true;
		return false;
	}

}

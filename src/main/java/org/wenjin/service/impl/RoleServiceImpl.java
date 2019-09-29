package org.wenjin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wenjin.entitly.Power;
import org.wenjin.entitly.Role;
import org.wenjin.mapper.PowerMapper;
import org.wenjin.mapper.RoleMapper;
import org.wenjin.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired 
	private RoleMapper roleMapper;
	
	@Autowired
	private PowerMapper powerMapper;
	
	@Override
	public List<Role> selectRoles() {
		List<Role> lr = roleMapper.selectRoles();
		return lr;
	}

	@Override
	public List<Power> selectAddPowers() {
		List<Power> lp = powerMapper.selectAddPowers();
		return lp;
	}
	
	@Override
	public boolean insertRole(Role role) {
		int a = roleMapper.insertRole(role);	
		if(a !=-1){
			role.setRid(role.getRid());
			roleMapper.insertRolePower(role);
		}
		if(a != -1) return true;
		else return false;
	}
	
	@Override
	public List<Power> selectPowers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteRolePowerByRid(int rid) {
		int a = roleMapper.deleteRoleByRid(rid);
		int b = roleMapper.deleteRolePowerByRid(rid);
		if(a+b>=2) return true;
		else return false;
	}

	@Override
	public Role updateViewRoleByRid(int rid) {
		Role role1 = roleMapper.selectRoleByRid(rid);
		List<Power> lp = powerMapper.viwRolePowersByRid(rid);
		role1.setLp(lp);
		return role1;
	}
	
	@Override
	public boolean updateRole(Role role) {
		int a = roleMapper.updateRoleByRid(role);
		int b = roleMapper.deleteRolePowerByRid(role.getRid());
		int c = roleMapper.insertRolePower(role);
		if(a+b+c>=3) return true;
		else return false;
	}

}

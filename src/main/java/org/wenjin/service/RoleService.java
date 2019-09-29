package org.wenjin.service;

import java.util.List;

import org.wenjin.entitly.Power;
import org.wenjin.entitly.Role;

public interface RoleService {
	/**
	 * 查询角色信息包括角色所有权限
	 * @param role
	 * @return
	 */
	public List<Role> selectRoles();
	
	/**
	 * 查询pxs默认权限
	 * @return
	 */
	public List<Power>  selectPowers();
	
	/**
	 * 查询所有权限
	 * @return
	 */
	public List<Power>  selectAddPowers();
	
	/**
	 * 添加角色，包括关联表
	 * @param role
	 * @return
	 */
	public boolean insertRole(Role role);
	
	/**
	 * 通过rid删除角色信息以及角色权限关联信息
	 * @param rid
	 * @return
	 */
	public boolean deleteRolePowerByRid(int rid);
	
	/**
	 * 通过rid查询角色名和角色所有角色
	 * @param rid
	 * @return
	 */
	public Role updateViewRoleByRid(int rid);
	
	/**
	 * 修改角色信息
	 * @param role
	 * @return
	 */
	public boolean updateRole(Role role);
}

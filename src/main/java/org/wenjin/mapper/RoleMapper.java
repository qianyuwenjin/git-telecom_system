package org.wenjin.mapper;

import java.util.List;

import org.wenjin.entitly.Role;

public interface RoleMapper {
	/**
	 * 根据aid查询角色信息
	 * @param role
	 * @return
	 */
	public List<Role> selectRoleByAid(int aid);
	
	/**
	 * 查询角色所有信息
	 * @return
	 */
	public List<Role> selectRoles();
	
	/**
	 * 添加角色
	 * @return
	 */
	public int insertRole(Role role);
	
	/**
	 * 添加角色权限关联信息
	 * @param role
	 * @return
	 */
	public int insertRolePower(Role role);
	
	/**
	 * 通过角色ID删除角色信息
	 * @param rid
	 * @return
	 */
	public int deleteRoleByRid(int rid);
	
	/**
	 * 通过角色ID删除角色权限关联表中角色信息
	 * @param rid
	 * @return
	 */
    public int deleteRolePowerByRid(int rid);
    
    /**
	 * 通过角色ID查询角色信息
	 * @param rid
	 * @return
	 */
	public Role selectRoleByRid(int rid);
	
	/**
     * 通过角色ID修改角色信息
     * @param rid
     * @return
     */
    public int updateRoleByRid(Role role);
}

package org.wenjin.mapper;

import java.util.List;

import org.wenjin.entitly.Admin;

public interface AdminUserMapper {
	
	/**
	 * 查询所有管理员信息
	 * @return
	 */
	public List<Admin> selectAdminUsers();
	
	/**
	 * 通过管理员ID查询管理员信息
	 * @return
	 */
	public Admin selectAdminUserByAid(int aid);
	
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	public int insertAdminUser(Admin admin);
	
	/**
	 * 添加管理员角色关联信息
	 * @param admin
	 * @return
	 */
	public int insertAdminUserRole(Admin admin);
	
	/**
	 * 删除管理员
	 * @param aid
	 * @return
	 */
	public int deleteAdminUser(int aid);
	
	/**
	 * 删除管理员角色关联信息
	 * @param aid
	 * @return
	 */
	public int deleteAdminUserRole(int aid);
	
	/**
	 *修改管理员信息
	 * @param admin
	 * @return
	 */
	public int updateAdminUser(Admin admin);
	

}

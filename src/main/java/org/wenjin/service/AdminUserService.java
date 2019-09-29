package org.wenjin.service;

import java.util.List;

import org.wenjin.entitly.Admin;

public interface AdminUserService {

	/**
	 * 查询所有管理员信息
	 * @return
	 */
	public List<Admin> selectAdminUsers();
	
	/**
	 * 添加管理员包括其关联信息
	 * @param admin
	 * @return
	 */
	public boolean insertAdminUser(Admin admin);
	
	/**
	 * 通过管理员ID查询管理员信息
	 * @return
	 */
	public Admin selectAdminUserByAid(int aid);
	
	/**
	 * 删除管理员包括其关联信息
	 * @param aid
	 * @return
	 */
	public boolean deleteAdminUser(int aid);
	
	/**
	 * 修改管理员信息及其角色管理信息
	 * @param admin
	 * @return
	 */
	public boolean updateAdminUser(Admin admin);
}

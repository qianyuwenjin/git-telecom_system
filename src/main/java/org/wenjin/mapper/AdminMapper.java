package org.wenjin.mapper;

import org.wenjin.entitly.Admin;

public interface AdminMapper {
	
	/**
	 * 查询管理员信息
	 * @param admin
	 * @return
	 */
	public  Admin selectAdmin(Admin admin);	
	
	/**
	 * 修改管理员密码
	 * @param admin
	 * @return
	 */
	public  int  updateAdminPwd(Admin admin);
	
	/**
	 * 修改管理员信息
	 * @param admin
	 * @return
	 */
	public  int  updateAdminInform(Admin admin);

}

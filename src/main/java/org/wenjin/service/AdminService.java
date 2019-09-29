package org.wenjin.service;

import org.wenjin.entitly.Admin;

public interface AdminService {
	
	/**
	 * 操作管理员业务
	 * @param admin 
	 * @return
	 */
	public  Admin selectAdmin(Admin admin);	
	
	/**
     * 修改管理员密码
     * @param admin
     * @return
     */
	public boolean  updateAdminPwd(Admin admin);
	
	/**
	 * 修改管理员信息
	 * @param admin
	 * @return
	 */
	public  boolean  updateAdminInform(Admin admin);
}

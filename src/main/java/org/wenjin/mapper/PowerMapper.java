package org.wenjin.mapper;

import java.util.List;

import org.wenjin.entitly.Power;

public interface PowerMapper {
	
	/**
	 * 通过管理员ID查询所有权限
	 * @param aid
	 * @return
	 */
    public  List<Power> selectPowerByAid(int aid);
    
    /**
     * 通过角色ID查询pxs默认权限
     * @param rid
     * @return
     */
    public  List<Power> selectPowerByRid(int rid);
    
    /**
     * 通过角色ID查询所有权限
     * @param rid
     * @return
     */
    public  List<Power> viwRolePowersByRid(int rid);
    
    /**
     * 查询所有权限
     * @return
     */
    public  List<Power> selectAddPowers();
}

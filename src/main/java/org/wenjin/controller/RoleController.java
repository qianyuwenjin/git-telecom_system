package org.wenjin.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wenjin.entitly.Power;
import org.wenjin.entitly.Role;
import org.wenjin.service.RoleService;

@Controller
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/selectRoles")
	public  String  selectRoles(HttpServletRequest request){
		List<Role> lr = roleService.selectRoles();
		request.getSession().setAttribute("roles", lr);
		return "/role/role_list";
	}
	
	@RequestMapping("/role/AddPowers")
	public  String addPowers(HttpServletRequest request){
		List<Power> lp = roleService.selectAddPowers();
		request.setAttribute("powers", lp);
		return "/role/role_add";
	}
	
	@RequestMapping("/role/addRole")
	public String addRole(HttpServletRequest request){
		String rolename = request.getParameter("rolename");
		String[] powername = request.getParameterValues("powername");
		String createuser = request.getParameter("adminname");
		Date createtime = new Date(new java.util.Date().getTime());
		List<Power> lp = new ArrayList<Power>();
		for(String s : powername){
			Power power = new Power();
			power.setPid(Integer.parseInt(s));
			lp.add(power);
		}
		Role r = new Role();
		r.setRname(rolename);
		r.setLp(lp);
		r.setCreateUser(createuser);
		r.setCreateTime(createtime);
		boolean success = roleService.insertRole(r);
		if(success){
			request.setAttribute("ook", "恭喜您，添加成功!");
		}else{
			request.setAttribute("ook", "添加失败!");
		}    
		return "/role/role_add";
	}
	
	@RequestMapping("/deleteRole")
	public  String  deleteRole(String rid){
		boolean success = roleService.deleteRolePowerByRid(Integer.parseInt(rid));
		if(success){
			return "redirect:selectRoles";
		}
		return null;
	}
	
	@RequestMapping("/updateViewRole")
	public String updateViewRole(HttpServletRequest request,String rid){
		List<Power> lp = roleService.selectAddPowers();	
		Role role = roleService.updateViewRoleByRid(Integer.parseInt(rid));	
		request.setAttribute("powerlist", lp);
		request.setAttribute("role", role);
		return "/role/role_modi";
	}
	
	@RequestMapping("/updateRole")
	public String updateRole(HttpServletRequest request){
		String rid = request.getParameter("rid");
		String rolename = request.getParameter("rolename");
		String updateuser = request.getParameter("aname");
		String[] powername = request.getParameterValues("powername");
		Date updatetime = new Date(new java.util.Date().getTime());
		List<Power> lp = new ArrayList<Power>();
		for(String s : powername){
			Power p = new Power();
			p.setPid(Integer.parseInt(s));
			lp.add(p);
		}
		Role r = new Role();
		r.setRid(Integer.parseInt(rid));
		r.setRname(rolename);
		r.setUpdateUser(updateuser);
		r.setUpdateTime(updatetime);
		r.setLp(lp);
		boolean success = roleService.updateRole(r);
		if(success){
			request.setAttribute("ook", "修改成功!");
		}else{
			request.setAttribute("ook", "修改失败!");
		}
		return "role/role_modi";
	}

}

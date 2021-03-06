package org.wenjin.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.Charsets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.wenjin.entitly.Admin;
import org.wenjin.entitly.Role;
import org.wenjin.service.AdminUserService;
import org.wenjin.service.RoleService;

//import com.google.common.base.Charsets;
//import com.google.common.hash.Hashing;

@Controller
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;

	@Autowired
	private RoleService roleService;

	@RequestMapping("/selectAdminUsers")
	public  String  selectAdminUsers(HttpServletRequest request){
		List<Admin> lau = adminUserService.selectAdminUsers();
		request.getSession().setAttribute("adminuser", lau);
		return "/admin/admin_list";
	}

	@RequestMapping("/addAdminRoles")
	public  String  addAdminRoles(HttpServletRequest request){
		List<Role> lr = roleService.selectRoles();
		request.setAttribute("role", lr);
		return "/admin/admin_add";
	}

	@RequestMapping("/addAdmin")
	public  String addAdmin(HttpServletRequest request) throws Exception{
		String aname = request.getParameter("aname");
		String acname = request.getParameter("acname");
		String apwd = request.getParameter("apwd");
		String aphone = request.getParameter("aphone");
		String aemail = request.getParameter("aemail");
		String[] roles = request.getParameterValues("rolename");
		String adminname = request.getParameter("dlname");
		Date createtime = new Date(new java.util.Date().getTime());

		//把简单的Http请求转成处理文件上传的请求
		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) request;
		//可以通过getFile方法获取到上传的文件
		MultipartFile file = mreq.getFile("userimg");
		//设置文件上传到服务器的路径
		String path ="/adminimg/"+file.getOriginalFilename();
		List<Role> lr = new ArrayList<Role>();
		for(String s: roles){
			Role r = new Role();
			r.setRid(Integer.parseInt(s));
			lr.add(r);
		}
		Admin admin = new Admin();
		admin.setAname(aname);
		admin.setAcname(acname);
//		admin.setApwd(Hashing.md5().hashString(apwd, Charsets.UTF_8).toString());
        admin.setApwd(apwd);
		admin.setAphone(aphone);
		admin.setAemail(aemail);
		admin.setLir(lr);
		admin.setCreateUser(adminname);
		admin.setCreateTime(createtime);
		admin.setAimg(path);

		boolean success = adminUserService.insertAdminUser(admin);
		if(success){
			InputStream is = file.getInputStream();
			FileOutputStream fos = new FileOutputStream(request.getServletContext().getRealPath("/adminimg/")+file.getOriginalFilename());
			int emp = 0;
			byte[] store = new byte[1024];
				 while((emp=is.read(store))!=-1){
					fos.write(store,0,emp);
				}
				is.close();
				fos.close();
			request.setAttribute("act", "添加成功!");
		}else{
			request.setAttribute("act", "添加失败!");
		}
		return "/admin/admin_add";
	}

	@RequestMapping("/deleteAdmin")
	public  String  deleteAdmin(HttpServletRequest request){
		String aid = request.getParameter("adminid");
		boolean success = adminUserService.deleteAdminUser(Integer.parseInt(aid));
		return "forward:/selectAdminUsers";
	}

	@RequestMapping("/updateViewAdmin")
	public  String updateViewAdmin(HttpServletRequest request){
		String aid = request.getParameter("adminid");
		List<Role> lr = roleService.selectRoles();
		Admin adminuser = adminUserService.selectAdminUserByAid(Integer.parseInt(aid));
		request.setAttribute("adminuser", adminuser);
		request.setAttribute("role", lr);
		return "admin/admin_modi";
	}

	@RequestMapping("/updateAdmin")
	public  String updateAdmin(HttpServletRequest request) throws Exception{
		String aid = request.getParameter("adminuseraid");
		String ausername = request.getParameter("adminuseraname");
		String acname = request.getParameter("adminuseracname");
		String aphone = request.getParameter("adminuseraphone");
		String aemail = request.getParameter("adminuseraemail");
		String[] roles = request.getParameterValues("adminuserrolename");
		String adminname = request.getParameter("dlname1");
		Date updatetime = new Date(new java.util.Date().getTime());

		//把简单的Http请求转成处理文件上传的请求
		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) request;
		//可以通过getFile方法获取到上传的文件
		MultipartFile file = mreq.getFile("adminuserimg");
		//设置文件上传到服务器的路径
		String path ="/adminimg/"+file.getOriginalFilename();
		List<Role> lr = new ArrayList<Role>();
		for(String s: roles){
			Role r = new Role();
				r.setRid(Integer.parseInt(s));
				lr.add(r);
			}
		Admin admin = new Admin();
		admin.setAid(Integer.parseInt(aid));
		admin.setAname(ausername);
		admin.setAcname(acname);
		admin.setAphone(aphone);
		admin.setAemail(aemail);
		admin.setLir(lr);
		admin.setUpdateUser(adminname);
		admin.setUpdateTime(updatetime);
		admin.setAimg(path);

		boolean success = adminUserService.updateAdminUser(admin);
		if(success){
			InputStream is = file.getInputStream();
			FileOutputStream fos = new FileOutputStream(request.getServletContext().getRealPath("/adminimg/")+file.getOriginalFilename());
			int emp = 0;
			byte[] store = new byte[1024];
				 while((emp=is.read(store))!=-1){
					fos.write(store,0,emp);
				}
				is.close();
				fos.close();
			request.setAttribute("ook", "修改成功!");
		}else{
			request.setAttribute("ook", "修改失败!");
		}
		return "forward:/selectAdminUsers";
	}


}

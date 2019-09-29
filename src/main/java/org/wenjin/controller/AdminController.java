package org.wenjin.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wenjin.entitly.Admin;
import org.wenjin.service.AdminService;

import com.google.common.base.Charsets;
import com.google.common.hash.Hashing;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/loginAdmin")
	public String loginAdmin(String acname,String apwd,HttpSession session,HttpServletRequest request){
		String code = request.getParameter("code");
		String valiCode = (String) request.getSession().getAttribute("valiCode");
		//if(code.equalsIgnoreCase(valiCode)){
			Admin selectAdmin = adminService.selectAdmin(new Admin(acname,Hashing.md5().hashString(apwd, Charsets.UTF_8).toString()));
			if(selectAdmin != null){
				session.setAttribute("admin1", selectAdmin);				
				return "index";
			}
			session.setAttribute("adminError","用户名密码错误");
			return "forward:login.jsp";
		//}
		//session.setAttribute("adminError","对不起，验证码错误，请重新输入");
		//return "forward:login.jsp";
	}
	
	@RequestMapping("/code")
	public void code(HttpServletRequest request,HttpServletResponse response) throws IOException{
		BufferedImage image = new BufferedImage(70, 30, BufferedImage.TYPE_INT_RGB);
		Graphics g =image.getGraphics();
		g.setColor(Color.PINK);
		g.fillRect(0, 0, 80, 30);
		g.setFont(new Font("黑体", Font.BOLD, 23));
		Random r = new Random();
		String str = "ABCDEFGHJKLMNPQRSTUVWXZYabcdefghjkmnpqrstuvwxyz23456789";
		g.setColor(Color.black);
		for(int j = 0 ;j < 100 ; j++) {
			int x = r.nextInt(70);
			int y = r.nextInt(30);
			g.drawLine(x,y,x+r.nextInt(3), y+r.nextInt(3));
		}
		StringBuffer sbuffer = new StringBuffer();
		for(int i = 0;i < 4; i++) {
			char c = str.charAt(r.nextInt(str.length()));
			g.setColor(new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255)));
			g.drawString(c+"", 12*i+10, 20);
			sbuffer.append(c);
		}
		request.getSession().setAttribute("valiCode", sbuffer.toString());
		ImageIO.write(image, "png", response.getOutputStream());
	}
	
	@RequestMapping("/updateAdminPwd")
	public String updateAdminPwd(String newpwd,String lowpwd,HttpSession session,HttpServletRequest request){
		Admin admin = (Admin) request.getSession().getAttribute("admin1");
		String mdlowpwd = Hashing.md5().hashString(lowpwd, Charsets.UTF_8).toString();
		if(mdlowpwd.equals(admin.getApwd())){
			boolean success = adminService.updateAdminPwd(new Admin(admin.getAid(),Hashing.md5().hashString(newpwd, Charsets.UTF_8).toString()));
			if(success){
				return "forward:login.jsp";
			}else{
				session.setAttribute("pwdError", "修改失败!");
				return "user/user_modi_pwd";
			}
		}else{
			session.setAttribute("pwdError", "旧密码错误!");
			return "user/user_modi_pwd";
		}
	}
	
	@RequestMapping("/updateAdminInform")
	public  String updateAdminInform(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		String aname = request.getParameter("adminname");
		String aphone = request.getParameter("adminphone");
		String aemail = request.getParameter("adminemail");
		String aid = request.getParameter("adminid");
		Date date = new Date(new java.util.Date().getTime());
		Admin admin = (Admin) request.getSession().getAttribute("admin1");
		admin.setUpdateUser(aname);
		admin.setUpdateTime(date);
		admin.setAname(aname);
		admin.setAphone(aphone);
		admin.setAemail(aemail);
		admin.setAid(Integer.parseInt(aid));
		boolean success = adminService.updateAdminInform(admin);
		if(success){			
			response.getWriter().print("yes");
			return "user/user_info";
		}else{
			response.getWriter().print("no");
			return "user/user_info";
		}
	}
}

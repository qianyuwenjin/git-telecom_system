package org.wenjin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wenjin.entitly.Admin;
import org.wenjin.service.RoleService;

@Controller
public class IndexController {
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/index")
	public  String  indexAdmin(){
		return "index";
	}
	
	@RequestMapping("/fee_list")
	public  String  selectFee(){
		return "/fee/fee_list";
	}
	
	
	@RequestMapping("/account_list")
	public  String  selectAccount(){
		return "/account/account_list";
	}
	
	@RequestMapping("/service_list")
	public  String  selectService(){
		return "/service/service_list";
	}
	
	@RequestMapping("/bill_list")
	public  String  selectBill(){
		return "/bill/bill_list";
	}
	
	
	@RequestMapping("/report_list")
	public  String  selectReport(){
		return "/report/report_list";
	}
	@RequestMapping("/user_modi_pwd")
	public  String  user_modi_pwd(){
		return "user/user_modi_pwd";
	}
	
	@RequestMapping("/user_info")
	public  String  user_info(HttpServletRequest request){
		Admin admin1 = (Admin)request.getSession().getAttribute("admin1");
		return "user/user_info";
	}
}

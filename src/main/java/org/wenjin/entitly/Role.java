package org.wenjin.entitly;

import java.sql.Date;
import java.util.List;

public class Role {
     private int rid;
     private String rname;
     private int pxs;
     private Admin admin;
     
     private List<Power> lp;
     
	 private String createUser;
     private Date createTime;
     private String updateUser;
     private Date updateTime;
     
     private String by01;
     private String by02;
     private int by03;
     private Date by04;
     
    public  String getPname(){
 		String rn = "";
 		for(int i=0; i<lp.size();i++ ){
 			if(i == lp.size()-1){
 				rn+=lp.get(i).getPname();
 			}else{
 				rn+=lp.get(i).getPname()+"、";
 			}
 		}
 		return rn;
 	}
     

	public int getPxs() {
		return pxs;
	}


	public void setPxs(int pxs) {
		this.pxs = pxs;
	}


	public Admin getAdmin() {
		return admin;
	}


	public void setAdmin(Admin admin) {
		this.admin = admin;
	}


	public List<Power> getLp() {
 		return lp;
 	}
 	public void setLp(List<Power> lp) {
 		this.lp = lp;
 	} 
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getBy01() {
		return by01;
	}
	public void setBy01(String by01) {
		this.by01 = by01;
	}
	public String getBy02() {
		return by02;
	}
	public void setBy02(String by02) {
		this.by02 = by02;
	}
	public int getBy03() {
		return by03;
	}
	public void setBy03(int by03) {
		this.by03 = by03;
	}
	public Date getBy04() {
		return by04;
	}
	public void setBy04(Date by04) {
		this.by04 = by04;
	}
     
     
}

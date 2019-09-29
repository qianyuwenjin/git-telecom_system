package org.wenjin.entitly;

import java.sql.Date;
import java.util.List;

public class Admin {
	/**
	 * 管理员实体信息
	 */
	private int aid;
	private String aname;
	private String apwd;
	private String acname;
	private String aphone;
	private String aemail;
	private String aimg;
	private List<Power> lip;
	private List<Role> lir;
	
	private String createUser;
    private Date createTime;
    private String updateUser;
    private Date updateTime;
    
    private String by01;
    private String by02;
    private int by03;
    private Date by04;
    
    private int rid;
    
    
	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public Admin() {
	}
	
	public  String getRname(){
		String rn = "";
		for(int i=0; i<lir.size();i++ ){
			if(i == lir.size()-1){
				rn+=lir.get(i).getRname();
			}else{
				rn+=lir.get(i).getRname()+"、";
			}
		}
		return rn;
	}
	
	public String getRname1(){
		String rname = lir.get(0).getRname();
		return rname;	
	}
	public Admin(String acname,String apwd) {
		this.acname = acname;
		this.apwd = apwd;
	}
	
	


	public Admin(int aid, String apwd) {
		super();
		this.aid = aid;
		this.apwd = apwd;
	}

	public List<Role> getLir() {
		return lir;
	}


	public void setLir(List<Role> lir) {
		this.lir = lir;
	}


	public List<Power> getLip() {
		return lip;
	}

	public void setLip(List<Power> lip) {
		this.lip = lip;
	}


	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getApwd() {
		return apwd;
	}
	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
	public String getAcname() {
		return acname;
	}
	public void setAcname(String acname) {
		this.acname = acname;
	}
	public String getAphone() {
		return aphone;
	}
	public void setAphone(String aphone) {
		this.aphone = aphone;
	}
	public String getAemail() {
		return aemail;
	}
	public void setAemail(String aemail) {
		this.aemail = aemail;
	}
	public String getAimg() {
		return aimg;
	}
	public void setAimg(String aimg) {
		this.aimg = aimg;
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

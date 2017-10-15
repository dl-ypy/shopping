package com.ypy.shopping.model;

import java.sql.Date;

public class Manager {
	 private int mid;      
	 private String musername;
	 private String mpassword;
	 private String mtruename;
	 private String msex;     
	 private int mlevel;   
	 private Date mdate;
	public Manager() {
		super();
	}
	public Manager(int mid, String musername, String mpassword, String mtruename, String msex, int mlevel,
			Date mdate) {
		super();
		this.mid = mid;
		this.musername = musername;
		this.mpassword = mpassword;
		this.mtruename = mtruename;
		this.msex = msex;
		this.mlevel = mlevel;
		this.mdate = mdate;
	}
	@Override
	public String toString() {
		return "ManageBean [mid=" + mid + ", musername=" + musername + ", mpassword=" + mpassword + ", mtruename="
				+ mtruename + ", msex=" + msex + ", mlevel=" + mlevel + ", mdate=" + mdate + "]";
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMusername() {
		return musername;
	}
	public void setMusername(String musername) {
		this.musername = musername;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMtruename() {
		return mtruename;
	}
	public void setMtruename(String mtruename) {
		this.mtruename = mtruename;
	}
	public String getMsex() {
		return msex;
	}
	public void setMsex(String msex) {
		this.msex = msex;
	}
	public int getMlevel() {
		return mlevel;
	}
	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	} 
	 

}

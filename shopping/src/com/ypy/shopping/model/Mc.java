package com.ypy.shopping.model;

import java.math.BigDecimal;
import java.sql.Date;

public class Mc {
	private int mcid;       
	private String mcname;     
	private String mcdecx;//描述     
	private double price;      
	private String pic;//图片描述        
	private String flag;//是否缺货   1表示缺货 0表示不缺货    
	private int smalltypeid;//小类编号
	private Date createdate; //上架时间
	private int quantity;//库存数量   
	private int count;   //购物车中商品数量，虚拟的，数据库中没有的
	private double totalPrice;   //购物车中该商品总价格，虚拟的，数据库中没有的
	
	/**
	 * 因为double存储不完全，需要用BigDecimal类型
	 * @return
	 */
	public double getTotalPrice() {
		BigDecimal bPrice = new BigDecimal(Double.toString(price));
		BigDecimal bCount = new BigDecimal(Integer.toString(count));
		return bPrice.multiply(bCount).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Mc(int mcid) {
		super();
		this.mcid = mcid;
	}
	public Mc(String mcname, String mcdecx, double price, String pic, String flag, int smalltypeid, Date createdate,
			int quantity) {
		super();
		this.mcname = mcname;
		this.mcdecx = mcdecx;
		this.price = price;
		this.pic = pic;
		this.flag = flag;
		this.smalltypeid = smalltypeid;
		this.createdate = createdate;
		this.quantity = quantity;
	}
	public Mc() {
		super();
	}
	public Mc(int mcid, String mcname, String mcdecx, double price, String pic, String flag, int smalltypeid,
			Date createdate, int quantity) {
		super();
		this.mcid = mcid;
		this.mcname = mcname;
		this.mcdecx = mcdecx;
		this.price = price;
		this.pic = pic;
		this.flag = flag;
		this.smalltypeid = smalltypeid;
		this.createdate = createdate;
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "Mc [mcid=" + mcid + ", mcname=" + mcname + ", mcdecx=" + mcdecx + ", price=" + price + ", pic=" + pic
				+ ", flag=" + flag + ", smalltypeid=" + smalltypeid + ", createdate=" + createdate + ", quantity="
				+ quantity + "]";
	}
	public int getMcid() {
		return mcid;
	}
	public void setMcid(int mcid) {
		this.mcid = mcid;
	}
	public String getMcname() {
		return mcname;
	}
	public void setMcname(String mcname) {
		this.mcname = mcname;
	}
	public String getMcdecx() {
		return mcdecx;
	}
	public void setMcdecx(String mcdecx) {
		this.mcdecx = mcdecx;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public int getSmalltypeid() {
		return smalltypeid;
	}
	public void setSmalltypeid(int smalltypeid) {
		this.smalltypeid = smalltypeid;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}

package com.telusko;

public class item {
	private int item_id;
	private String category;
	private String item_name;
	private String brand;
	private int unit_price;
	private int unit_count;
	private int discount;
	private String link;
	private String s_id;	
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getid() {
		return item_id;
	}
	public String getcategory() {
		return category;
	}
	public String getname() {
		return item_name;
	}
	public String getbrand() {
		return brand;
	}
	public int getprice() {
		return unit_price;
	}
	public int getcount() {
		return unit_count;
	}
	public int getdiscount() {
		return discount;
	}
	public String getsid() {
		return s_id;
	}
	public void setid(int item_id) {
		this.item_id=item_id;
	}
	public void setname(String item_name) {
		this.item_name=item_name;
	}
	public void setcategory(String category) {
		this.category=category;
	}
	public void setbrand(String brand) {
		this.brand=brand;
	}
	public void setprice(int unit_price) {
		this.unit_price=unit_price;
	}
	public void setcount(int unit_count) {
		this.unit_count=unit_count;
	}
	public void setdiscount(int discount) {
		this.discount=discount;
	}
	public void setsid(String s_id) {
		this.s_id=s_id;
	}
}

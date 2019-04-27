package com.telusko;

public class supplier {
	private String user_id;
	private String name;
	private String owner;
	private String reg_id;
	private String address;
	private String contact;
	private String email;
	private String password;
	
	public String getuser() {
		return user_id;
	}
	public void setuser(String user_id) {
		this.user_id=user_id;
	}
	public String getusername() {
		return name;
	}
	public void setusername(String name) {
		this.name=name;
	}
	public String getowner() {
		return owner;
	}
	public void setowner(String owner) {
		this.owner=owner;
	}
	public String getregno() {
		return reg_id;
	}
	public void setregno(String reg_id) {
		this.reg_id=reg_id;
	}
	public String getaddress() {
		return address;
	}
	public void setaddress(String address) {
		this.address=address;
	}
	public String getcontact() {
		return contact;
	}
	public void setcontact(String contact) {
		this.contact=contact;
	}
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email=email;
	}
	public String getpassword() {
		return password;
	}
	public void setpassword(String password) {
		this.password=password;
	}

}

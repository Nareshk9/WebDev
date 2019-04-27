package com.telusko;

public class comments {

	private String user_id;
	private int item_id;
	private String message;
	
	public String getuser() {
		return user_id;
	}
	public int getitem() {
		return item_id;
	}
	public String getmessage() {
		return message;
	}
	public void setuser(String user_id) {
		this.user_id=user_id;
	}
	public void setitem(int item_id) {
		this.item_id=item_id;
	}
	public void setmessage(String message) {
		this.message=message;
	}
}

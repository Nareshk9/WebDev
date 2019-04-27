package com.telusko;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class userDao {
	public void register(user s) throws SQLException, ClassNotFoundException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="insert into users(user_id,username,address,contact,email,password) values(?,?,?,?,?,?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, s.getuser());
		st.setString(2, s.getusername());
		st.setString(3, s.getaddress());
		st.setString(4, s.getcontact());
		st.setString(5, s.getemail());
		st.setString(6, s.getpassword());
		
		int rs=st.executeUpdate();
		
		st.close();
		con.close();
		
	}
	public boolean checklogin(login l) throws SQLException, ClassNotFoundException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from users where user_id=? and password=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, l.getid());
		st.setString(2, l.getpassword());
		ResultSet rs=st.executeQuery();
		
		if(rs.next()) {
			st.close();
			con.close();
			return true;
		}
		else {
			st.close();
			con.close();
			return false;
		}	
	}
	public user get_profile(String u) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from users where user_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, u);

		ResultSet rs=st.executeQuery();
		rs.next();
		user i= new user();
		i.setuser(rs.getString("user_id"));
		i.setusername(rs.getString("username"));
		i.setaddress(rs.getString("address"));
		i.setcontact(rs.getString("contact"));
		i.setemail(rs.getString("email"));
		i.setpassword(rs.getString("password"));
		
		st.close();
		con.close();
		return (i);

	}
	public int update(user u) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="update users set username=?,address=?,contact=?,email=?,password=? where user_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(6, u.getuser());
		st.setString(1, u.getusername());
		st.setString(2, u.getaddress());
		st.setString(3, u.getcontact());
		st.setString(4, u.getemail());
		st.setString(5, u.getpassword());

		int rs=st.executeUpdate();
		st.close();
		con.close();
		return (rs);
	}
	public ArrayList<String> userorders(String s) throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select order_id from orders where user_id=? order by instant desc";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, s);
		ArrayList<String> it= new ArrayList<String>();
		ResultSet rs=st.executeQuery();
		while(rs.next()) {
			it.add(rs.getString(1));
		}
		st.close();
		con.close();
		return (it);
	}
	public ArrayList<order> userorderdetails(int b) throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select items.s_id,items.item_id,items.item_name,items.discount,items.unit_price,places.item_count from items,places,orders where items.item_id=places.item_id and places.order_id=orders.order_id and orders.order_id=?";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setInt(1, b);
		ArrayList<order> it= new ArrayList<order>();
		ResultSet rs=st.executeQuery();
		while(rs.next()) {
			order o=new order();
			o.setUser_id(rs.getString(1));
			o.setItem_id(rs.getInt(2));
			o.setItem_name(rs.getString(3));
			o.setPrice(rs.getInt(4));
			o.setDiscount(rs.getInt(5));
			o.setItem_count(rs.getInt(6));
			o.setTotal(o.getItem_count()*o.getPrice());
			it.add(o);
		}
		st.close();
		con.close();
		return (it);
	}

}

package com.telusko;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class adminDao {
	public boolean checklogin(login l) throws SQLException, ClassNotFoundException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from superusers where user_id=? and pass=?";
		
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
	public ArrayList<supplier> suppliers() throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from suppliers";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet rs=st.executeQuery(query);
		ArrayList<supplier> s = new ArrayList<supplier>();
		while(rs.next()) {
			supplier sp=new supplier();
			sp.setuser(rs.getString("user_id"));
			sp.setusername(rs.getString("username"));
			sp.setowner(rs.getString("owner"));
			sp.setregno(rs.getString("owner"));
			sp.setaddress(rs.getString("address"));
			sp.setcontact(rs.getString("contact"));
			sp.setemail(rs.getString("email"));
			sp.setpassword(rs.getString("password"));
			s.add(sp);
		}
		st.close();
		con.close();
		return(s);
	}
	public ArrayList<user> users() throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from users";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet rs=st.executeQuery(query);
		ArrayList<user> s = new ArrayList<user>();
		while(rs.next()) {
			user sp=new user();
			sp.setuser(rs.getString("user_id"));
			sp.setusername(rs.getString("username"));
			sp.setaddress(rs.getString("address"));
			sp.setcontact(rs.getString("contact"));
			sp.setemail(rs.getString("email"));
			sp.setpassword(rs.getString("password"));
			s.add(sp);
		}
		st.close();
		con.close();
		return(s);
	}
}

package com.telusko;
import java.sql.*;

public class supplierDao {
	public void register(supplier s) throws SQLException, ClassNotFoundException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="insert into suppliers(user_id,username,owner,reg_id,address,contact,email,password) values(?,?,?,?,?,?,?,?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, s.getuser());
		st.setString(2, s.getusername());
		st.setString(3, s.getowner());
		st.setString(4, s.getregno());
		st.setString(5, s.getaddress());
		st.setString(6, s.getcontact());
		st.setString(7, s.getemail());
		st.setString(8, s.getpassword());
		
		int rs=st.executeUpdate();
		
		st.close();
		con.close();
		
	}
	public boolean checklogin(login l) throws SQLException, ClassNotFoundException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from suppliers where user_id=? and password=?";
		
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
	public supplier get_profile(String u) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from suppliers where user_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, u);

		ResultSet rs=st.executeQuery();
		rs.next();
		supplier i= new supplier();
		i.setuser(rs.getString("user_id"));
		i.setusername(rs.getString("username"));
		i.setowner(rs.getString("owner"));
		i.setregno(rs.getString("reg_id"));
		i.setaddress(rs.getString("address"));
		i.setcontact(rs.getString("contact"));
		i.setemail(rs.getString("email"));
		i.setpassword(rs.getString("password"));
		
		st.close();
		con.close();
		return (i);

	}
	public int update(supplier u) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="update suppliers set username=?,owner=?,reg_id=?,address=?,contact=?,email=?,password=? where user_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(8, u.getuser());
		st.setString(1, u.getusername());
		st.setString(2, u.getowner());
		st.setString(3, u.getregno());
		st.setString(4, u.getaddress());
		st.setString(5, u.getcontact());
		st.setString(6, u.getemail());
		st.setString(7, u.getpassword());

		int rs=st.executeUpdate();
		st.close();
		con.close();
		return (rs);
	}
}

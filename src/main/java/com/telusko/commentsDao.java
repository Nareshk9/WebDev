package com.telusko;

import java.sql.*;
import java.util.ArrayList;

public class commentsDao {
	
	public ArrayList<comments> getlist(int d) throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from comments where item_id=? order by instant desc";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, d);
		ResultSet rs=st.executeQuery();
		ArrayList<comments> it = new ArrayList<comments>();
		
		while(rs.next()) {
			comments i= new comments();
			i.setuser(rs.getString("user_id"));
			i.setitem(rs.getInt("item_id"));
			i.setmessage(rs.getString("message"));
			it.add(i);
		}
		st.close();
		con.close();
		return (it);
	}
	public int comment(String s, int i, String u) throws SQLException, ClassNotFoundException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="insert into comments(user_id,item_id,message) values(?,?,?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, u);
		st.setInt(2, i);
		st.setString(3, s);
		int rs=st.executeUpdate();
		st.close();
		con.close();
		return (rs);
	}
}

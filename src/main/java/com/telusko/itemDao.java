package com.telusko;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class itemDao {
	public int insert(item i) throws SQLException, ClassNotFoundException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="insert into items(category,item_name,brand,unit_price,unit_count,discount,link,s_id) values(?,?,?,?,?,?,?,?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, i.getcategory());
		st.setString(2, i.getname());
		st.setString(3, i.getbrand());
		st.setInt(4, i.getprice());
		st.setInt(5, i.getcount());
		st.setInt(6, i.getdiscount());
		st.setString(7, i.getLink());
		st.setString(8, i.getsid());
		
		int rs=st.executeUpdate();
		
		st.close();
		con.close();
		return(rs);
	}
	public ArrayList<item> getallitems(String s) throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from items where s_id = ?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, s);
		ResultSet rs=st.executeQuery();
		ArrayList<item> it = new ArrayList<item>();
		
		while(rs.next()) {
			item i= new item();
			i.setcategory(rs.getString("category"));
			i.setid(rs.getInt("item_id"));
			i.setname(rs.getString("item_name"));
			i.setbrand(rs.getString("brand"));
			i.setprice(rs.getInt("unit_price"));
			i.setcount(rs.getInt("unit_count"));
			i.setdiscount(rs.getInt("discount"));
			i.setLink(rs.getString("link"));
			it.add(i);
		}
		st.close();
		con.close();
		return it;
	}
	public ArrayList<item> search_supplier(String s, String name) throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from items where s_id = ? and item_name like(?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, s);
		st.setString(2, name);
		ResultSet rs=st.executeQuery();
		ArrayList<item> it = new ArrayList<item>();
		
		while(rs.next()) {
			item i= new item();
			i.setcategory(rs.getString("category"));
			i.setid(rs.getInt("item_id"));
			i.setname(rs.getString("item_name"));
			i.setbrand(rs.getString("brand"));
			i.setprice(rs.getInt("unit_price"));
			i.setcount(rs.getInt("unit_count"));
			i.setdiscount(rs.getInt("discount"));
			i.setLink(rs.getString("link"));
			it.add(i);
		}
		st.close();
		con.close();
		return it;
	}
	public int delete(int item_id,String s) throws SQLException, ClassNotFoundException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="delete from items where s_id=? and item_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, s);
		st.setInt(2, item_id);
		int rs=st.executeUpdate();
		st.close();
		con.close();
		return rs;
	}
	public item getparameter(int item_id,String s) throws SQLException, ClassNotFoundException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from items where s_id=? and item_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, s);
		st.setInt(2, item_id);
		ResultSet rs=st.executeQuery();
		item i= new item();
		if(rs.next()) {
			
			i.setcategory(rs.getString("category"));
			i.setid(rs.getInt("item_id"));
			i.setname(rs.getString("item_name"));
			i.setbrand(rs.getString("brand"));
			i.setprice(rs.getInt("unit_price"));
			i.setcount(rs.getInt("unit_count"));
			i.setdiscount(rs.getInt("discount"));
			i.setLink(rs.getString("link"));
		}
		else {
			i.setid(0);
		}

		st.close();
		con.close();
		return i;
	}
	public int update(item i) throws SQLException, ClassNotFoundException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="update items set item_name=?, brand=?, unit_price=?, unit_count=?, discount=?,link=? where item_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);	
		
		st.setString(1, i.getname());
		st.setString(2, i.getbrand());
		st.setInt(3, i.getprice());
		st.setInt(4, i.getcount());
		st.setInt(5, i.getdiscount());
		st.setInt(7, i.getid());
		st.setString(6, i.getLink());
		
		int rs=st.executeUpdate();
		
		st.close();
		con.close();
		return rs;
	}
	public ArrayList<item> getbycategory(String s) throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from items where category like(?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, s);
		ResultSet rs=st.executeQuery();
		ArrayList<item> it = new ArrayList<item>();
		
		while(rs.next()) {
			item i= new item();
			i.setcategory(rs.getString("category"));
			i.setid(rs.getInt("item_id"));
			i.setname(rs.getString("item_name"));
			i.setbrand(rs.getString("brand"));
			i.setprice(rs.getInt("unit_price"));
			i.setcount(rs.getInt("unit_count"));
			i.setdiscount(rs.getInt("discount"));
			i.setLink(rs.getString("link"));
			it.add(i);
		}
		st.close();
		con.close();
		return it;
	}
	
	public int add_cart(int i,int j, String u) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="insert into cart(user_id,item_id,item_count) values(?,?,?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, u);
		st.setInt(2, i);
		st.setInt(3, j);
		
		int rs=st.executeUpdate();
		
		st.close();
		con.close();	
		return (rs);
	}
	
	public ArrayList<item> show_cart(String s) throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select i.category,i.item_id,i.item_name,i.brand,i.unit_price,i.unit_count,i.discount,c.item_count,i.link from items as i,cart as c where i.item_id=c.item_id and user_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, s);
		ResultSet rs=st.executeQuery();
		ArrayList<item> it = new ArrayList<item>();
		
		while(rs.next()) {
			item i= new item();
			i.setcategory(rs.getString("i.category"));
			i.setid(rs.getInt("i.item_id"));
			i.setname(rs.getString("i.item_name"));
			i.setbrand(rs.getString("i.brand"));
			i.setprice(rs.getInt("i.unit_price"));
			i.setcount(rs.getInt("c.item_count"));
			i.setdiscount(rs.getInt("i.discount"));
			i.setLink(rs.getString("i.link"));
			it.add(i);
		}
		st.close();
		con.close();
		return it;
	}
	public int remove_cart(int i, String u) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="delete from cart where item_id=? and user_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setInt(1, i);
		st.setString(2, u);
		
		int rs=st.executeUpdate();
		
		st.close();
		con.close();	
		return (rs);
	}
	public item getitem(int i) throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from items where item_id = ?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, i);
		ResultSet rs=st.executeQuery();
		item it= new item();
		if(rs.next()) {	
			it.setcategory(rs.getString("category"));
			it.setid(rs.getInt("item_id"));
			it.setname(rs.getString("item_name"));
			it.setbrand(rs.getString("brand"));
			it.setprice(rs.getInt("unit_price"));
			it.setcount(rs.getInt("unit_count"));
			it.setdiscount(rs.getInt("discount"));
			it.setLink(rs.getString("link"));
		}
		st.close();
		con.close();
		return (it);
	}
	public int fill_order(String u) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="insert into orders(user_id) values(?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, u);
		
		st.executeUpdate();
		st.close();
	    query="select * from orders where user_id=? order by instant desc";
	    PreparedStatement st2=con.prepareStatement(query);
	    st2.setString(1, u);
	    ResultSet rs=st2.executeQuery();
	    
		rs.next();
		int c=rs.getInt("order_id");
		st.close();
		con.close();
		return (c);
	}
	public void fill_places(int oid, String uid) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from cart where user_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, uid);
		ArrayList<item> it= new ArrayList<item>();
		
		ResultSet rs=st.executeQuery();

		while(rs.next()) {
			item i=new item();
			i.setid(rs.getInt("item_id"));
			i.setcount(rs.getInt("item_count"));
			it.add(i);
		}
		
		st.close();
		con.close();
		
		fillinplaces(oid,it);
		
	}
	public void fillinplaces(int oi, ArrayList<item> im) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="insert into places values(?,?,?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		for (int i = 0; i < im.size(); i++) {
			item m=new item();
	    	m=im.get(i);
	    	st.setInt(1, oi);
	  		st.setInt(2, m.getid());
	  		st.setInt(3, m.getcount()); 
	  		st.executeUpdate();
		}
		
		st.close();
		con.close();
	}
	public void remove_ordered(String uid) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="delete from cart where user_id=?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, uid);
		
		int rs=st.executeUpdate();
		st.close();
		con.close();
	}
	public void update_items(int oid) throws ClassNotFoundException, SQLException {
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="update items,places set items.unit_count= items.unit_count-places.item_count where items.item_id=places.item_id and places.order_id=?";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setInt(1, oid);
		
		int rs=st.executeUpdate();
		st.close();
		con.close();
	}
	public ArrayList<order> getorders(String s) throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select orders.order_id,orders.user_id,items.item_id,items.item_name,items.discount,items.unit_price,places.item_count from items,places,orders where items.item_id=places.item_id and places.order_id=orders.order_id and items.s_id=?";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, s);
		ArrayList<order> it= new ArrayList<order>();
		ResultSet rs=st.executeQuery();
		while(rs.next()) {
			order o=new order();
			o.setOrder_id(rs.getInt(1));
			o.setUser_id(rs.getString(2));
			o.setItem_id(rs.getInt(3));
			o.setItem_name(rs.getString(4));
			o.setPrice(rs.getInt(5));
			o.setDiscount(rs.getInt(6));
			o.setItem_count(rs.getInt(7));
			o.setTotal(o.getItem_count()*o.getPrice());
			it.add(o);
		}
		st.close();
		con.close();
		return (it);
	}
	public ArrayList<item> gethurry() throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from items where unit_count<10";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		ArrayList<item> it = new ArrayList<item>();
		
		while(rs.next()) {
			item i= new item();
			i.setcategory(rs.getString("category"));
			i.setid(rs.getInt("item_id"));
			i.setname(rs.getString("item_name"));
			i.setbrand(rs.getString("brand"));
			i.setprice(rs.getInt("unit_price"));
			i.setcount(rs.getInt("unit_count"));
			i.setdiscount(rs.getInt("discount"));
			i.setLink(rs.getString("link"));
			it.add(i);
		}
		st.close();
		con.close();
		return it;
	}
	public ArrayList<item> getdiscount() throws ClassNotFoundException, SQLException{
		String url="jdbc:mysql://localhost:3306/myusers";
		String uname="root";
		String pass="h3r4fmli0nly";
		String query="select * from items where discount>10";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,uname,pass);
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		ArrayList<item> it = new ArrayList<item>();
		
		while(rs.next()) {
			item i= new item();
			i.setcategory(rs.getString("category"));
			i.setid(rs.getInt("item_id"));
			i.setname(rs.getString("item_name"));
			i.setbrand(rs.getString("brand"));
			i.setprice(rs.getInt("unit_price"));
			i.setcount(rs.getInt("unit_count"));
			i.setdiscount(rs.getInt("discount"));
			i.setLink(rs.getString("link"));
			it.add(i);
		}
		st.close();
		con.close();
		return it;
	}
}

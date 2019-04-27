package com.telusko;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;

@Controller
public class AddController
{
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("loginform.jsp");
		return mv;
	}
	
	@RequestMapping("/register")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("registerform.jsp");
		return mv;
	}
	
	@RequestMapping("/register_confirm")
	public ModelAndView register_supplier(@RequestParam String user_id, @RequestParam String username, @RequestParam String owner, @RequestParam String reg_id, @RequestParam String address, @RequestParam String contact, @RequestParam String email, @RequestParam String password,HttpServletRequest request) throws ClassNotFoundException, SQLException {
		supplier s= new supplier();
		s.setuser(user_id);
		s.setusername(username);
		s.setowner(owner);
		s.setregno(reg_id);
		s.setaddress(address);
		s.setcontact(contact);
		s.setemail(email);
		s.setpassword(password);
		supplierDao s2=new supplierDao();
		s2.register(s);
		ModelAndView mv= new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("flag", "yes");
		session.setAttribute("user", s.getuser());
		mv.setViewName("home.jsp");
		return mv;
	}
	
	@RequestMapping("/login_confirm")
	public ModelAndView login_supplier(@RequestParam String user_id, @RequestParam String password, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		login l=new login();
		l.setid(user_id);
		l.setpassword(password);
		supplierDao s = new supplierDao();
		ModelAndView mv= new ModelAndView();
		if(s.checklogin(l)) {
			HttpSession session = request.getSession();
			session.setAttribute("flag", "yes");
			session.setAttribute("user", l.getid());
			mv.setViewName("home.jsp");
			return mv;
		}
		else {
			mv.setViewName("tryagain.jsp");
			return mv;
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession(false);
		if(session!=null) {
			session.invalidate();
		}
		return("loginform.jsp");
	}
	
	@RequestMapping("/add_item_by_supplier")
	public String add_item_by_supplier() {
		return("add_item_by_supplier_form.jsp");
	}
	@RequestMapping("/delete_item_by_supplier")
	public String delete_item_by_supplier() {
		return("delete_item_by_supplier_form.jsp");
	}
	@RequestMapping("/update_item_by_supplier")
	public String update_item_by_supplier() {
		return("update_item_by_supplier_form.jsp");
	}
	@RequestMapping("/add_item")
	public String add_item(@RequestParam String category, @RequestParam String item_name, @RequestParam String brand, @RequestParam int unit_price,@RequestParam int unit_count, @RequestParam int discount, @RequestParam String link, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		item i=new item();
		i.setcategory(category);
		i.setname(item_name);
		i.setbrand(brand);
		i.setprice(unit_price);
		i.setcount(unit_count);
		i.setdiscount(discount);
		i.setLink(link);
		HttpSession session=request.getSession(false);
		i.setsid((String)session.getAttribute("user"));
		itemDao it=new itemDao();
		int c= it.insert(i);
		if(c>0) {
			return("home.jsp");
		}
		else
		return("tryagain.jsp");
	}
	
	@RequestMapping("/all_items_by_supplier")
	public ModelAndView showall(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		ArrayList<item> i = new ArrayList<item>();
		itemDao it = new itemDao();
		HttpSession session=request.getSession(false);
		i=it.getallitems((String)session.getAttribute("user"));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("all_items_by_supplier.jsp");
		mv.addObject("i",i);
		return mv;
	}
	
	@RequestMapping("/search_for_supplier")
	public ModelAndView searchall(@RequestParam String name, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		ArrayList<item> i = new ArrayList<item>();
		itemDao it = new itemDao();
		HttpSession session=request.getSession(false);
		i=it.search_supplier((String)session.getAttribute("user"),name);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("all_items_by_supplier.jsp");
		mv.addObject("i",i);
		return mv;
	}	
	
	@RequestMapping("/confirm_delete")
	public String confirm_delete(@RequestParam int item_id, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		itemDao it = new itemDao();
		HttpSession session=request.getSession(false);
		int c= it.delete(item_id,(String)session.getAttribute("user"));
		if(c==0)
		return ("tryagain.jsp");
		else
			return ("home.jsp");
	}
	
	@RequestMapping("/open_update")
	public ModelAndView open_update(@RequestParam int item_id, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		itemDao it = new itemDao();
		HttpSession session=request.getSession(false);
		item i = it.getparameter(item_id,(String)session.getAttribute("user"));
		ModelAndView mv = new ModelAndView();
		if(i.getid()!=0){
			mv.setViewName("open_update.jsp");
			mv.addObject("i",i);
			return mv;
		}
		else {
			mv.setViewName("tryagain.jsp");
			return mv;
		}
	}
	@RequestMapping("/confirm_update")
	public String confirm_update(@RequestParam int b,@RequestParam String item_name, @RequestParam String brand, @RequestParam int unit_price,@RequestParam int unit_count, @RequestParam int discount, @RequestParam String link) throws ClassNotFoundException, SQLException {
		item i= new item();
		i.setid(b);
		i.setname(item_name);
		i.setbrand(brand);
		i.setprice(unit_price);
		i.setcount(unit_count);
		i.setdiscount(discount);
		i.setLink(link);
		itemDao it=new itemDao();
		if(it.update(i)==1)
		return ("home.jsp");
		else
			return("tryagain.jsp");
	}
	@RequestMapping("/edit_suppliers_profile")
	public ModelAndView edit( HttpServletRequest request) throws ClassNotFoundException, SQLException {
		HttpSession session=request.getSession(false);
		String u=(String)session.getAttribute("user");
		supplierDao ut = new supplierDao();
		supplier ui = new supplier();  
		ui=ut.get_profile(u);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user_supplier_profile.jsp");
		mv.addObject("i",ui);
		return (mv);
	}
	@RequestMapping("/confirm_supplier_profile")
	public String confirm_user_profile(@RequestParam String username, @RequestParam String owner,@RequestParam String regno,@RequestParam String address, @RequestParam String contact, @RequestParam String email, @RequestParam String password, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		supplierDao ut = new supplierDao();
		supplier u =new supplier();
		HttpSession session=request.getSession(false);
		String k=(String)session.getAttribute("user");
		u.setuser(k);
		u.setusername(username);
		u.setowner(owner);
		u.setregno(regno);
		u.setaddress(address);
		u.setcontact(contact);
		u.setemail(email);
		u.setpassword(password);
		if(ut.update(u)>0)
			return("home.jsp");
		else
			return ("tryagain.jsp");
	}
	@RequestMapping("/supplier_order")
	public ModelAndView supplier_order(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		ArrayList<order> i = new ArrayList<order>();
		itemDao it = new itemDao();
		HttpSession session=request.getSession(false);
		i=it.getorders((String)session.getAttribute("user"));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("supplier_order.jsp");
		mv.addObject("i",i);
		return mv;
	}
}

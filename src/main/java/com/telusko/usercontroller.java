package com.telusko;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;

@Controller
public class usercontroller {
	@RequestMapping("/register_user_confirm")
	public ModelAndView register_user(@RequestParam String user_id, @RequestParam String username, @RequestParam String address, @RequestParam String contact, @RequestParam String email, @RequestParam String password,HttpServletRequest request) throws ClassNotFoundException, SQLException {
		user s= new user();
		s.setuser(user_id);
		s.setusername(username);
		s.setaddress(address);
		s.setcontact(contact);
		s.setemail(email);
		s.setpassword(password);
		userDao s2=new userDao();
		s2.register(s);
		ModelAndView mv= new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("flag", "yes");
		session.setAttribute("user", s.getuser());
		mv.setViewName("welcome.jsp");
		return mv;
	}
	
	@RequestMapping("/login_user_confirm")
	public ModelAndView login_user(@RequestParam String user_id, @RequestParam String password, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		login l=new login();
		l.setid(user_id);
		l.setpassword(password);
		userDao s = new userDao();
		ModelAndView mv= new ModelAndView();
		if(s.checklogin(l)) {
			HttpSession session = request.getSession();
			session.setAttribute("flag", "yes");
			session.setAttribute("user", l.getid());
			mv.setViewName("welcome.jsp");
			return mv;
		}
		else {
			mv.setViewName("tryagain.jsp");
			return mv;
		}
	}
	
	@RequestMapping("/display_categories")
	public ModelAndView display_categories(@RequestParam String b) throws ClassNotFoundException, SQLException {
		ArrayList<item> i = new ArrayList<item>();
		itemDao it = new itemDao();
		i=it.getbycategory(b);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("all_items_by_category.jsp");
		mv.addObject("i",i);
		return mv;
	}
	
	@RequestMapping("/add_to_cart")
	public ModelAndView add_to_cart(@RequestParam int b, @RequestParam int item_count, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		itemDao it= new itemDao();
		HttpSession session=request.getSession(false);
		String u=(String)session.getAttribute("user");
		int ct=it.add_cart(b,item_count,u);
		if(ct>0) {
			ArrayList<item> i = new ArrayList<item>();
			i=it.show_cart(u);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("show_cart.jsp");
			mv.addObject("i",i);
			return (mv);
		}
		else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("try again.jsp");
			return (mv);
		}
	}
	@RequestMapping("/cart")
	public ModelAndView cart(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		ArrayList<item> i = new ArrayList<item>();
		itemDao it = new itemDao();
		HttpSession session=request.getSession(false);
		String u=(String)session.getAttribute("user");
		i=it.show_cart(u);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("show_cart.jsp");
		mv.addObject("i",i);
		return (mv);
	}
	@RequestMapping("/remove_from_cart")
	public ModelAndView remove_from_cart(@RequestParam int b,HttpServletRequest request) throws ClassNotFoundException, SQLException {
		itemDao it= new itemDao();
		HttpSession session=request.getSession(false);
		String u=(String)session.getAttribute("user");
		int ct=it.remove_cart(b,u);
		if(ct>0) {
			ArrayList<item> i = new ArrayList<item>();
			i=it.show_cart(u);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("show_cart.jsp");
			mv.addObject("i",i);
			return (mv);
		}
		else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("try again.jsp");
			return (mv);
		}
	}
	@RequestMapping("/more_details")
	public ModelAndView more_details(@RequestParam int b) throws ClassNotFoundException, SQLException {
		itemDao it= new itemDao();
		item i=new item();
		i=it.getitem(b);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("more_detail.jsp");
		mv.addObject("i",i);
		return (mv);
	}
	@RequestMapping("/show_comments")
	public ModelAndView show_comments(@RequestParam int d) throws ClassNotFoundException, SQLException {
		ArrayList<comments> c=new ArrayList<comments>();
		commentsDao cd= new commentsDao();
		c=cd.getlist(d);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("comments.jsp");
		mv.addObject("i",c);
		return (mv);
	}
	@RequestMapping("/add_comment")
	public ModelAndView add_comment(@RequestParam int b, @RequestParam String message, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		commentsDao it=new commentsDao();
		HttpSession session=request.getSession(false);
		String u=(String)session.getAttribute("user");
		if(it.comment(message,b,u)>0) {
			itemDao it2= new itemDao();
			item i=new item();
			i=it2.getitem(b);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("more_detail.jsp");
			mv.addObject("i",i);
			return (mv);
		}
		else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("tryagain.jsp");
			return (mv);
		}
	}
	@RequestMapping("/edit_profile")
	public ModelAndView edit( HttpServletRequest request) throws ClassNotFoundException, SQLException {
		HttpSession session=request.getSession(false);
		String u=(String)session.getAttribute("user");
		userDao ut = new userDao();
		user ui = new user();  
		ui=ut.get_profile(u);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user_profile.jsp");
		mv.addObject("i",ui);
		return (mv);
	}
	@RequestMapping("/confirm_user_profile")
	public String confirm_user_profile(@RequestParam String username, @RequestParam String address, @RequestParam String contact, @RequestParam String email, @RequestParam String password, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		userDao ut = new userDao();
		user u =new user();
		HttpSession session=request.getSession(false);
		String k=(String)session.getAttribute("user");
		u.setuser(k);
		u.setusername(username);
		u.setaddress(address);
		u.setcontact(contact);
		u.setemail(email);
		u.setpassword(password);
		if(ut.update(u)>0)
			return("welcome.jsp");
		else
			return ("tryagain.jsp");
	}
	@RequestMapping("/see_order")
	public ModelAndView see_order( HttpServletRequest request) throws ClassNotFoundException, SQLException {
		ArrayList<item> i = new ArrayList<item>();
		itemDao it = new itemDao();
		HttpSession session=request.getSession(false);
		String u=(String)session.getAttribute("user");
		i=it.show_cart(u);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("see_order.jsp");
		mv.addObject("i",i);
		return (mv);
	}
	@RequestMapping("/confirm_order")
	public ModelAndView confirm_order( HttpServletRequest request) throws ClassNotFoundException, SQLException {
		HttpSession session=request.getSession(false);
		String u=(String)session.getAttribute("user");
		itemDao it = new itemDao();
		int c= it.fill_order(u);
		it.fill_places(c,u);
		it.remove_ordered(u);
		it.update_items(c);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("final.jsp");
		mv.addObject("c",c);
		return (mv);
	}
	@RequestMapping("/user_order")
	public ModelAndView user_order(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		ArrayList<String> i = new ArrayList<String>();
		userDao it = new userDao();
		HttpSession session=request.getSession(false);
		i=it.userorders((String)session.getAttribute("user"));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("order_list.jsp");
		mv.addObject("i",i);
		return mv;
	}
	@RequestMapping("/user_order_details")
	public ModelAndView user_order_details(@RequestParam int b) throws ClassNotFoundException, SQLException {
		ArrayList<order> i = new ArrayList<order>();
		userDao it = new userDao();
		i=it.userorderdetails(b);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user_orders.jsp");
		mv.addObject("i",i);
		return mv;
	}
	@RequestMapping("/hurry")
	public ModelAndView hurry() throws ClassNotFoundException, SQLException {
		ArrayList<item> i = new ArrayList<item>();
		itemDao it = new itemDao();
		i=it.gethurry();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("hurry.jsp");
		mv.addObject("i",i);
		return mv;
	}
	@RequestMapping("/discount")
	public ModelAndView discount() throws ClassNotFoundException, SQLException {
		ArrayList<item> i = new ArrayList<item>();
		itemDao it = new itemDao();
		i=it.getdiscount();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("discount.jsp");
		mv.addObject("i",i);
		return mv;
	}
}

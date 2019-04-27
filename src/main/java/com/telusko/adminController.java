package com.telusko;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class adminController {
	@RequestMapping("/login_admin")
	public ModelAndView login_supplier(@RequestParam String user_id, @RequestParam String password, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		login l=new login();
		l.setid(user_id);
		l.setpassword(password);
		adminDao s = new adminDao();
		ModelAndView mv= new ModelAndView();
		if(s.checklogin(l)) {
			HttpSession session = request.getSession();
			session.setAttribute("flag", "yes");
			session.setAttribute("user", l.getid());
			mv.setViewName("admin_home.jsp");
			return mv;
		}
		else {
			mv.setViewName("tryagain.jsp");
			return mv;
		}
	}
	@RequestMapping("/all_suppliers")
	public ModelAndView all_suppliers() throws ClassNotFoundException, SQLException {
		adminDao a = new adminDao();
		ArrayList<supplier> i = new ArrayList<supplier>();
		i=a.suppliers();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("all_supplier.jsp");
		mv.addObject("i",i);
		return mv;
	}
	@RequestMapping("/all_users")
	public ModelAndView all_users() throws ClassNotFoundException, SQLException {
		adminDao a = new adminDao();
		ArrayList<user> i = new ArrayList<user>();
		i=a.users();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("all_user.jsp");
		mv.addObject("i",i);
		return mv;
	}
}

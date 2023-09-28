package com.exercise.myex.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.exercise.myex.user.service.UserService;
import com.exercise.myex.user.vo.UserVO;



@Controller
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@RequestMapping("/join")
	public String joinView() {
		return "user/join";
		
	}
	@RequestMapping("/joinDo")
	public String joinDo(HttpServletRequest request) {
		String id =request.getParameter("id");
		String pw =passwordEncoder.encode(request.getParameter("pw"));
		String nm =request.getParameter("nm");
		String nic =request.getParameter("nic");
		String sex =request.getParameter("sex");
		String age =request.getParameter("age");
		
		UserVO user =new UserVO(id,pw,nm,nic,sex,age);
		
		try {
			userService.registUser(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/login")
	public String loginView() {
		return "user/login";
		
	}
	@RequestMapping("/loginDo")
	public String loginDo(UserVO user,HttpSession session
			   , String fromUrl
			   ,HttpServletResponse response) {
		System.out.println(user);
		UserVO login =userService.loginUser(user);
		System.out.println(login);

		if (login != null) {
		    boolean match = passwordEncoder.matches(user.getUserPw(), login.getUserPw());
		    System.out.println("ma" + match);
		    if (!match) {
		        return "redirect:/login?msg=N";
		    }
		    session.setAttribute("login", login);
		    return "redirect:/";
		} else {
		    // login 객체가 null인 경우 처리
		    return "redirect:/login?msg=N";
		}
		
	}
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		session.invalidate();
		
		return "redirect:/login";
	}
	
	
	
	
}

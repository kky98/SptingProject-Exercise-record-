package com.exercise.myex.user.web;



import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.exercise.myex.user.service.kakaoLoginService;
import com.exercise.myex.user.vo.UserVO;


@Controller
public class kakaoController {
	
	@Autowired
	private kakaoLoginService ms;
	
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session, Model model) throws Exception {
	    System.out.println("#########" + code);
	    String access_Token = ms.getAccessToken(code);
	    // model.addAttribute("token", access_Token);
	    HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
	    UserVO login = new UserVO();
	    login.setUserId((String) userInfo.get("email"));
	    login.setUserNm((String) userInfo.get("nickname"));
	    session.setAttribute("login", login);
	    System.out.println("###access_Token#### : " + access_Token);
	    System.out.println("###nickname#### : " + userInfo.get("nickname"));
	    System.out.println("###email#### : " + userInfo.get("email"));

	    return "user/login";
	}
	
}
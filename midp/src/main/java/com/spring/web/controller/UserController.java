package com.spring.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.web.service.UserService;
import com.spring.web.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		
		System.out.println("login()");
		
		if(vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("login() - id not found");
		}
		
		String path = "";
		UserVO user = userService.getUser(vo);
		
		if(user != null) {
			session.setAttribute("userName", user.getName());
			session.setAttribute("userId", user.getId());
			path = "redirect:getBoardList.do";
		}else {
			path = "login.jsp";
		}
		
		return path;
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginView(UserVO vo) {
		
		System.out.println("loginView()");
		
		String path = "login.jsp";
				
		return path;
	}	
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session){
		System.out.println("LogoutController");

		session.invalidate();
		
		return "redirect:index.jsp";	
	}
	

	@RequestMapping(value="/join.do")
	public String insertUser(@ModelAttribute("user") UserVO vo) {
				
				
		 userService.insertUser(vo);
		 
		 vo.getId(); 
		 vo.getPassword();
		 vo.getName();
		 vo.getRole();
		 
		 System.out.println("Controller 성공");
		 
		 System.out.println("회원가입정보저장중");
		return "redirect:index.jsp";
	
	}
}

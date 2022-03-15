package com.spring.web.test;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.web.service.BoardService;
import com.spring.web.service.UserService;
import com.spring.web.vo.BoardVO;
import com.spring.web.vo.UserVO;

public class UserServiceTest {

	public static void main(String[] args) {
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		
		UserService service = (UserService)container.getBean("userService");
		
		List<UserVO> list =  service.getUserList();
		for(UserVO vo : list) {
			System.out.println(vo);
		}
		
		container.close();
	}

}

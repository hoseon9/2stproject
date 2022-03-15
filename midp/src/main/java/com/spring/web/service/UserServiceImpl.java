package com.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.dao.UserDAOMybatisTempleate;
import com.spring.web.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAOMybatisTempleate userDAO;
	
	public UserServiceImpl() {
		System.out.println("UserServiceImpl 생성");
	}

	@Override
	public List<UserVO> getUserList() {		
		List<UserVO> userList = userDAO.getUserList();
		return userList;
	}

	@Override
	public UserVO getUser(UserVO vo) {
		System.out.println("getUser-impl");
		return userDAO.getUser(vo);
	}

	
	@Override
	public UserVO insertUser(UserVO vo) {
		System.out.println("insertUser-impl");
		return userDAO.insertUser();
	}
}

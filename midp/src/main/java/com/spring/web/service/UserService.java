package com.spring.web.service;

import java.util.List;

import com.spring.web.vo.BoardVO;
import com.spring.web.vo.UserVO;

public interface UserService {
	
	// getUserList
	List<UserVO> getUserList();
	
	UserVO getUser(UserVO vo);
	
    UserVO insertUser(UserVO vo);

	
}

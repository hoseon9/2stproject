package com.spring.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.web.vo.BoardVO;
import com.spring.web.vo.UserVO;

@Repository
public class UserDAOMybatisTempleate extends SqlSessionDaoSupport{

		private SqlSession mybatis = null;
	@Override
	@Autowired
	
	  public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
        mybatis = getSqlSession();
    }
 
		
	public UserVO getUser(UserVO vo) {
		System.out.println("mybatis - getUser()");
		return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
	}
	
	public  List<UserVO> getUserList() {
		System.out.println("mybatis - getUserList()");
		return mybatis.selectList("UserDAO.getUserList");
	}	
	
	public UserVO insertUser() {
		System.out.println("mybatis - insertUser()");
		
		return mybatis.selectOne("UserDAO.insertUser");
	}



}











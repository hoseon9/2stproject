package com.spring.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.web.common.JDBCUtil;
import com.spring.web.vo.BoardVO;
import com.spring.web.vo.UserVO;

@Repository("userDAO")
public class UserDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// SQL
	private final String USER_LIST = "select * from users";
	private final String USER_GET = "select * from users where id=? and password=?";
	private final String INSER_USer = "insert into Users(id, password, name, role)values(?,?,?,?) ";
	
	public List<UserVO> getUserList(){
		System.out.println("dao - getUserList()");
		List<UserVO> userList = new ArrayList<UserVO>();
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(USER_LIST);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			    String id = rs.getString("id");
			    String password = rs.getString("password");
			    String name = rs.getString("name");
			    String role = rs.getString("role");
			    UserVO vo = new UserVO(id, password, name, role);
			    userList.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return userList;
	}
	
	public UserVO getUser(UserVO vo){
		System.out.println("dao - getUser()");
		UserVO user = null;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(USER_GET);
			pstmt.setString(1,vo.getId());
			pstmt.setString(2,vo.getPassword());
			rs = pstmt.executeQuery();
			if (rs.next()) {
			    String id = rs.getString("id");
			    String password = rs.getString("password");
			    String name = rs.getString("name");
			    String role = rs.getString("role");
			    user = new UserVO(id, password, name, role);
			    
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return user;
	}
	
	}


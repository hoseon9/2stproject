package com.spring.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.web.vo.BoardVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.web.vo.BoardVO;

@Repository
public class BoardDAOMybatisTempleate extends SqlSessionDaoSupport{

    private SqlSession mybatis = null;

    @Override
    @Autowired
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
        mybatis = getSqlSession();
    }

    public void insertBoard(BoardVO vo) {
        System.out.println("mybatis - insertBoard()");

        mybatis.insert("BoardDAO.insertBoard", vo);
    }

    public void updateBoard(BoardVO vo) {
        System.out.println("mybatis - updateBoard()");

        mybatis.update("BoardDAO.updateBoard", vo);
    }

    public void deleteBoard(BoardVO vo) {
        System.out.println("mybatis - deleteBoard()");

        mybatis.delete("BoardDAO.deleteBoard", vo);
    }

    public BoardVO getBoard(BoardVO vo) {
        System.out.println("mybatis - getBoard()");

        return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
    }

    public List<BoardVO> getBoardList(BoardVO vo) {
        System.out.println("mybatis - getBoardList()");

        return mybatis.selectList("BoardDAO.getBoardList", vo);
    }


    public int getBoardCount(BoardVO vo) {
        System.out.println("getBoardCount()");
        return mybatis.selectOne("BoardDAO.getBoardCount", vo);
    }
}










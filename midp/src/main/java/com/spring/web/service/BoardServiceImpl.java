package com.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.dao.BoardDAOMybatisTempleate;
import com.spring.web.vo.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.dao.BoardDAOMybatis;
import com.spring.web.service.BoardService;
import com.spring.web.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	
	 @Autowired
	    private BoardDAOMybatisTempleate boardDAO;

	    @Override
	    public void insertBoard(BoardVO vo) {
	        boardDAO.insertBoard(vo);

	    }

	    @Override
	    public void updateBoard(BoardVO vo) {
	        boardDAO.updateBoard(vo);
	    }

	    @Override
	    public void deleteBoard(BoardVO vo) {
	        boardDAO.deleteBoard(vo);
	    }

	    @Override
	    public BoardVO getBoard(BoardVO vo) {
	        return boardDAO.getBoard(vo);
	    }

	    @Override
	    public List<BoardVO> getBoardList(BoardVO vo) {
	        return boardDAO.getBoardList(vo);
	    }

	    @Override
	    public int getBoardCount(BoardVO vo) {
	        return boardDAO.getBoardCount(vo);
	    }

	}
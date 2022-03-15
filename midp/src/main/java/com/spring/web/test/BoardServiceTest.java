package com.spring.web.test;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.web.service.BoardService;
import com.spring.web.vo.BoardVO;

public class BoardServiceTest {

	public static void main(String[] args) {
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		
		BoardService service = (BoardService)container.getBean("boardService");
		
		List<BoardVO> bList =  service.getBoardList();
		for(BoardVO vo : bList) {
			System.out.println(vo);
		}
		
		container.close();
	}

}

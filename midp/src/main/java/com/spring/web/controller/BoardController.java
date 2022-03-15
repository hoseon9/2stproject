package com.spring.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.web.service.BoardService;
import com.spring.web.vo.BoardVO;
import com.spring.web.vo.PagingVO;


@Controller
@SessionAttributes("board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @ModelAttribute("searchType")
    public Map<String, String> searchType(){
        Map<String, String> searchType = new HashMap<String, String>();
        searchType.put("Title", "TITLE");
        searchType.put("Content", "CONTENT");

        return searchType;
    }

    @RequestMapping(value="/getBoardList.do")
    public String getBoardList(BoardVO vo, Model model
            , @RequestParam(defaultValue = "1") int curPage
            , @RequestParam(defaultValue = "1") int range) {
        System.out.println("GetBoardListController - getBoardList()");


        if(vo.getSearchType() == null) vo.setSearchType("TITLE");
        if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");

        int listCnt = boardService.getBoardCount(vo);

        System.out.println("curPage =>>>>>" + curPage);
        System.out.println("getSearchType =>>>>>" + vo.getSearchType());
        System.out.println("setSearchKeyword =>>>>>" + vo.getSearchKeyword());
        System.out.println(listCnt);

        PagingVO pagingVO = new PagingVO();
        pagingVO.pageInfo(curPage, range, listCnt);

        vo.setStartList(pagingVO.getStartList());
        vo.setListSize(pagingVO.getListSize());

        List<BoardVO>boardList = boardService.getBoardList(vo);
        model.addAttribute("pagingVO",pagingVO); // Model 정보 저장  
        model.addAttribute("boardList",boardList); // Model 정보 저장  
        return "getBoardList.jsp";  // View 정보 저장
    }

    @RequestMapping(value="/getBoard.do")
    public String getBoard(BoardVO vo, Model model) {
        System.out.println("GetBoardController - getBoard()");

        model.addAttribute("board",boardService.getBoard(vo)); // Model

        return "getBoard.jsp";
    }

    @RequestMapping(value="/insertBoard.do")
    public String insertBoard(BoardVO vo) {
        System.out.println("InsertBoardController - insertBoard()");


        MultipartFile uploadFile = vo.getUploadFile();
        if(!uploadFile.isEmpty()) {
            String filePath = "D:/bigdata/spring/fileupload/";
            String fileName = uploadFile.getOriginalFilename();
            try {
                uploadFile.transferTo(new File(filePath+fileName));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }


        boardService.insertBoard(vo);

        //return "getBoardList.do"; // Forward
        return "redirect:getBoardList.do"; // Redirect
    }

    @RequestMapping(value="/updateBoard.do")
    public String updateBoard(@ModelAttribute("board") BoardVO vo) {
        System.out.println("UpdateBoardController - updateBoard()");

        System.out.println("Seq:" + vo.getSeq());
        System.out.println("Title:" + vo.getTitle());
        System.out.println("Writer:" + vo.getWriter());
        System.out.println("Content:" + vo.getContent());
        System.out.println("RegDate:" + vo.getRegDate());
        System.out.println("Cnt:" + vo.getCnt());

        boardService.insertBoard(vo);

        //return "getBoardList.do"; // Forward
        return "redirect:getBoardList.do"; // Redirect
    }

    @RequestMapping(value="/deleteBoard.do")
    public String deleteBoard(BoardVO vo) {
        System.out.println("DeleteBoardController - deleteBoard()");

        boardService.deleteBoard(vo);

        //return "getBoardList.do"; // Forward
        return "redirect:getBoardList.do"; // Redirect
    }

    @RequestMapping(value="/getBoardListJson.do")
    @ResponseBody
    public List<BoardVO> getBoardListJson(BoardVO vo) {
        System.out.println("GetBoardListController - getBoardList()");

        vo.setSearchType("TITLE");
        vo.setSearchKeyword("");

        List<BoardVO> boardList = boardService.getBoardList(vo); // Model 정보 저장  
        return boardList;  // View 정보 저장
    }

}
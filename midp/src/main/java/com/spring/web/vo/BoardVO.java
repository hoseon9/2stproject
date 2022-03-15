package com.spring.web.vo;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class BoardVO {
    private int seq;
    private String title;
    private String writer;
    private String content;
    private String regDate;
    private int cnt;
    private String searchType;
    private String searchKeyword;
    private MultipartFile uploadFile;
    private int startList;
    private int listSize;

    public BoardVO() {
    }

    public BoardVO(int seq, String title, String writer, String content, String regDate, int cnt) {
        super();
        this.seq = seq;
        this.title = title;
        this.writer = writer;
        this.content = content;
        this.regDate = regDate;
        this.cnt = cnt;
    }



    public BoardVO(int seq, String title, String writer, String content, String regDate, int cnt, String searchType,
            String searchKeyword) {
        super();
        this.seq = seq;
        this.title = title;
        this.writer = writer;
        this.content = content;
        this.regDate = regDate;
        this.cnt = cnt;
        this.searchType = searchType;
        this.searchKeyword = searchKeyword;
    }

    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getRegDate() {
        return regDate;
    }
    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }
    public int getCnt() {
        return cnt;
    }
    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    @JsonIgnore
    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    @JsonIgnore
    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }


    public MultipartFile getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(MultipartFile uploadFile) {
        this.uploadFile = uploadFile;
    }


    public int getStartList() {
        return startList;
    }

    public void setStartList(int startList) {
        this.startList = startList;
    }

    public int getListSize() {
        return listSize;
    }

    public void setListSize(int listSize) {
        this.listSize = listSize;
    }

    @Override
    public String toString() {
        return "BoardVO [seq=" + seq + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regDate="
                + regDate + ", cnt=" + cnt + ", searchType=" + searchType + ", searchKeyword=" + searchKeyword + "]";
    }


}
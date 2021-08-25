package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.BoardCommentVO;

public interface BoardCommentService {
	
	public abstract List<BoardCommentVO> getList(Integer bno);	//게시글번호에 맞는 댓글 가져오기
	public abstract boolean register(BoardCommentVO comment); 		//작성
	public abstract boolean modify(BoardCommentVO comment);//수정
	public abstract boolean remove(Integer bcno);//삭제

}//end interface

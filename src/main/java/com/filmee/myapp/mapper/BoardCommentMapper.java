package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.BoardCommentVO;

public interface BoardCommentMapper {

	public abstract Integer insert(BoardCommentVO comment);	//댓글 작성
	public abstract List<BoardCommentVO> read(Integer bno);	//댓글 조회
	public abstract Integer delete(Integer bcno);			//댓글 삭제
	public abstract Integer update(BoardCommentVO comment);	//댓글 수정
	
}//end interface 

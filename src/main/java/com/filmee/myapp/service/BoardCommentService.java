package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.BoardCommentVO;
import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.domain.PageDTO;

public interface BoardCommentService {
	
	public abstract List<BoardCommentVO> list(Integer bno);	//전체조회
	
	public abstract BoardCommentVO get(Integer bcno);	//상세조회
	
	public abstract int register(BoardCommentVO vo);	//작성
		
	public abstract int modify(BoardCommentVO vo);		//수정
	
	public abstract int remove(Integer bcno);			//삭제
	
	public abstract List<BoardCommentVO> getList(Criteria cri, Integer bno);
	
	public abstract int getCountByBno(Integer bno); 	//댓글 수 
}//end interface

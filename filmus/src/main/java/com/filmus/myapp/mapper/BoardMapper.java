package com.filmus.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.filmus.myapp.domain.BoardUserVO;
import com.filmus.myapp.domain.BoardVO;
import com.filmus.myapp.domain.Criteria;

public interface BoardMapper {
	
	public abstract List<BoardUserVO> getList(Criteria cri); 	//메인 list 가져오기
	
	public abstract BoardUserVO select(Integer bno);			//상세조회
	
	public abstract int insertSelectKey(BoardVO board);		//작성
	
	public abstract int update(BoardVO board);	//수정
	
	public abstract int delete(Integer bno);	//삭제
	
	public abstract int getTotalCount(Criteria cri);	//게시판의 총 게시물 개수
	
	public abstract int viewCnt(@Param("bno")Integer bno, @Param("amount")Integer amount);	//조회수
	
	public abstract void commentCnt(@Param("bno")Integer bno, @Param("amount")Integer amount);	//댓글 수 +-
	
	public abstract void heartCnt(@Param("bno")Integer bno, @Param("amount")Integer amount);	//좋아요 수 +-

}//end interface 
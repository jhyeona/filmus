package com.filmus.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.filmus.myapp.domain.ReviewCommentDTO;
import com.filmus.myapp.domain.ReviewCommentVO;
import com.filmus.myapp.domain.ReviewDTO;
import com.filmus.myapp.domain.ReviewVO;

public interface ReviewMapper {
	
	//리뷰상세조회
	public abstract ReviewVO reviewDetail(@Param("rno")Integer rno, @Param("filmId")Integer filmId);

	//리뷰수정
	public abstract int modify(ReviewDTO dto);
	
	//리뷰삭제
	public abstract int delete(@Param("rno")Integer rno, @Param("filmId")Integer filmId);
	
	//rc : review comment
	//댓글등록
	public abstract int rcCreate(ReviewCommentDTO dto);
	
	//대댓글등록
	public abstract int rcChildCreate(ReviewCommentDTO dto);	
	
	//댓글수정
	public abstract int rcModify(ReviewCommentDTO dto);
	
	//댓글삭제
	public abstract int rcDelete(@Param("rcno")Integer rcno, @Param("rno")Integer rno);
	
	//댓글목록조회
	public abstract List<ReviewCommentVO> rcList(Integer rno);
	
	//댓글수 +-
	public abstract void commentCnt(@Param("rno")Integer rno, @Param("amount")Integer amount);
	
	//좋아요추가
	public abstract int reviewLike(@Param("rno")Integer rno, @Param("userId")Integer userId);
	
	//좋아요삭제
	public abstract int reviewUnLike(@Param("rno")Integer rno, @Param("userId")Integer userId);
	
	//좋아요 +-
	public abstract void reviewLikeCnt(@Param("rno")Integer rno, @Param("amount")Integer amount);
	
	//좋아요체크
	public abstract int reviewLikeCheck(@Param("rno")Integer rno, @Param("userId")Integer userId);
	
}//end interface

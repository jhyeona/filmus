package com.filmus.myapp.mapper;

import org.apache.ibatis.annotations.Param;

import com.filmus.myapp.domain.HeartVO;

public interface HeartMapper {
	
	public abstract int heartInsert(HeartVO vo);	//처음이라면 insert
	
	public abstract int heartCheck(@Param("bno")Integer bno, @Param("userid")Integer userid);	//좋아요를 눌렀을 때
	
	public abstract int heartUncheck(@Param("bno")Integer bno, @Param("userid")Integer userid);	//좋아요를 취소할 때
	
	public abstract HeartVO check(@Param("bno")Integer bno, @Param("userid")Integer userid); //좋아요 되어 있는지 확인
	
	public abstract int heartCnt(Integer bno);	//좋아요 개수
	
	
}//end interface

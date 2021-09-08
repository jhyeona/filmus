package com.filmee.myapp.mapper;

import com.filmee.myapp.domain.ReportVO;

public interface ReportMapper {
	
	//신고작성 (페이지마다 신고 가능)
	public abstract int insert(ReportVO report);
	
	//신고리스트+페이징(관리자화면)
	
	//신고상세조회(관리자화면)
	
	//신고삭제
	
	//전체 신고글 수
	
	//신고처리
	
}

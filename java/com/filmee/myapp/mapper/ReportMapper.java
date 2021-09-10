package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.CriteriaReport;
import com.filmee.myapp.domain.ReportVO;

public interface ReportMapper {
	
	//신고작성 (페이지마다 신고 가능)
	public abstract int newReport(ReportVO report);
	
	//신고리스트+페이징(관리자화면)
	public abstract List<ReportVO> getList(CriteriaReport cri);
	
	//신고상세조회(관리자화면)
	public abstract ReportVO select(Integer rptno);
	
	//신고처리
	public abstract int complete(Integer rptno);
	
	//전체 신고물 수
	public abstract int getTotal(CriteriaReport cri);
	
}//end class

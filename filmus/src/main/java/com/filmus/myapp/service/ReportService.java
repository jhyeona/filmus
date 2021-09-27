package com.filmus.myapp.service;

import java.util.List;

import com.filmus.myapp.domain.CriteriaReport;
import com.filmus.myapp.domain.PunishDTO;
import com.filmus.myapp.domain.ReportVO;

public interface ReportService {
	
	public abstract int reportRegister(ReportVO report);	//유저의 신고 저장

	public abstract List<ReportVO> getList(CriteriaReport cri);	//전체 리스트
		
	public abstract int complete(PunishDTO dto);				//신고처리 완료체크
	
	public abstract int getTotal(CriteriaReport cri);			//전체 신고물 수
	
}//end interface

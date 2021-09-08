package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.ComCriteria;
import com.filmee.myapp.domain.ComplaintVO;

public interface ComplaintService {

	
	public abstract boolean register(ComplaintVO complaint);	//요청글 등록
	
	public abstract List<ComplaintVO> getList();				//요청 목록조회
	
	public abstract List<ComplaintVO> getListPerPage(ComCriteria cri);
	
	public abstract boolean temporary(ComplaintVO complaint);	//요청글 임시 수정 
	
	public abstract boolean completion(ComplaintVO complaint);	//요청글 최종 수정
	
	public abstract boolean remove(Integer compno);				//요청글 삭제
	
	public abstract ComplaintVO get(Integer compno);			//요청 게시글 상세조회
	
	public abstract int getTotal(ComCriteria cri);					//총 레코드 수 구하기

}

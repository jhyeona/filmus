package com.filmus.myapp.service;

import java.util.List;
import java.util.Map;

import com.filmus.myapp.domain.Criteria;
import com.filmus.myapp.domain.FilmInfoReactionVO;
import com.filmus.myapp.domain.FilmReviewDTO;
import com.filmus.myapp.domain.FilmReviewVO;
import com.filmus.myapp.domain.UserVO;

public interface FilmService {

	public abstract Map<String, Object> showFilmInfo(String filmId);		//영화 정보 가져오기
	
	public abstract List<FilmReviewVO> getReviewList(Map<String, Object> params);	//리뷰 목록 가져오기

	public abstract int getTotal(Map<String, Object> params);		//총 레코드 수 가져오기

	public abstract int registerReview(FilmReviewDTO dto);	//리뷰 등록하기
	
	public abstract List<Integer> getFilmReactionOfUser(String userId, String filmId);	//유저가 영화에 한 reaction 가져오기
	
	public abstract FilmInfoReactionVO getFilmReactionOfThis(String filmId);	//영화의 총 reaction 가져오기
	
	public abstract int addFilmReactionOfUser(String userId, String filmId, Integer code);	//영화에 대한 reaction 추가

	public abstract int removeFilmReactionOfUser(String userId, String filmId, Integer code);	//영화에 대한 reaction 제거
	
}//end interface

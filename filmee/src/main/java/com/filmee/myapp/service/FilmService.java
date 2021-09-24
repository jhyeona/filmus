package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.CriteriaFilmReview;
import com.filmee.myapp.domain.FilmGenreVO;
import com.filmee.myapp.domain.FilmPeopleVO;
import com.filmee.myapp.domain.FilmVO;
import com.filmee.myapp.domain.ReviewFilmUserVO;
import com.filmee.myapp.domain.ReviewVO;

public interface FilmService {
	
	public abstract FilmVO getFilmInfo(Integer film_id); // 영화정보
	public abstract List<FilmPeopleVO> getFilmPeople (Integer film_id); // 감독, 배우
	public abstract List<FilmGenreVO> getGenre(Integer film_id); // 장르 
	
	//-----------------------------------------------------------//
	
	public abstract int register(ReviewVO review);  // 새로운 리뷰 등록
	public abstract ReviewFilmUserVO get(Integer rno);	// 특정 리뷰 조회
	public abstract List<ReviewFilmUserVO> getList(Integer film_id);	// 특정 영화의 리뷰 목록 조회(recent review)	

	public abstract int remove(Integer rno);	// 특정 리뷰 삭제
	public abstract int modify(ReviewVO review);	// 특정 리뷰 수정
	
	public abstract List<ReviewFilmUserVO> getListWithPaging(CriteriaFilmReview cri);	// 페이징처리된 리뷰 목록조회
	public abstract int getTotalCount(Integer film_id, CriteriaFilmReview cri);	// 리뷰의 총 레코드 건수 얻기
} // end interface

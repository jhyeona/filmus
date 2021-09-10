package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.CriteriaFilmReview;
import com.filmee.myapp.domain.FilmGenreVO;
import com.filmee.myapp.domain.FilmPeopleVO;
import com.filmee.myapp.domain.FilmVO;
import com.filmee.myapp.domain.ReviewFilmUserVO;
import com.filmee.myapp.domain.ReviewVO;

public interface FilmMapper {

	public abstract FilmVO selectFilmInfo(Integer film_id); // 영화 정보 select	
	public abstract List<FilmPeopleVO> selectFilmPeople (Integer film_id);  // 감독, 배우 select	
	public abstract List<FilmGenreVO> selectGenre(Integer film_id); // 장르 select 


	//-----------------------------------------------------------//
	
	public abstract int insert(ReviewVO review);  // 새로운 리뷰 등록
	public abstract ReviewFilmUserVO select(Integer rno);	// 특정 리뷰 조회
	public abstract List<ReviewFilmUserVO> selectList(Integer film_id);	// 특정 영화의 리뷰 목록 조회(recent review)	
	public abstract int delete(Integer rno);	// 특정 리뷰 삭제
	public abstract int update(ReviewVO review);	// 특정 리뷰 수정
	
	public abstract List<ReviewFilmUserVO> selectListWithPaging(CriteriaFilmReview cri);	// 페이징처리된 리뷰 목록조회
	public abstract int selectTotalCount(Integer film_id, CriteriaFilmReview cri);	// 리뷰의 총 레코드 건수 얻기

} // end interface

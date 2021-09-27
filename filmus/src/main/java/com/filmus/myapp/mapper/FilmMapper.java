package com.filmus.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.filmus.myapp.domain.FilmDetailVO;
import com.filmus.myapp.domain.FilmInfoReactionVO;
import com.filmus.myapp.domain.FilmPeopleVO;
import com.filmus.myapp.domain.FilmReviewDTO;
import com.filmus.myapp.domain.FilmReviewVO;

public interface FilmMapper {

	public abstract FilmDetailVO getFilmDetail(String filmId);
	
	public abstract List<FilmPeopleVO> getFilmPeople(String filmId);
	
	public abstract List<FilmReviewVO> getReviews(Map<String, Object> params);

	public abstract int getTotalCount(Map<String, Object> params);
	
	public abstract int insertReview(FilmReviewDTO dto);
	
	public abstract List<Integer> getFilmReactionOfUser(@Param("userId")String userId, @Param("filmId")String filmId);

	public abstract FilmInfoReactionVO getFilmReactionOfThis(String filmId);
	
	public abstract int InsertFilmReactionOfUser(@Param("userId")String userId, @Param("filmId")String filmId, @Param("code")Integer code);

	public abstract int DeleteFilmReactionOfUser(@Param("userId")String userId, @Param("filmId")String filmId, @Param("code")Integer code);
	
}//end interface

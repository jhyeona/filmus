package com.filmus.myapp.mapper;

import java.util.List;

import com.filmus.myapp.domain.FilmusFilmsVO;
import com.filmus.myapp.domain.FilmusReviewsVO;


public interface MainMapper {
	
	public abstract List<FilmusFilmsVO> getMainFilms();
	
	public abstract List<FilmusReviewsVO> getMainReviews();

} //end class

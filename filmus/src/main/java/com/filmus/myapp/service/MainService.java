package com.filmus.myapp.service;

import java.util.List;

import com.filmus.myapp.domain.FilmusFilmsVO;
import com.filmus.myapp.domain.FilmusReviewsVO;


public interface MainService {
	
	public abstract List<FilmusFilmsVO> getMainFilms();
	
	public abstract List<FilmusReviewsVO> getMainReviews();

} //end interface

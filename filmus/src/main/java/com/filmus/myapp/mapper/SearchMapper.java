package com.filmus.myapp.mapper;

import java.util.List;

import com.filmus.myapp.domain.CriteriaSearch;
import com.filmus.myapp.domain.SearchFilmGenreVO;
import com.filmus.myapp.domain.SearchFilmInfoVO;
import com.filmus.myapp.domain.SearchFilmVO;
import com.filmus.myapp.domain.SearchPeopleVO;
import com.filmus.myapp.domain.SearchUserVO;


public interface SearchMapper {
	
	public abstract List<SearchFilmVO> getFilmList(String filmTitle);
	
	public abstract List<SearchPeopleVO> getFilmsWithPeople(String peopleId);

	public abstract List<SearchUserVO> getUserList(String nickname);
	
	public abstract List<SearchFilmVO> getFilmListPage(CriteriaSearch cri);
	
	public abstract List<SearchFilmInfoVO> getFilmListInfo(CriteriaSearch cri);
	
	public abstract List<SearchFilmGenreVO> getFilmListGenre(CriteriaSearch cri);
	
	public abstract List<SearchUserVO> getUserListPage(CriteriaSearch cri);
	
	public abstract int getTotalCountFilmSearch(CriteriaSearch cri);
	
	public abstract int getTotalCountUserSearch(CriteriaSearch cri);


} //end interface
package com.filmus.myapp.domain;

import lombok.Value;

@Value
public class FilmDetailVO {

	private Integer filmId;
	private String originalTitle;
	private String releaseDate;
	private String plot;
	private String posterPath;
	private String backdropPath;
	private Double avgRate;
	private Integer width;
	
}//end class

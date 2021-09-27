package com.filmus.myapp.domain;

import lombok.Value;


@Value
public class FilmusFilmsVO {
	
	private Integer filmid;
	private String title;	
	private Double popularity;
	private String poster;
	
	//private Integer likeCnt;
	//private Integer viewCnt;

} //end class

package com.filmus.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;


@Value
public class FilmReviewVO {
	
	private Integer rno;
	private String writer;
	private Double rate;
	private Integer width;
	private String content;
	private Timestamp insertTs;
	private Timestamp updateTs;
	private Integer likeCnt;
	private Integer commentCnt;
	private String nickname;
	private String profilePhotoPath;
	
}//end class

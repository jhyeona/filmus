package com.filmus.myapp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private Integer rno;
	private Integer filmId;
	private Integer writer;
	private Double rate;
	private String content;
	private Date insertTs;
	private Date updateTs;
	private Date deleteTs;
	private Integer likeCnt;
	private Integer commentCnt;

}//end class

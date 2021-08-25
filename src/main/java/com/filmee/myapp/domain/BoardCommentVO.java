package com.filmee.myapp.domain;

import java.util.Date;

import lombok.Value;

@Value
public class BoardCommentVO {
	
	private Integer bcno;
	private Integer bno;
	private Integer writer;
	private String content;
	private Date insert_ts;
	private Date update_ts;
	private Integer like_cnt;
	private Integer pbcno;

}//end class

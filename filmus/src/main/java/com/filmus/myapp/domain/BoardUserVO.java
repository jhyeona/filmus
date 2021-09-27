package com.filmus.myapp.domain;

import java.util.Date;

import lombok.Value;

@Value
public class BoardUserVO {
	//Board
	private Integer bno;
	private String category;
	private Integer writer;
	private String title;
	private String content;
	private Date insert_ts;
	private Date update_ts;
	private Date delete_ts;
	private Integer view_cnt;
	private Integer like_cnt;
	
	private Integer commentCnt;
	
	//User
	private Integer user_id;
	private String nickname;
	private String profilePhotoPath;	
	
}

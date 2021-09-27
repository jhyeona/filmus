package com.filmus.myapp.domain;

import java.util.Date;

import lombok.Value;

@Value
public class ReviewCommentVO {

	private Integer rcno;
	private Integer rno;
	private Integer writer;
	private String content;
	private Date insertTs;
	private Date updateTs;
	private Date deleteTs;
	private Integer parentRcno;
	private String nickname;
	private String profilePhotoPath;
	
}//end class

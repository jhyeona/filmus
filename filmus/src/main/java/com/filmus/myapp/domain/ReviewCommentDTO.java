package com.filmus.myapp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewCommentDTO {

	private Integer rcno;
	private Integer rno;
	private Integer writer;
	private String content;
	private Date insertTs;
	private Date updateTs;
	private Date deleteTs;
	private Integer parentRcno;
	private String nickname;
	
}//end class

package com.filmus.myapp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HeartVO {
	
	private Integer hno;
	private Integer userid;
	private Integer bno;
	private Integer likecheck;
}
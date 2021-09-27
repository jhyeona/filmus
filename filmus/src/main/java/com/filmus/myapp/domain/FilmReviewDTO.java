package com.filmus.myapp.domain;

import lombok.Data;

@Data
public class FilmReviewDTO {
	private Integer filmId;
	private Integer writer;
	private Double rating;
	private String content;
}

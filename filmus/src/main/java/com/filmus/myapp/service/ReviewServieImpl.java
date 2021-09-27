package com.filmus.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmus.myapp.domain.ReviewCommentDTO;
import com.filmus.myapp.domain.ReviewCommentVO;
import com.filmus.myapp.domain.ReviewDTO;
import com.filmus.myapp.domain.ReviewVO;
import com.filmus.myapp.mapper.ReviewMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class ReviewServieImpl implements ReviewService {

	@Autowired private ReviewMapper mapper;
	
	@Override
	public ReviewVO reviewDetail(Integer rno, Integer filmId) {
		log.debug("reviewDetail({},{}) invoked.", rno, filmId);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.reviewDetail(rno, filmId);
	}//reviewDetail

	@Override
	public int modReview(ReviewDTO dto) {
		log.debug("modReview({}) invoked.", dto);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.modify(dto);
	}//modReview

	@Override
	public int delReview(Integer rno, Integer filmId) {
		log.debug("delReview({},{}) invoked.", rno, filmId);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.delete(rno, filmId);
	}//delReview

	@Override
	public int rcCreate(ReviewCommentDTO dto) {
		log.debug("rcCreate({}) invoked.", dto);
		Objects.requireNonNull(this.mapper);
		this.mapper.commentCnt(dto.getRno(), 1);
		
		return this.mapper.rcCreate(dto);
	}//rcCreate

	@Override
	public int rcChildCreate(ReviewCommentDTO dto) {
		log.debug("rcChildCreate({}) invoked.", dto);
		Objects.requireNonNull(this.mapper);
		this.mapper.commentCnt(dto.getRno(), 1);

		return this.mapper.rcChildCreate(dto);
	}//rcChildCreate

	@Override
	public int rcModify(ReviewCommentDTO dto) {
		log.debug("rcModify({}) invoked.", dto);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.rcModify(dto);
	}//rcModify

	@Override
	public int rcDelete(Integer rcno, Integer rno) {
		log.debug("rcDelete({}) invoked.", rcno);
		Objects.requireNonNull(this.mapper);
		
		this.mapper.commentCnt(rno, -1);
		
		return this.mapper.rcDelete(rcno, rno);
	}//rcDelete

	@Override
	public List<ReviewCommentVO> rcList(Integer rno) {
		log.debug("rcList({}) invoked.", rno);
		Objects.requireNonNull(this.mapper);
		
		List<ReviewCommentVO> list = this.mapper.rcList(rno);
		
		return list;
	}//rcList

	@Override
	public int reviewLike(Integer rno, Integer userId) {
		log.debug("reviewLike({},{}) invoked.", rno, userId);
		
		this.mapper.reviewLikeCnt(rno, 1);
		
		return this.mapper.reviewLike(rno, userId);
	}//reviewLike

	@Override
	public int reviewUnLike(Integer rno, Integer userId) {
		log.debug("reviewLike({},{}) invoked.", rno, userId);
		
		this.mapper.reviewLikeCnt(rno, -1);
		
		return this.mapper.reviewUnLike(rno, userId);
	}//reviewLike
	
	@Override
	public int reviewLikeCheck(Integer rno, Integer userId) {
		log.debug("reviewLikeCheck({},{}) invoked.",rno,userId);
		
		return this.mapper.reviewLikeCheck(rno, userId);
	}//reviewLikeCheck

}//end class

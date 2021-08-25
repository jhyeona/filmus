package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.BoardCommentVO;
import com.filmee.myapp.mapper.BoardCommentMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class BoardCommentServiceImpl implements BoardCommentService {
	
	@Autowired private BoardCommentMapper mapper;

	@Override
	public List<BoardCommentVO> getList(Integer bno) {
		log.debug(">> getList({}) invoked.",bno);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.read(bno);
	}//getList

	@Override
	public boolean register(BoardCommentVO comment) {
		log.debug(">> register({})invoked.",comment);
		Objects.requireNonNull(this.mapper);

		return this.mapper.insert(comment)==1;
	}//register

	@Override
	public boolean modify(BoardCommentVO comment) {
		log.debug(">> modify({}) invoked.",comment);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.update(comment)==1;
	}//modify

	@Override
	public boolean remove(Integer bcno) {
		log.debug(">> remove({}) invoked.",bcno);
		Objects.requireNonNull(this.mapper);

		return this.mapper.delete(bcno)==1;
	}//remove

}//end class

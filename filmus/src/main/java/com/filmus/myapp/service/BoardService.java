package com.filmus.myapp.service;

import java.io.IOException;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.filmus.myapp.domain.BoardUserVO;
import com.filmus.myapp.domain.BoardVO;
import com.filmus.myapp.domain.Criteria;
import com.filmus.myapp.domain.FileVO;

public interface BoardService {
	//전체리스트, 한개 상세조회, 작성, 수정, 삭제
	public abstract List<BoardUserVO> getList(Criteria cri);//메인 list 조회 
	
	public abstract BoardUserVO get(Integer bno);		//상세조회
	
	public abstract boolean register(BoardVO board);//작성
	
	public abstract boolean modify(BoardVO board);	//수정
	
	public abstract boolean remove(Integer bno);	//삭제
	
	public abstract int getTotal(Criteria cri);		//전체 게시물 개수
	
	//파일첨부처리
	public abstract FileVO fileInsert(MultipartFile file, int bnoPlus);	//파일업로드
	
	public abstract FileVO fileDetail(Integer bno);
	
	public abstract ResponseEntity<byte[]> fileDownload(Integer bno) throws IOException;	//파일다운로드
	

}//end interface
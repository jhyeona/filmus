package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.CriteriaReport;
import com.filmee.myapp.domain.ReportVO;
import com.filmee.myapp.mapper.ReportMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class ReportServiceImpl implements ReportService {

	@Setter(onMethod_=@Autowired)
	private ReportMapper mapper;
	
	@Override
	public int reportRegister(ReportVO report) {
		log.debug(" SERVICE >> reportRegister({}) invoked.", report);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.newReport(report);
	}//repotrRegister

	@Override
	public List<ReportVO> getList(CriteriaReport cri) {
		log.debug(" SERVICE >> getList({}) invoked.", cri);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getList(cri);
	}//getList

	@Override
	public ReportVO getDetail(Integer rptno) {
		log.debug(" SERVICE >> getDetail({}) invoked.", rptno);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.select(rptno);
	}//getDetail

	@Override
	public int complete(Integer rptno) {
		log.debug(" SERVICE >> complete({}) invoked.", rptno);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.complete(rptno);
	}

	@Override
	public int getTotal(CriteriaReport cri) {
		log.debug(" SERVICE >> getTotal({}) invoked.", cri);
		Objects.requireNonNull(this.mapper);

		return this.mapper.getTotal(cri);
	}//complete

}

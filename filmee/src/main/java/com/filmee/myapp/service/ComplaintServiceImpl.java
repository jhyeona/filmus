package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.ComCriteria;
import com.filmee.myapp.domain.ComplaintVO;
import com.filmee.myapp.mapper.ComplaintMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor// 생성자를 통한 의존성주입

@Service
public class ComplaintServiceImpl 
	implements ComplaintService, InitializingBean,DisposableBean{

	//매개변수가 하나라 자동으로 주입
	private ComplaintMapper mapper;

	
		@Override
		public void afterPropertiesSet() throws Exception {		
		      log.debug("afterPropertiesSet() invoked.");
			
		      Objects.requireNonNull(this.mapper); 
		      log.info("\t+ service: {} ",this.mapper);
		      
		}//afterPropertiesSet
	
	
		@Override
		public void destroy() throws Exception {
		      log.debug("destroy() invoked.");
			
		}//destroy
	

		@Override
	   public boolean register(ComplaintVO compl) {
	      log.debug("register({}) invoked.", compl);
	      
	      Objects.requireNonNull(this.mapper);
	      
	      int affectedLines = mapper.insert(compl);
	      
	      return (affectedLines == 1);
	      }//register



		@Override
		public List<ComplaintVO> getList() {
		      log.debug("getList() invoked.");
		       
		      Objects.requireNonNull(this.mapper);
			return mapper.getList();
		}//getList



		@Override
		public List<ComplaintVO> getListPerPage(ComCriteria cri) {
		     log.debug("getListPerPage({}) invoked.",cri);
			
		     log.info("\t+ cri:{}",cri);
		     
		      return this.mapper.getListWithPaging(cri);
		}//getListPerPage



	
		@Override
		public boolean temporary(ComplaintVO complaint) {
		      log.debug("temporary({}) invoked.",complaint);
		      
		      Objects.requireNonNull(this.mapper);
		      
			return (this.mapper.update(complaint)==1);
		}

		@Override
		public boolean completion(ComplaintVO complaint) {
		      log.debug("completion({}) invoked.",complaint);

			   Objects.requireNonNull(this.mapper);
			      
			return (this.mapper.endUpdate(complaint)==1);
		}//completion


		@Override
		public boolean remove(Integer compno) {
		      log.debug("remove({}) invoked.",compno);
		      
			   Objects.requireNonNull(this.mapper);

			return (this.mapper.delete(compno)==1);
		}//remove



		@Override
		public ComplaintVO get(Integer compno) {
		      log.debug("get({}) invoked.",compno);
		      
			   Objects.requireNonNull(this.mapper);
			   ComplaintVO complaintRead=this.mapper.select(compno);
			return complaintRead;
		}//get




		@Override
		public int getTotal(ComCriteria cri) {
			log.debug("getTotal({} invoked.", cri);
			
			log.info("\t+ cri : {}", cri);
			
			Objects.requireNonNull(this.mapper);
			
			return this.mapper.getTotalCount(cri);
		}






		
}

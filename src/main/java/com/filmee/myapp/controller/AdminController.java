package com.filmee.myapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@GetMapping("main")
	public void adminMain() {
		log.debug("adminMain");
	}
	
	
	
//	//mainChart의 count수 가져오기
//	@RequestMapping(value = "/getManagerMainCount", method = RequestMethod.POST)
//	@ResponseBody
//	public ModelAndView getManagerMainCount() {
//		//신규 1:1문의수
//		int inquire_db = managerMemberService.getManagerInquireCount();
//		//신고 게시글 처리중 수
//		int report_db = managerMemberService.getManagerReportCount();
//		//당일 신규 가입자 수
//		int newMember_db = managerMemberService.getManagerMemberCount();
//		//당일 판매 게시글 등록 수 불러오기 
//		int saleReport_db = managerMemberService.getManagerSaleReportCount();
//		
//		/*
//		 * Map<String, String> mapData = new HashMap<String, String>();
//		 * mapData.put("inquire_db", inquire_db+""); mapData.put("report_db",
//		 * report_db+""); mapData.put("newMember_db", newMember_db+"");
//		 * mapData.put("saleReport_db", saleReport_db+"");
//		 */
//		
//		//System.out.println("db에서 불러온 COUNT NUM = "+inquire_db+","+report_db+","+newMember_db+","+saleReport_db);
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("inquire_db",inquire_db+"");
//		mav.addObject("report_db",report_db+"");
//		mav.addObject("newMember_db",newMember_db+"");
//		mav.addObject("saleReport_db",saleReport_db+"");
//		
//		mav.setViewName("jsonView");
//		return mav;
//	}
//	//mainChart의 어제 날짜 count 가져오기  getManagerPrevCount
//	@RequestMapping(value = "/getManagerPrevCount", method = RequestMethod.POST)
//	@ResponseBody
//	public ModelAndView getManagerPrevCount() {
//		//신규 1:1문의수
//		int inquirePrevCount = managerMemberService.getPrevInquireCount();
//		//신고 게시글 처리중 수
//		int reportPrevCount = managerMemberService.getPrevReportCount();
//		//당일 신규 가입자 수
//		int newMemberPrevCount = managerMemberService.getPrevMemberCount();
//		//당일 판매 게시글 등록 수 불러오기 
//		int saleReportPrevCount = managerMemberService.getPrevSaleReportCount();
//		
//		/*
//		 * Map<String, String> mapData = new HashMap<String, String>();
//		 * mapData.put("inquire_db", inquire_db+""); mapData.put("report_db",
//		 * report_db+""); mapData.put("newMember_db", newMember_db+"");
//		 * mapData.put("saleReport_db", saleReport_db+"");
//		 */
//		
//		//System.out.println("db에서 불러온 COUNT NUM = "+inquirePrevCount+","+reportPrevCount+","+newMemberPrevCount+","+saleReportPrevCount);
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("inquire_db",inquirePrevCount+"");
//		mav.addObject("report_db",reportPrevCount+"");
//		mav.addObject("newMember_db",newMemberPrevCount+"");
//		mav.addObject("saleReport_db",saleReportPrevCount+"");
//		mav.setViewName("jsonView");
//		return mav;
//	}
//	
//	
//	@RequestMapping(value = "/getDatePickerInfo", method = RequestMethod.POST)
//	@ResponseBody
//	public ModelAndView getDatePickerInfo(@RequestParam Map<String, String> map) {
//		//System.out.println("map, getDatePickerInfo date의 값 넘어와야 함 "+map);
//	
//		//신규 1:1문의수
//		int inquirePickerCount = managerMemberService.getInquirePickerCount(map);
//		//신고 게시글 처리중 수
//		int reportPickerCount = managerMemberService.getReportPickerCount(map);
//		//당일 신규 가입자 수
//		int newMemberPickerCount = managerMemberService.getNewMemberPickerCount(map);
//		//당일 판매 게시글 등록 수 불러오기 
//		int saleReportPickerCount = managerMemberService.getSaleReportPickerCount(map);
//		//System.out.println("db에서 불러온 COUNT NUM = "+inquirePickerCount+","+reportPickerCount+","+newMemberPickerCount+","+saleReportPickerCount);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("inquirePickerCount",inquirePickerCount+"");
//		mav.addObject("reportPickerCount",reportPickerCount+"");
//		mav.addObject("newMemberPickerCount",newMemberPickerCount+"");
//		mav.addObject("saleReportPickerCount",saleReportPickerCount+"");
//		mav.setViewName("jsonView");
//		
//		return mav;
//	}
//	
//	@RequestMapping(value = "/getCalenderInfo", method = RequestMethod.POST)
//	@ResponseBody
//	public ModelAndView getCalenderInfo(@RequestParam Map<String, String> map) {
//		//System.out.println("map, getCalenderInfo date의 값 넘어와야 함 "+map);
//		
//		List<String> list = managerMemberService.getCalenderInfo(map);
//		
//		ModelAndView mav = new ModelAndView();
//		
//		mav.addObject("list",list);
//		mav.setViewName("jsonView");
//		
//		return mav;
//	}
	
	

}

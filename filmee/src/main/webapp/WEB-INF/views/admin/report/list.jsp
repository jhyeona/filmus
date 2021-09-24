<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device=width, initial-scale=1.0">
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="../../img/favicon_noback.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>

        $(function(){
            console.clear();
            console.log("jq started");

            $('a.prev,a.next').on('click', function(e){
                console.debug("on clicked for NEXT or PREV");
                console.log('\t+this:',this);
                e.preventDefault();

                var paginationForm = $('#paginationForm');

                paginationForm.attr('action', '/admin/report/list');
                paginationForm.attr('method', 'GET');

                paginationForm.find('input[name=currPage]').val($(this).attr('href'));
                paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
                paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');

                paginationForm.submit();
            })//onclick
        })//jq
    </script>


    <%@ include file="/resources/html/header.jsp" %>

    <style>
        body,input,textarea,select,button,table{font-family:'ELAND 초이스';}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em; line-height:1.5em; text-align:justify;}
        /* a-style */
        a{color:#333;text-decoration:none;}
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}

        body{
            width: 998px;
            margin: 0 auto;
            -ms-user-select: none; 
            -moz-user-select: -moz-none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            user-select: none; 
        }
        #admincontainer{
            float: right;
            width: 840px;
        }
		#adminboardlist {
			width:100%;
		    text-align: center;
		    margin: 20px ;
		    font-size: 20px;
            font-family: 'ELAND 초이스';
  			border-collapse: collapse;
        }
		#adminboardlist>tbody>tr>td{
		  	color: black;
		  	font-size:15px;
		  	padding: 15px;
  			border-bottom: 1px solid #ddd;	
        }
        #adminboardlist>thead>tr>th{
		  	font-weight: bold;
		  	border:10px;
		  	margin:10px;
		  	padding:15px;
            font-size: 18px;
  			border-bottom: 1px solid #ddd;
            background-color: rgb(255, 255, 255);
        }
        #adminboardlist>tbody>tr:hover {
  		  	background-color: #dddddd60;
        }
        #beforeComplete{
            color: rgb(192, 192, 192)
        }
        #pageNumber{
		  	text-align: center;
            padding: 8px 16px;
        }
        #pageNumber>li{
		 	display:inline-table;
		    text-align: center;
		    padding: 10px;
			font-size: 15px;
        }
        #pageNumber>li:hover{
            background-color: rgb(224, 224, 224);
        }
		.prev, .next{
			font-size: 20px;
		}
		.currPage{
            width: 15px;
        	background-color: #d8d8d88f;
        	color: rgb(45, 78, 139)!important;
            border-radius: 10%;
            font-size: 15px;
        }
        .forAdmin {
            letter-spacing: 2px;
            text-align: center;
            font-size: 17px;
            color: #525252;
            background-image: -webkit-linear-gradient(92deg, #626ca1, #515bb9);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            -webkit-animation: hue 10s infinite linear;
        }

        @-webkit-keyframes hue {
            from {
                -webkit-filter: hue-rotate(0deg);
            }
            to {
                -webkit-filter: hue-rotate(-360deg);
            }
        }
    </style>
</head>

<body>
    <div>
        <div>
            <table class="table table-hover">
                <thead>
                    <tr>
                    <th scope="col" id="adminonly"> 신고 현황 </th>
                    </tr>
                </thead>
            </table>
            <div id=menu>
                <%@include file="../menu.jsp"%>
            </div>
        </div>
        <div id="admincontainer">
            
            <div>
                <div>
                    <table id="adminboardlist">
                        <colgroup>
                            <col width="10%"/>
                            <col width="13%"/>
                            <col width="13%"/>
                            <col width="13%"/>
                            <col width="20%"/>
                            <col width="20%"/>
                            <col width="13%"/>
                        </colgroup>
                        <thead>
                            <tr id=listline>
                                <th>No.</th>
                                <th>유형</th>
                                <th>신고자</th>
                                <th>항목</th>
                                <th>접수일</th>
                                <th>처리일</th>
                                <th>처리자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="report">
                                    <tr>
                                        <td>${report.rptno}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${report.code=='1'}">욕/비방</c:when>
                                                <c:when test="${report.code=='2'}">스포일러</c:when>
                                                <c:when test="${report.code=='3'}">광고</c:when>
                                                <c:when test="${report.code=='4'}">기타</c:when>
                                            </c:choose>
                                        </td>
                                        <td>${report.accuser}</td>
                                        <td>
                                            <a href="/admin/report/detail?rptno=${report.rptno}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                                                <c:choose>
                                                    <c:when test="${report.target_type=='BNO'||report.target_type=='bno'}"><admin class="forAdmin">게시판</admin></c:when>
                                                    <c:when test="${report.target_type=='BCNO'||report.target_type=='bcno'}"><admin class="forAdmin">게시판댓글</admin></c:when>
                                                    <c:when test="${report.target_type=='RNO'||report.target_type=='rno'}"><admin class="forAdmin">리뷰</admin></c:when>
                                                    <c:when test="${report.target_type=='RCNO'||report.target_type=='rcno'}"><admin class="forAdmin">리뷰댓글</admin></c:when>
                                                </c:choose>
                                            </a>
                                        </td>
                                        <td><fmt:formatDate pattern="yyyy/MM/dd" value="${report.insert_ts}"/></td>
                                        <td>
                                            <c:if test="${report.complete_ts==null}">
                                                <beforeCom id="beforeComplete">처리전</beforeCom>
                                            </c:if>
                                            <fmt:formatDate pattern="yyyy/MM/dd" value="${report.complete_ts}"/>
                                        </td>
                                        <td>${report.mgr_id}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                    </table>
                </div>
                <div>
                    <form id="paginationForm">
                        <input type="hidden" name="currPage">
                        <input type="hidden" name="amount">
                        <input type="hidden" name="pagesPerPage">
        
                        <ul id="pageNumber">
                            <c:if test="${pageMaker.prev}">
                                <li class="prev"><a class="prev" href="${pageMaker.startPage-1}"> < </a></li>
                            </c:if>    
        
                            <c:forEach 
                                begin="${pageMaker.startPage}" 
                                end="${pageMaker.endPage}" 
                                var="pageNum">
                                <li class="${pageMaker.cri.currPage==pageNum?'currPage':''}">
                                    <a
                                        class="${pageMaker.cri.currPage==pageNum?'currPage':''}"
                                        href="/admin/report/list?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                                        ${pageNum}
                                    </a>    
                                </li>
                            </c:forEach>
                            <c:if test="${pageMaker.next}">
                                <li class="next"><a class="next" href="${pageMaker.endPage+1}"> > </a></li>
                            </c:if>   
                        </ul>
                    
                    </form>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>
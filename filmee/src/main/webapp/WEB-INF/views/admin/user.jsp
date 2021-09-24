<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/html/header.jsp" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device=width, initial-scale=1.0">
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">

    <link rel="stylesheet" href="/resources/css/bootstrap.css">


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
		#adminboardlist>td{
		  	color: black;
		  	font-size:15px;
		  	padding: 10px;
  			border-bottom: 1px solid #ddd;	
  		  }
        #adminboardlist>th{
		  	font-weight: bold;
		  	border:10px;
		  	margin:10px;
		  	padding:15px;
  			border-bottom: 1px solid #ddd;
  		  }
        #adminboardlist>tbody>tr:hover {
  		  	background-color: #dddddd60;
  		  }
    </style>
</head>

<body>
    <div>
        <div>
            <table class="table table-hover">
                <thead>
                    <tr>
                    <th scope="col" id="adminonly"> 회원 관리 </th>
                    </tr>
                </thead>
            </table>
            <div id=menu>
                <%@include file="../admin/menu.jsp"%>
            </div>
        </div>
        <div id="admincontainer">
            
            <div>
                <div>
                    <table id="adminboardlist">
                        <colgroup>
                            <col width="15%"/>
                            <col width="15%"/>
                            <col width="15%"/>
                            <col width="15%"/>
                            <col width="15%"/>
                            <col width="15%"/>
                        </colgroup>
                        <thead>
                            <tr id=listline>
                                <th>카테고리</th>
                                <th>글번호</th>
                                <th>작성자</th>
                                <th>제목</th>
                                <th>등록일</th>
                                <th>신고 횟수</th>
                            </tr>
                        </thead>
                        <tbody>
							<tr>
								<td></td>
							</tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>
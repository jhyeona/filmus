<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script>
        $(function(){
            console.clear();
            console.debug('>>> jq started.');

            $("#listBtn").on('click',function(){
                console.log(" >>> listBtn button clicked");
                location.href="/board/list?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"
            }) //on click

            $("#modifyBtn").on('click',function(){
                console.log(" >>> modifyBtn clicked");
                location.href="/board/modify?bno=${board.bno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"
            })//onclick

            $("#delete").on('click',function(){
                console.log("delete clicked.");
                alert("게시글을 삭제하시겠습니까?");
                let formobj=$('form');
                formobj.attr('action','/board/remove');
                formobj.attr('method','post');
                formobj.submit();
            })
        })//js
    </script>
    <style>
        body,input,textarea,select,button,table{font-family:'Florencesans SC Exp';}
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
		    font-size: 20px;
            font-family: 'ELAND 초이스';
		}
        #thiscategory{
            width: 90%;
            height: 100px;
            font-size: 50px;
            font-family: 'ELAND 초이스';
            text-align: center;
            margin: 0 auto;
        }
        #userinfo{
            display: inline-table;
            margin-left: 20px;
            height: 160px;
        }
        #getinfo{
            float: right;
            margin-top: 40px;
            margin-right: 20px;
        }
        #count>ul>li{
            float:right;
            font-size: 20px;
        }
        #title{
            width: 50%;
            height: 40px;
            font-size: 20px;
            padding: 10px;
            margin-bottom: 20px;
            border: 3px solid #eecede96; 
            background-color: #fcfcfc96; 
            border-radius: 30px;
            text-align: center;
        }
        #content{
            width: 100%;
            height: 100%;
            font-size: 15px;
            padding: 20px;
            border: 3px solid #eecede96; 
            background-color: #fcfcfc96; 
            border-radius: 30px;
        }

        button {
            margin-left: 20px;

            background-color: white;
            font-family: "ELAND 초이스";
            font-size: 20px;
            font-weight: 400;
            text-align: center;
            text-decoration: none;

            display: inline-block;
            width: auto;

            border: none;
            border-radius: 4px;

            /* box-shadow: 0 4px 6px -1px rgba(169, 235, 255, 0.781), 0 2px 4px -1px rgba(125, 160, 212, 0.425); */
            cursor: pointer;
            transition: 0.5s;
        }
        #listBtn{
            float: right;
        }
        #listBtn, #modifyBtn, #delete{
            background-color: #f3e5ec96;
            padding: 3px;
            margin-top: 20px;
            width: 90px;
            height: 40px;
        }
        #emptyheart{
            width: 20px;
            height: 20px;
        }
    </style>
</head>
<body>
    <div id="container">

        <div id="thiscategory">
            <c:choose>
                <c:when test="${board.category=='F'}">FREE BOARD</c:when>
                <c:when test="${board.category=='N'}">NEWS BOARD</c:when>
                <c:when test="${board.category=='B'}">BOASTFULNESS BOARD</c:when>
                <c:when test="${board.category=='R'}">RECOMMENDATION BOARD</c:when>
            </c:choose>
        </div>
        <form action="/board/get">
            <input type="hidden" name="currPage" value="${cri.currPage}">
            <input type="hidden" name="amount" value="${cri.amount}">
            <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">

            <input type="hidden" name="bno" value="${board.bno}">
            <div>
                <form action="/mypage">
                    <ul id="userinfo">
                        <li><a href="/mypage"><img src="/resources/img/common.jpg" alt="내사진" width="100px" height="100px"></a></li>
                        <li><a href="/mypage">usernickName</a></li>
                    </ul>
                    <ul id="getinfo">
                        <li>작성일 <fmt:formatDate pattern="yyyy/MM/dd" value="${board.insert_ts}"/></li>
                        <c:if test="${board.update_ts!=null}">
                        	<li>수정일 <fmt:formatDate pattern="yyyy/MM/dd" value="${board.update_ts}"/></li>
                    	</c:if>  
                    </ul>
                </form>
            </div>
            <div id="count">
                <ul>
                    <li><button type="button">신고</li>
                    <li><button type="button"><img id="emptyheart" src="/resources/img/emptyheart.png">${board.like_cnt}</li>
                    <li>조회수 ${board.view_cnt}</li>
                </ul>
            </div>


            <div>
                <p id="title">
                    ${board.title}
                </p>
            </div>


            <div id="content">
            	<p>
	               &nbsp;${board.content}
            	</p>
            </div>

 
            <button type="button" id="modifyBtn">수정</button>
            <button type="button" id="delete">삭제</button>
            <button type="button" id="listBtn">목록</button>
        </form>
    </div>
</body>
</html>
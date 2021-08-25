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

        $(function() {
            console.clear();
            console.log("jq started");

            $('#regBtn').click(function() {
                console.log("regBtn clicked !!");
                location.href="/board/register?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";//cri를 사용하기위해 controller에서 ModelAttribute하였음
            }); //.click

            $('a.prev, a.next').on('click', function(e) {
                console.debug("on clicked for NEXT or PREV");
                e.preventDefault(); 
                
                var paginationForm = $('#paginationForm');

                paginationForm.attr('action', '/board/list');
                paginationForm.attr('method', 'GET');
                
                console.log($(this));

                paginationForm.find('input[name=currPage]').val($(this).attr('href'));
                paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
                paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');
                paginationForm.find('input[name=type]').val('${pageMaker.cri.type}');
                paginationForm.find('input[name=keyword]').val('${pageMaker.cri.keyword}');

                paginationForm.submit();
            }); //onclick
        }); //jq
    </script>

    <!-- <link rel="stylesheet" href="/resources/css/board.css"> -->
    <!-- <link rel="stylesheet" href="/resources/css/bootstrap.css"> -->

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
		}
		#category>ul{
			text-align:center;
		}
		#category>ul>li{
			text-align: center;
		    display:inline-table;
		    width: 3%;
		    text-align: center;
		    padding: 30px;
		    
		}
        #category>ul>li>a:hover{
            color: rgb(128, 208, 240);
        }
		
		table {
			width:100%;
		    text-align: center;
		    margin: 20px ;
		    font-size: 20px;
            font-family: 'ELAND 초이스';
  			border-collapse: collapse;
		  }
		 td{
		  	color: black;
		  	font-size:15px;
		  	padding: 10px;
  			border-bottom: 1px solid #ddd;	
  		  }
		  th{
		  	font-weight: bold;
		  	border:10px;
		  	margin:10px;
		  	padding:15px;
  			border-bottom: 1px solid #ddd;
  		  }
  		  tbody>tr:hover {
  		  	background-color: #C2DBFE;
  		  }
  		  
		  #pageNumber{
		  	text-align: center;
		  }
		 #pageNumber>li{
		 	display:inline-table;
		    width: 3%;
		    text-align: center;
		    padding: 10px;
			font-size: 15px;
		 }
		.prev, .next{
			font-size: 30px;
		}
		.currPage{
        	background-color: rgb(128, 208, 240);
        	color: white!important;
        }
        #regBtn{
            float: right;
        }
        #boardSearchMenu>li{
            display:inline-table;
            margin-left: 73%;
        }
        .board_search_box{
            width: 100px;
            height: 25px; 
            line-height : normal; 
            padding: 0.3em 0.4em;
            margin: 0;
             border: none;
             border-radius: 4px;
             outline-style: none; 
            -webkit-appearance: none;
            -moz-appearance: none; 
            appearance: none;

      }
        button {
            margin: 0;
            padding: 0.5rem 1rem;

            background-color: white;
            font-family: "ELAND 초이스";
            font-size: 1rem;
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
        select {
            font-size: 1rem;
            font-weight: 400;
            font-family: 'ELAND 초이스';
            line-height: 1;

            color: #444;
            background-color: #fff;

            padding: 0.3em 0.4em;
            margin: 0;

            border: 1px solid rgb(255, 255, 255);
            border-radius: 0.5em;
            box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
        }
        #searchimg{
            width: 20px;
        }

    </style>
</head>
<body>

    <div>
        <div>
            <div id="category">
                <form id="category" action="/board/list" method="GET">
                    <input type="hidden" name="currPage" value="1">
                    <input type="hidden" name="amount">
                    <input type="hidden" name="pagesPerPage">
                    <input type="hidden" name="type">
                    <input type="hidden" name="keyword">
                    <input type="hidden" name="category">
                    <ul>
                        <li><a href="/board/list?&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">ALL</a></li>
                        <li><a href="/board/list?category=F&currPage=1&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">FREE</a></li>
                        <li><a href="/board/list?category=N&currPage=1&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">NEWS</a></li>
                        <li><a href="/board/list?category=B&currPage=1&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">BOASTFULNESS</a></li>
                        <li><a href="/board/list?category=R&currPage=1&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">RECOMMENDATION</a></li>
                    </ul>
                </form>
            </div>
            <div id="boardSearch">
                <ul id="boardSearchMenu">
                    <li>
                        <form id="searchForm" action="/board/list" method="GET">
                            <input type="hidden" name="currPage" value="1">
                            <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                            <input type="hidden" name="pagesPerPage" value="${pageMaker.cri.pagesPerPage}">
                            
                            <select name="type" class="form-select">
                                <option value="T" ${("T" eq pageMaker.cri.type) ? "selected":""}>제목</option>
                                <option value="C" ${("C" eq pageMaker.cri.type) ? "selected":""}>내용</option>
                                <option value="W" ${("W" eq pageMaker.cri.type) ? "selected":""}>작성자</option>
                            </select>
                        <input type="text" name="keyword" class="board_search_box" value="${pageMaker.cri.keyword}">
                        <button class="btn btn-info" ><img id="searchimg" src="/resources/img/search.png" ></button>
                        </form>
                    </li>
                </ul>
            </div>

        </div>
        <table id="boardlist">
            <thead>
                <tr>
                    <th>카테고리</th>
                    <th>번호</th>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>좋아요</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="board">
                    <tr>
                        <td>
                            <c:choose>
                                <c:when test="${board.category=='F'}">자유</c:when>
                                <c:when test="${board.category=='N'}">소식</c:when>
                                <c:when test="${board.category=='B'}">자랑</c:when>
                                <c:when test="${board.category=='R'}">추천</c:when>
                            </c:choose>
                        </td>
                        <td>${board.bno}</td>
                        <td>${board.writer}</td>
                        <td><a href="/board/get?bno=${board.bno}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${board.title}</a>[댓글수]</td>
                        <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.insert_ts}"/></td>
                        <td>${board.like_cnt}</td>
                        <td>${board.view_cnt}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <p>&nbsp;</p>
        <div>
            <button id="regBtn" class="btn btn-info" type="button">글쓰기</button>
        </div>

        <div id="pagination">
            <form id="paginationForm">
                <input type="hidden" name="currPage">
                <input type="hidden" name="amount">
                <input type="hidden" name="pagesPerPage">
                <input type="hidden" name="type">
                <input type="hidden" name="keyword">

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
                                href="/board/list?category=${pageMaker.cri.category}&currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
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

</body>
</html>
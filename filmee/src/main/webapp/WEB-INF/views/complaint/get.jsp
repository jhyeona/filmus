<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>get.jsp</title>

    <script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js></script>
    <script src=https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js></script>

    <script>
        $(function(){
            console.clear();
            console.debug('jq started..');

            $("#listBtn").on('click', function(){
                console.log('#listBtn button clicked..');

                // self.location.href = "/board/list";
                // self.location = "/board/list";
                location.href = "/complaint/list";
                // location.href = "/complaint/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
                // self.location.href = "/board/list";

                //location : 주소창
                // href : 주소창의 실제 url 주소를 넣는 속성
                // self = 윈도우객체(bom의 최상위 객체)
                // 다 똑같음
                
            }); //.onclick
            
            $("#temporaryBtn").on('click', function(){
                console.log('#temporaryBtn button clicked..');
                location.href = "/complaint/list";
                // location.href = "/complaint/temporary?compno=${complaint.compno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
            });

            $("#completeBtn").on('click', function(){
                console.log('#completeBtn button clicked..');
                location.href = "/complaint/list";
                // location.href = "/complaint/temporary?compno=${complaint.compno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
            });
        })
    </script>


</head>
<body>
    <div id="container">
        <div id="getHead">
            요청관리
        </div>

        <div id="getBody">
            <div>
                <a  id="listBtn">&#x027F8;</a>
            </div>
            <form action="/complaint/temporary" method="POST">
            

            <div>
                <c:choose>
                    <c:when test="${complaint.code == 1}">
                        서비스 개선요청
                    </c:when>
                    <c:when test="${complaint.code == 2}">
                        영화정보 추가요청
                    </c:when>
                    <c:when test="${complaint.code == 3}">
                        영화정보 수정요청
                    </c:when>
                    <c:otherwise>
                        기타
                    </c:otherwise>
                </c:choose>
            </div>

            <div>
                <textarea name="content" id="content" value="${complaint.content}" cols="35" rows="10">
                	
                </textarea>
            </div>

            <div>
                <div>
                    <button type="button" id="temporaryBtn">임시저장</button>
                </div>
                <div>
                    <button type="button" id="completeBtn">처리완료</button>
                </div>
            </div>
            </form>
        </div>

    </div>

    
</body>
</html>
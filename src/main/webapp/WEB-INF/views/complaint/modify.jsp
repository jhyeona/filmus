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
    <title>modify.jsp</title>

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
                
                location.href = "/board/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
                // self.location.href = "/board/list";

                //location : 주소창
                // href : 주소창의 실제 url 주소를 넣는 속성
                // self = 윈도우객체(bom의 최상위 객체)
                // 다 똑같음
                
            }); //.onclick

            $("#removeBtn").on('click', function(){
                console.log("#removeBtn button clicked./");

                let formObj = $("form") // 블록변수 => 지역변수

                formObj.attr('action', '/board/remove');    //***
                formObj.attr('method', 'POST');

                formObj.submit();   //실제 HTTP request 전송

            });//.onclick

            $("#cancelBtn").on('click', function(){
                console.log('#cancelBtn button clicked..');

                location.href = "/board/get?bno=${board.bno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
            });//.onclick
        })
    </script>


</head>
<body>
    <h1>/WEB-INF/views/board/modify.jsp</h1>

    <hr>
    <div id="wrapper">
        <form action="/board/modify" method="POST">
            <!-- <input type="hidden" name="bno" value="${board.bno}"> -->
            <!-- bno 안보여주고 전송만 시키는 방법 -->
            <input type="hidden" name="currPage" value="${cri.currPage}">
            <input type="hidden" name="amount" value="${cri.amount}">
            <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">

            <table border=1>

                <tbody>
                    <tr>
                        <td>
                            <label for="bno">Bno</label>
                        </td>
                        <td>
                            <input type="text" id="bno" name="bno" value="${board.bno}" readonly>
                            <!-- bno 읽기전용으로 보여주고 전송시키는 방ㅇ법 -->
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="title">Title</label>
                        </td>
                        <td>
                            <input type="text" id="title" name="title" value="${board.title}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="content">Content</label>
                        </td>
                        <td>
                            <input type="text" id="content" name="content" value="${board.content}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="writer">Writer</label>
                        </td>
                        <td>
                            <input type="text" id="writer" name="writer" value="${board.writer}">
                        </td>
                    </tr>

                </tbody>
            </table>

            <button type="submit" id="submitBtn">SUBMIT</button>
            <!-- action으로 post방식 전송 -->

            <button type="button" id="removeBtn">REMOVE</button>
            <button type="button" id="cancelBtn">CANCEL</button>
            <button type="button" id="listBtn">LIST</button>
        </form>
    </div>
</body>
</html>
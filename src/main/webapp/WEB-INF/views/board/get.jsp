<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
 
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <%@ include file="/resources/html/header.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/reply.js"></script>

    
    <script>
    	$(function(){
            console.log("========= COMMENT JS =======")
    		var bnoValue='<c:out value="${board.bno}"/>';
            var replyUL=$(".chat");            

            showList(1);
            function showList(page){
                console.log("showList !")
                replyService.getList({bno:bnoValue,page:page||1},function(list){
                    if(page== -1){
                        pageNum=Math.ceil(replyCnt/10.0);
                        showList(pageNum);
                        return;
                    }
                    var str="";
                    if(list==null||list.length==0){
                        return;
                    }//if
                    for(var i=0, len=list.length||0; i<len; i++){
                        str+="<li class='left clearfix' data-bcno='"+list[i].bcno+"'>";
                        str+="  <div><div class='header'><strong class='primary-font'>["+list[i].writer+"]</strong>";
                        str+="      <samll class='pull-right text-muted' id='commentTs'>작성 "+replyService.displayTime(list[i].insert_ts)+" <c:if test='"+list[i].update_ts+"'><br>수정 "+replyService.displayTime(list[i].update_ts)+"</c:if>"+"</small></div>";
                        str+="      <p>"+list[i].content+"</p></div></li><hr>";
                    }
                    replyUL.html(str);
                })//end function
            }//showList

            var modal = $(".modal");

            var modalInputReply=modal.find("input[name='content']");
            var modalInputReplyer=modal.find("input[name='writer']");
            var modalinputReplyDate=modal.find("input[name='insert_ts']");

            var modalModBtn=$("#modalModBtn");
            var modalRemoveBtn=$("#modalRemoveBtn");
            var modalRegisterBtn=$("#modalRegisterBtn");

            $("#addReplyBtn").on("click",function(e){
                console.log("addReplyBtn")
                modal.find("input").val("");
                modalinputReplyDate.closest("div").hide();
                modal.find("button[id!='modalCloseBtn']").hide();
                modalRegisterBtn.show();
                $(".modal").modal("show");
            })//onclick addReplyBtn

            modalRegisterBtn.on("click",function(e){
                console.log("content, bno: "+modalInputReply, bnoValue);
                reply={
                    content:modalInputReply.val(),
                    bno:bnoValue,
                    writer:1
                };
                replyService.add(reply,function(result){
                    alert(result);

                    modal.find("input").val("");
                    modal.modal("hide");
                    showList(1);
                })
            })//modalRegisterBtn

            $(".chat").on("click","li",function(e){
                console.log(" >> chat clicked.");
                bcno=$(this).data("bcno");
                console.log("bcno:"+bcno);
                console.log("content:"+modalInputReply);
                replyService.get(bcno, function(reply){
                    modalInputReply.val(reply.content);
                    modalInputReplyer.val(reply.writer).attr("readonly","readonly");
                    modalinputReplyDate.val(replyService.displayTime(reply.update_ts)).attr("readonly","readonly").hide();
                    modal.data("bcno",reply.bcno);

                    modal.find("button[id!='modalCloseBtn']");
                    modalModBtn.show();
                    $(".modal").modal("show");
                })
            })
            modalModBtn.on("click",function(e){
                console.log("modalModBtn Clicked");
            	var reply={bcno:bcno, content: modalInputReply.val()};
            	replyService.update(reply, function(result){
            	    alert("수정되었습니다.");

            		modal.modal("hide");
            		showList(1);
            	})
            })

			modalRemoveBtn.on("click",function(e){
                console.log("removeBtn clicked >> bcno:" +bcno);
				replyService.remove(bcno, function(result){
                    alert("삭제 되었습니다.");
					modal.modal("hide");
					showList(1);
				})
			})
    	})//jq

        

        $(function(){
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
                if(confirm("게시글을 삭제하시겠습니까?")){
                    let formobj=$('form');
                    formobj.attr('action','/board/remove');
                    formobj.attr('method','post');
                    formobj.submit();
                } else{
                	return false;
                }//if-else
            })//delete

            // var operForm = $("#operForm");
            // $("bottn[data-oper='modify']").on("click", function(e){
            //     operForm.attr("action","/board/modify").submit();
            // })
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
		#commentTs{
			float: right;
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
            background-color: #fcfcfc96; 
            border-radius: 30px;
        }
        #content{
            width: 100%;
            height: 100%;
            font-size: 15px;
            padding: 20px;
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
        #threeBtn{
            float: right;
        }

        #emptyheart{
            width: 20px;
            height: 20px;
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
        #commentList{
            display: inline-block;
            font-size: 16px;
        }
        #addReplyBtn{
            display: inline-block;
            float: right;
            font-size: 16px;
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
            <input type="hidden" name="fname" value="${file.fname}">
            <input type="hidden" name="writer" value="1"> <!-- ######## writer 값 바꿔주기 ######## -->

            <div>
                <form action="/mypage">
                    <ul id="userinfo">
                        <li><a href="/mypage"><img class="rounded-circle" src="/resources/img/common.jpg" alt="내사진" width="100px" height="100px"></a></li>
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
                    [<c:choose>
                       <c:when test="${board.category=='F'}">자유</c:when>
                       <c:when test="${board.category=='N'}">소식</c:when>
                       <c:when test="${board.category=='B'}">자랑</c:when>
                       <c:when test="${board.category=='R'}">추천</c:when>
                     </c:choose>] ${board.title}
                </p>
            </div>
			<hr>
            <div id="content">
            	<p>
	               &nbsp;${board.content}
            	</p>
            </div>
            <hr>
            <div id="threeBtn">
                <button type="button" id="modifyBtn" class="btn btn-outline-dark">수정</button>
                <button type="button" id="delete" class="btn btn-outline-dark">삭제</button>
                <button type="button" id="listBtn" class="btn btn-outline-dark">목록</button>
            </div>

            <div>
            	<c:if test="${file.fname!=null}">
	            	<p>&nbsp</p>
	            	<p>첨부파일</p>
		            <p><a class="btn btn-primary" href="/board/downloadFile/${board.bno}">${file.fname}</a></p>
	            </c:if>
            </div>

            <br>
     		<hr>
             <div class='row'>
                <div class='col-lg-12'>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i>댓글 목록
                            <button type="button" id="addReplyBtn" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">새 댓글 쓰기</button>
                            <hr>
                            <!-- Modal -->
                        </div>
                        <div class="panel-body">
                            <ul class="chat">
                                <li class="left clearfix" data-bcno='89' >
                                    <div>
                                        <div class="header">
                                            <strong class="primary-font"></strong>
                                            <small class="pull-right text-muted"></small>
                                        </div>
                                        <p></p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

              <!-- Modal -->
              <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">댓글 작성</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="content">내용</label>
                            <input class="form-control" name='content' value='content'>
                        </div>      
                        <div class="form-group">
                            <input type="hidden" class="form-control" name='writer' value=1>
                        </div>
                        <div class="form-group">
                            <input class="form-control" name='insert_ts' value='2018-01-01 13:13'>
                        </div>
                    </div>
                    <div class="modal-footer">
                      <button id='modalCloseBtn' type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
                      <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
                      <button id='modalRegisterBtn' type="button" class="btn btn-primary" data-bs-dismiss="modal">작성완료</button>
                    </div>
                  </div>
                </div>
              </div>


		</form>
    </div>
</body>
</html>
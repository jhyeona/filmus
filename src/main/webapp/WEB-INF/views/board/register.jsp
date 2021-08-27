<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="ko">
<head>
    <meta charset="UTF-8">

    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    
    <script>
        $(function(){
            console.log("jq started");
            $("#listBtn").click(function(){
            	console.log(this)
                console.log("listBtn Clicked");

                alert("작성 중이던 글이 있습니다. 정말 취소하시겠습니까?");
                location.href="/board/list?category=&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"
            })//listbtn
           
        })//jq
        function fn_addtoBoard(){
            
            var form = document.getElementById("writeForm");
            
            form.action = "register";
            form.submit();
            
        }//fn_addtoBoard

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
    }
    #writeapost{
        margin: 20px;
        text-align: center;
        font-size: 40px;
    }
    form{
        margin: 0 auto;
    }
    select {
    		float: left;
            font-size: 16px;
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
    </style>
</head>
<body>
    <div class="container">
		<div class="row">
			<form name="writeForm" method="post" id= "writeForm" enctype="multipart/form-data">
                
                <input type="hidden" name="currPage" value="${cri.currPage}">
                <input type="hidden" name="amount" value="${cri.amount}">
                <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
                <input type="hidden" name="userid" value="${board.writer}">
                <input type="hidden" name="writer" value="1">
                <input type="hidden" name="files">
           
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">글쓰기</th>
						</tr>
					</thead>
					<tbody>
                        <tr>
                            <td>
                                <select name="category" class="select">
                                    <option value='F'>자유</option>
                                    <option value='N'>소식</option>
                                    <option value='B'>자랑</option>
                                    <option value='R'>추천</option>
                                </select>
                            </td>
                        </tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
                        <tr>
                              <td><input type="file" class="form-control" name="files" multiple></td>
                        </tr>
					</tbody>
				</table>
                <button type="submit" id="submitBtn" onclick="fn_addtoBoard()" class="btn btn-primary pull-right">완료</button>
                <button type="button" id="listBtn"  class="btn btn-primary pull-right" >취소</button>
			</form>
		</div>
	</div>	
</body>
</html>

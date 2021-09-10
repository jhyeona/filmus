<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    <!DOCTYPE html>

    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <style>
        body,input,textarea,select,button,table{font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size:12px; color:#333;}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em; line-height:1.5em; text-align:justify;}
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}

            #header{
                background-color: #55072ef1;
                
                height: 200px;
            }
    
            
    
            #session{
                background-color:  #f1c0d900;;
                padding: 30px 0 30px 0 ;
    
                height: 400px;
                
                display: flex;
                
                flex-flow: row nowrap;
                justify-content: space-between;
            }
    
            #nav{
                font-size: 20px;
                color:  #5f2944fd;
    
                border-right: black solid 2px 90%;
                background-color: #ffffff;
                height: 400px;
                
                padding-top: 10px;
                flex-basis: 15%;
    
                display: flex;
                flex-flow: column nowrap;
                align-items: center;
            }
            #title{
                height: 30px;
                
                margin-bottom: 20px;
            }
            .nav{
      
                
                padding-top: 10px;
                height: 40px;
                border-radius: 5px;

            }
            #all:focus,#member:focus,#review:focus,#complaint:focus,#report:focus,#move:focus{
                border: 2px solid black;
            }
            
            #all:active,#member:active,#review:active,#complaint:active,#report:active,#move:active{
                background-color: blanchedalmond;
            }

         
    
            #main{
                border-radius: 5px;
                background-color: #ffffff3d;
                height: 400px;
                padding-top: 10px;
                flex-basis: 75%;
            }
    
            #aside{
                flex-basis: 10%;
            }
    
            #footer{
    
                background-color: #0f0108c5;
                border: 1px solid black;
                height: 200px;
            }

            #complaintPop{

                display: flex;
                flex-flow: column nowrap;
                justify-content: left;
                align-items: 100%;
                z-index: -2;
               
                width: 500px;
                height: 500px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 5);
                background: #fff;
                border-radius: 5px;
                text-align: right;
                padding: 20px;
                box-sizing: border-box;
                text-decoration: none; 

                transition: all 0.5s;
                display: none;
            }
            
        </style>
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    
        <script>
        $(function(){
    
            console.clear();
    
            $("#comp_close").click(function(){
                $("#popup").hide("compl");
            });//#hide
    
            $("#compl").click(function(){
                $("#popup").show("slow");
                $("#popup").add("z-index=2")
            });
         
            
            $("#all").click(function(){
                $('#all').focus( border);
                
    
            });
            $("#member").click(function(){

                
            });
            $("#review").click(function(){

                
            });
            $("#complaint").click(function(){
                $("#complaintPop").show();
                $("#complaintPop").add("z-index=2")
            });
            $("#complaint_close").click(function(){
                $("#complaintPop").hide();
                
            });
    
        });
    
        </script>
    
    </head>
    <body>
        
        <header>
            <div id="header">header</div>
        </header>
    
    
    
        <session  id="session">
            
            <div id="nav">
                
                <div id="title">관리자메뉴</div>
                
                <div class="nav" id="all">전체관리</div>
                <div class="nav" id="member">회원관리</div>
                <div class="nav" id="review">리뷰관리</div>
                <div class="nav" id="complaint">요청관리</div>
                <div class="nav" id="report">신고관리</div>
                <div class="nav" id="move">영화관리</div>
            </div>
    
            <div id="main">
                <jsp:include page="list.jsp"/>
            </div>
    
            <div id="aside"></div>
    
        </session>
    
        <div id="complaintPop">
            <div id="">
                요청관리
            </div>
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
                    <textarea name="content" id="content" cols="35" rows="10"></textarea>
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

           
    </body>
    </html>
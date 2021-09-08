<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
     

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>

 
        <style>
            #popup{

                display: flex;
                flex-flow: column nowrap;
                justify-content: left;
                position: absolute;
                z-index: -2;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
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

            #compl{
                
                display:  block; 
                width: 100px;
                height: 50px;
                
                border: 1px none;
                background: #f0adce96;
                text-decoration: none;
                text-align: center;
                line-height: 50px;
                color: #fff;
                border-radius: 50px;
            }

            #comp_close{
                color:  #f0adceed;
                text-decoration: none;
            }

            #select{
                display: flex;
                flex-flow: row;
                width: 120px;
                height: 40px;
                border: 2px solid #f0adce96;
                
            }

            #comp_text{
                border: 2px solid #f0adce96 ;
                font-size: 20px;
                width: 455px;
                
                
                margin-top: 5px;
                height: 340px;
                border: 2px solid #f0adce96;
            }
            #chackbox{
                display: flex;
                flex-flow: row;
            }

            #comp_submit{
                width: 460px;
                margin-top: 5px;
                color: white;
                background-color: #f0adce96;
                border: 2px solid #f0adce96;
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
           

            });

        </script>


    </head>
    <body>

        <button id="compl">요청하기</button>

        <div id="popup"> 
            <form action="/complaint/register" method="POST">
                <div id="comp_close">닫기</div>

                <select name="code" id="select">
                    <option value="1">버그리포트</option>
                    <option value="2">영화 수정</option>
                    <option value="3">영화 추가</option>
                    <option value="4">기타</option>
                </select>
                <div id="comp_cont">
                    <textarea name="content" id="comp_text" cols="54" rows="15"placeholder="내용을 입력하세요." ></textarea>
                    
                </div>
                <div id="comp_send">
                    <input type="checkbox" id="checkbox" name="send" value="1" checked>답변 받기
                </div>
                <button id="comp_submit" type="submit" value="result">보내기</button>
            </form>
        </div>
        
      
    </body>
</html>
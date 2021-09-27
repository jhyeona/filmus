<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<style>
	    body,input,textarea,select,button,table{font-family:'ELAND 초이스';}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em; line-height:1.5em; text-align:justify;}
        /* a-style */
        a{color:#333;text-decoration:none;text-align: center;}
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}
		#footer{
			margin-top : 60px;
		    height : 130px;
            background: lightgray;
		}
		
        #footer>div:first-of-type{
            width:998px;
            margin: 0 auto;
        }
		
		#footer_logoimg img{
            margin-top: 20px;
		    width : 200px;
		}
		
		#footer_info p {
		    text-align: center;
		    margin: 10px 0px 0px 0px;
		}
		
		#footer_info p:nth-of-type(3){
		    margin-top : 10px;
		}
		
		#footer_buttons div{
		    text-align: center;
		    margin-top: 50px;
		}
		
		#footer_buttons button:first-of-type{
		    border-radius: 100px;
		}		
	</style>


</head>
<body>
    <footer>
        <div id="footer">
            <div class="row">
                <div class="col-3" id="footer_logoimg">
                    <a href="/">
                    <img id="logoimg" src="/resources/img/filmusLogoFooterNoBack.png" alt="LOGO">
                    </a>
                </div>

                <div class="col-6" id="footer_info">
                    <p>Team_FILMUS</p>
                    <p>
                        address : 서울 강남구 강남대로94길 20 삼오빌딩 602호<br>
                        contact : 02-1234-5678 / team_filmus@filmus.co<a href="/admin/main">m</a>
                    </p>
                    <p>
                        ⓒ2021.FILMUS All rights reserved.
                    </p>
                </div>

                <div class="col-3" id="footer_buttons">
                    <div>
                        <a href="#"">
                            <button type="button" class="btn btn-outline-dark">TOP</button>
                        </a>
                    </div>
                </div>    
            </div>
        </div>
    </footer>
    
</body>
</html>
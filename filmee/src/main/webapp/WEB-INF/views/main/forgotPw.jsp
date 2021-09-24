<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FilMee</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

	<script>

		$(function(){
			console.log("jq started");

			$(".fg_pw_send_btn").on('click', function(e){
				var email = $('#forgot_pw_email').val(); //email : 지역변수
				// var email = $('#forgot_pw_email').val(); //email : 지역변수
				console.log("email forgotPw: ", email);
				

				if(email.length == 0){
					e.preventDefault();		//submit 취소

					$("#alert_modal p").text("이메일 주소를 입력하세요.");
					$("#alert_modal").modal("show");

				} else if(!isEmail(email)){
					e.preventDefault();		//submit 취소

					$("#alert_modal p").text("옳바른 이메일 형식이 아닙니다.");
					$("#alert_modal").modal("show");

				} else {
					checkEmail(email);

					if(!isEmailExist){
						e.preventDefault();		//submit 취소
						console.log("isEmailExist:",isEmailExist);

						$("#alert_modal p").text("등록된 이메일 주소가 아닙니다.");
						$("#alert_modal").modal("show");
					}//if

				}//if-elseIf-elseIf
			});//onclick .fg_pw_send_btn

		});//jquery

	</script>


</head>

<body>
	<%@include file="/resources/html/header.jsp" %>
		<div class="container" style="width: 600px;">
			<div class="row justify-content-center">
				<form class="row g-3" action="/main/newPassword" method="POST">
					<fieldset>
						<div class="mb-3">
							<label for="forgot_pw_email" class="form-label"><b>Email</b></label>
							<input type="email" class="form-control" id="forgot_pw_email" name="email"
								placeholder="가입에 사용한 이메일 주소를 입력하세요." autocomplete="username">
							<button type="submit" class="btn btn-primary mb-3 fg_pw_send_btn">SEND</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<%@include file="/resources/html/footer.jsp" %>

</body>

</html>
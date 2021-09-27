<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FILMUS</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

	<script>
		$(function(){
			console.log("jq started");
				
			$("#alert_modal p").text("로그인이 필요합니다.");
			$("#alert_modal").modal("show");
			
			var alertModalEl = document.getElementById('alert_modal');
			
			alertModalEl.addEventListener('hidden.bs.modal', function(){	
				$("#login").modal("show");
				$("#login .btn-close").on('click', function(){
					location.reload();
					history.go(-1);
				});//onclick login .btn-close
			});//alertModal eventListener

			$(window).unload(function(){
				deleteCookie("__ORIGINAL_REQUEST_URI__");
			});
		});//jquery
	</script>


</head>

<body>
	<%@include file="/resources/html/header.jsp" %>

</body>

</html>
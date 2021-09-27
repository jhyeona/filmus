	<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FILMUS</title>
	<link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/star-rating.css">
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

	<script>
		function reaction(){
			$.ajax({
				async : true,
				data : {
					userId : "${__LOGIN__.userId}",
					filmId : "${filmDetail.filmId}"
				},
				type : 'get',
				url : "/film/getFilmReaction",
				dataType : 'json',
				success : function(data){
					console.log("data :", data);
					console.log("favoriteCnt : ", data.favoriteCnt);
					console.log("watchedCnt : ", data.watchedCnt);
					console.log("wishToWatchCnt : ", data.wishToWatchCnt);
					console.log("userReaction : ", data.userReaction);
					
					$("#favorite_cnt").text(data.favoriteCnt);
					$("#watched_cnt").text(data.watchedCnt);
					$("#wishToWatch_cnt").text(data.wishToWatchCnt);
					
					let userReaction = data.userReaction;
					
					userReaction.includes(1) ? 
					$("#favorite_img").attr({
						src: "/resources/img/fullheart.png",
						title: "remove from favorite", 
						onclick:"javascript:addOrRemoveFilmReaction(1, 'removeReaction')"
					}) :
					$("#favorite_img").attr({
						src: "/resources/img/emptyheart.png",
						title: "add to favorite",
						onclick:"javascript:addOrRemoveFilmReaction(1, 'addReaction')"
					});
					
					userReaction.includes(2) ?
					$("#watched_img").attr({
						src: "/resources/img/watched2.jpg", 
						title: "remove from watched", 
						onclick:"javascript:addOrRemoveFilmReaction(2, 'removeReaction')"
					}) :
					$("#watched_img").attr({
						src: "/resources/img/watched1.jpg", 
						title: "add to watched", 
						onclick:"javascript:addOrRemoveFilmReaction(2, 'addReaction')"
					});

					userReaction.includes(3) ?
					$("#wishToWatch_img").attr({
						src: "/resources/img/watchlater2.jpg", 
						title: "remove from wish to watch", 
						onclick:"javascript:addOrRemoveFilmReaction(3, 'removeReaction')"
					}) :
					$("#wishToWatch_img").attr({
						src: "/resources/img/watchlater1.jpg", 
						title: "add to wish to watch", 
						onclick:"javascript:addOrRemoveFilmReaction(3, 'addReaction')"
					});
					
				} //success
				
			});//ajax

		}//reaction

		function addOrRemoveFilmReaction(code, url){
			console.log("RemoveFilmReaction() invoked.", code, url);

			if("${__LOGIN__}".length > 0){ 		
				$.ajax({
					async:true,
					data : {
						userId : "${__LOGIN__.userId}",
						filmId : "${filmDetail.filmId}",
						code : code
					},
					type : 'post',
					url : "/film/"+url,
					dataType : 'json',
					success : function(data){
						reaction();
					}//success
				});//ajax
			} else{
				$("#login").modal("show");  
			}//if-else

		}//addOrRemoveFilmReaction

 	 	$(function() {

			reaction();
			
  	 		$(window).scroll(function() {
  	 		   	 			
				var scrollTop = $(document).scrollTop();
				if (scrollTop < 490) {
				scrollTop = 490;
				}
				$("aside div").stop();
				$("aside div").animate( { "top" : scrollTop });
			});
  	 		  	 		
		    $("#cast_more").on('click', function() {				
				console.log("cast_more clicked.");

				$("#cast_list").toggleClass("five_lines_allowed");
				
			});//onclick cast_more_span

			$('a.prev, a.next').on('click', function(e) {
                console.debug("onclicked for a.next or a.prev");
                console.log('\t+ this : ', this);

                e.preventDefault();

                var paginationForm = $('#paginationForm');

                paginationForm.attr('action', '/admin/film/{filmDetail.filmId}');
                paginationForm.attr('method', 'GET');

                paginationForm.find('input[name=currPage]').val($(this).attr('href') );
                paginationForm.find('input[name=amount]').val( '${pageMaker.cri.amount}' );
                paginationForm.find('input[name=pagesPerPage]').val( '${pageMaker.cri.pagesPerPage}' );

                paginationForm.submit();

            });//onclick a.prev, a.next

			$("#reg_review_btn").on('click', function(e){
				console.log("reg_review_btn clicked.");

				e.preventDefault();

				let regReviewForm = $("#reg_review_form");
				var ratingVal = regReviewForm.find('input[name=rating]:checked').val();
				console.log("rating : ", ratingVal);
				
				if( ratingVal == null ){
					alert("별점 평가는 필수항목 입니다.");
				} else{
					regReviewForm.submit();
				}//if-else
			});//onclick reg_review_btn

		});//jquery
	</script>

	<style>
		#container {
		width: 998px;
		margin: 0 auto;
		font-family:'Florencesans SC Exp'; 
		word-break: keep-all;

		background: linear-gradient(to top, white, white 70%, transparent),
					url("https://www.themoviedb.org/t/p/original${filmDetail.backdropPath}");
		background-repeat: no-repeat;
		background-size: contain;
		}
		#gap{
			height:300px;
		}

		.film_header{
			margin : 35px 0px 25px 0px;		
		}

		.film_header p{
			font-size: 17px;
		}

		.film_header strong{
			font-size : 35px;
			font-weight: bold;
		}

		#plot{
			margin-top:60px;
			width: 650px;
		}

		#people{
			margin-top:50px;
			width: 650px;
			font-size: 15px;
		}

		.sub_header{
			font-size: 23px;
			text-decoration: underline;
			margin-bottom: 10px;
		}
		
		#cast{
			margin-top: 20px;
		}
		
		.five_lines_allowed{
        	display: -webkit-box;
        	-webkit-line-clamp: 5 ;
       		-webkit-box-orient: vertical;
		}
		
		.long_text{
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: pre-line;        	
			word-wrap: break-word;
		}
		
		#cast_more{
		    padding: 3px 6px;
		    margin: 10px 0 0 540px;
		}		

		#people a{
			display: inline;
			margin-right: 15px;
			background-color: rgb(224, 224, 224);
		}

		#reviews{
			margin-top: 70px;
			margin-bottom : 20px;
			width: 650px;
			font-size: 14px;
		}

		#reviews strong{
			font-size : 18px;
			font-weight: bold;
		}

		#review_content{
			overflow: hidden;
        	text-overflow: ellipsis;
        	white-space: pre-line;        	
			word-wrap: break-word;
        	display: -webkit-box;
        	-webkit-line-clamp: 5 ;
       		-webkit-box-orient: vertical;  	
		}

		#profile_photo{
			text-align: center;
		}

		aside{
			margin-top: 300px;
			text-align: center;
		}

		#aside_film{
			position : absolute;
		}
		aside img{
			margin-top: 10px;
			width: 228px;
			border: 1px solid white;
		}

		aside p{
			margin-top : 10px;
			text-align: center;
			font-size: 18px;
			font-weight: bold;
		}

		#reaction div{
			width: 60px;
			height: 45px;
			margin: 0 auto;
		}
		
		#reaction div:nth-of-type(2){
			margin-top: 6px;
		}

		#reaction p{
			font-size: 13px;
			font-family: 'ELAND 초이스';
		}

		#register_review_btn{
			margin-top:40px;
			display: none;
		}

		.inner-star::before {
            color: pink;            
        }
        
        .outer-star {
            position: relative;
            display: inline-block;
            color: rgb(177, 175, 175);
        }
        
        .inner-star {
            position: absolute;
            left: 0;
            top: 0;
            width: 0%;
            overflow: hidden;
            white-space: nowrap;
        }
        
        .outer-star::before, .inner-star::before {
            content: '\f005 \f005 \f005 \f005 \f005';
            font-family: 'Font Awesome 5 free';
            font-weight: 900;
			font-size: 150%;
        }

		#pageNumber{
		  	text-align: center;
            padding: 8px 16px;
        }

        #pageNumber>li{
		 	display:inline-table;
		    text-align: center;
		    padding: 10px;
			font-size: 15px;
        }

        #pageNumber>li:hover{
            background-color: rgb(224, 224, 224);
        }

		.prev, .next{
			font-size: 20px;
		}

		.currPage{
            width: 15px;
        	background-color: #d8d8d88f;
        	color: rgb(45, 78, 139)!important;
            border-radius: 10%;
            font-size: 15px;
        }
	</style>

</head>

<body>
	<%@include file="/resources/html/header.jsp" %>
	<div id="container">
		<div id="gap"></div>
		<div class="row">
			<section class="col-9">
				<div class="film_header">
					<p>
						<strong>${filmDetail.originalTitle}</strong>
						[${filmDetail.releaseDate}]
					</p>
					<div class='RatingStar'>
						<div class='RatingScore'>
							<div class='outer-star'>
								<div class='inner-star' style='width: ${filmDetail.width}%'></div>
							</div>
							${filmDetail.avgRate} / 5.0
						</div>
					</div>
				</div>	
				<div id="plot">${filmDetail.plot}</div>
				<div id="people">
					<div id="director">
						<p class="sub_header">DIRECTOR</p>
						<div class="long_text"><c:forEach items="${director}" var="director"><a href="/search/people/${director.peopleId}">${director.enName}</a></c:forEach></div>
					</div>
					<div id="cast">
						<p class="sub_header">CAST</p>
						<div class="long_text five_lines_allowed" id="cast_list"><c:forEach items="${cast}" var="cast"><a href="/search/people/${cast.peopleId}">${cast.enName}</a></c:forEach></div>
						<button type="button" class="btn btn-outline-warning" id="cast_more">show all/less</button>
					</div>
				</div>
				<div id="reviews">
					<p class="sub_header">REVIEW</p>
					<c:forEach items="${reviews}" var="review">
						<div class="row">
							<div class="col-2" id="profile_photo">
								<a href="http://localhost:8090/mypage/main?userid=${review.writer}"><img class="rounded-circle" src="https://younghoon.s3.ap-northeast-2.amazonaws.com/${review.profilePhotoPath}" alt="profile_photo" width="50px" height="50px"></a>
							</div>
							<div class="col-10">
								<p>reviewd by <strong><a href="http://localhost:8090/mypage/main?userid=${review.writer}">${review.nickname}</a></strong>			
								<img src='/resources/img/fullheart.png' style='height:25px;'>${review.likeCnt}</a>    
								<a href='/film/${filmDetail.filmId}/review/${review.rno}'><img src='/resources/img/reply.png' style='height:25px;'>${review.commentCnt}</a></p>								  
								<div class='RatingStar'>
									<div class='RatingScore'>
										<div class='outer-star'>
											<div class='inner-star' style='width: ${review.width}%'></div>
										</div>
										${review.rate} / 5.0                           
									</div>
								</div>
								<div class="long_text five_lines_allowed"><a href='/film/${filmDetail.filmId}/review/${review.rno}'>${review.content}</a></div>
								<hr>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
			<aside class="col-3">
				<div id="aside_film">
					<img src="https://www.themoviedb.org/t/p/original${filmDetail.posterPath}" alt="filmPoster" id="filmPoster">
					<p>${filmDetail.originalTitle}</p>
					<div class="row" id="reaction">
						<div>
							<img id="favorite_img" style="width: 40px; cursor: pointer;">
							<p id="favorite_cnt" style="margin-top: 2px; margin-left: 4px;"></p>
						</div>
						<div>
							<img id="watched_img" style="width: 43px; margin-top: 5px; cursor: pointer;">
							<p id="watched_cnt" style="margin-left: 6px;"></p>
						</div>
						<div>
							<img id="wishToWatch_img" style="width: 36px; cursor: pointer;">
							<p id="wishToWatch_cnt" style="margin-top: 8px;"></p>
						</div>
					</div>
					<button type="button" class="btn btn-outline-dark" id="register_review_btn" data-bs-toggle="modal" data-bs-target="#reg_review">Register a review</button>
				</div>
			</aside>
		</div>
		<div>
			<form id="paginationForm">
				<input type="hidden" name="currPage">
				<input type="hidden" name="amount">
				<input type="hidden" name="pagesPerPage">
	
				<ul id="pageNumber">
					<c:if test="${pageMaker.prev}">
						<li class="prev"><a class="prev" href="${pageMaker.startPage-1}"></a></li>
					</c:if>    
	
					<c:forEach 
						begin="${pageMaker.startPage}" 
						end="${pageMaker.endPage}" 
						var="pageNum">
						<li class="${pageMaker.cri.currPage==pageNum?'currPage':''}">
							<a
								class="${pageMaker.cri.currPage==pageNum?'currPage':''}"
								href="/film/${filmDetail.filmId}?category=${pageMaker.cri.category}&currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
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


	<!-- reg_review Modal -->
	<div class="modal fade input_modal" id="reg_review" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="staticBackdropLabel"><b>Register a review</b></h2>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body row">
					<div class="col-4">
						<img src="https://www.themoviedb.org/t/p/original${filmDetail.posterPath}" width="230px" alt="filmPoster" id="filmPoster">
					</div>
					<div class="col-8 film_header">
						<p>
							<strong>${filmDetail.originalTitle}</strong>
							[${filmDetail.releaseDate}]
						</p>						
						<form action="/film/regReview" method="POST" id="reg_review_form">
							<input type="hidden" name="filmId" value="${filmDetail.filmId}">
							<input type="hidden" name="writer" value="${__LOGIN__.userId}">
							<!-- <input type="hidden" name="currPage" value="${cri.currPage}">
							<input type="hidden" name="amount" value="${cri.amount}">
							<input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}"> -->

							<div class='rating-wrap'>
								<fieldset class='rating'>
									<input type='radio' id='star5' name='rating' value='5.0' /><label for='star5' class='full'></label>
									<input type='radio' id='star4.5' name='rating' value='4.5' /><label for='star4.5' class='half'></label>
									<input type='radio' id='star4' name='rating' value='4.0' /><label for='star4' class='full'></label>
									<input type='radio' id='star3.5' name='rating' value='3.5' /><label for='star3.5' class='half'></label>
									<input type='radio' id='star3' name='rating' value='3.0' /><label for='star3' class='full'></label>
									<input type='radio' id='star2.5' name='rating' value='2.5' /><label for='star2.5' class='half'></label>
									<input type='radio' id='star2' name='rating' value='2.0' /><label for='star2' class='full'></label>
									<input type='radio' id='star1.5' name='rating' value='1.5' /><label for='star1.5' class='half'></label>
									<input type='radio' id='star1' name='rating' value='1.0' /><label for='star1.0' class='full'></label>
									<input type='radio' id='star0.5' name='rating' value='0.5' /><label for='star0.5' class='half'></label>
								</fieldset>
							</div>
							<p id='rating-value'></p>					
							<script src='/resources//js/star-rating.js'></script>
							<div class="mb-3">
								<textarea id="review_content" class="form-control" placeholder="write your review here..." name="content" maxlength="2048" style="overflow-x:hidden; overflow-y:auto; height:180px;"></textarea>
							</div>
							<div class="form-check">
								<label class="form-check-label" for="spoiler"><b>this review contains spoilers</b></label>
								<input class="form-check-input" type="checkbox" name="spoiler" id="spoiler">
							</div>
							<div class="d-grid gap-2">
								<!-- <button type="submit" id="reg_review_btn" class="btn btn-primary">REGISTER</button> -->
								<button type="submit" id="reg_review_btn" class="btn btn-primary g-recaptcha" 
                                data-sitekey="<fmt:message key='recaptcha-key' bundle='${API_KEY}' />"
                                data-callback='onSubmit' 
                                data-action='submit'>REGISTER</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/resources/html/footer.jsp" %>

</body>

</html>
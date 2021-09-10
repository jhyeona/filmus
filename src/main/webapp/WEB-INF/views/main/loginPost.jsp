<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<<<<<<< HEAD:src/main/webapp/WEB-INF/views/main/loginPost.jsp
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main.jsp</title>

</head>
<body>
	<h1>WEB-INF/views/main/loginPost.jsp</h1>
	
	<hr>
	없으면 오류나서 만들어둠. 실제로 여기로 이동하지는 않음
=======
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">
    </head>

    <link rel="icon" href="/img/favicon_noback.ico" type="image/x-icon">

    <link rel="stylesheet" href="/resources/css/layout.css">
    <link rel="stylesheet" href="/resources/css/swiper.css">
    <link rel="stylesheet" href="/resources/css/main.css">

    <script src="/resources/js/jquery-1.8.3.min.js"></script>
    <script src="/resources/js/swiper.js"></script>
    <script>
        window.onload = function(){
            var swiper = new Swiper('.swiper-container', {
                        pagination: '.swiper-pagination',
                        paginationType: 'progress',
                        slidesPerView: 'auto',
                        paginationClickable: true,
                        spaceBetween: 0,
                        freeMode: true,
                        nextButton: '.next',
                        prevButton: '.back'
            });
        };
    </script>
    

<body>
    <%@include file="/resources/html/header.jsp"  %>

    <section id="section">
            
 
        <div id="mainback">
            <img class="img-fluid" src="/resources/img/common.jpg" alt="mainbackimg" width="998">
    
        </div>


        <div id="mainText">
            <p>
                Track films you’ve watched.<br> Save those you want to see.<br>Tell your friends what’s good.
            </p>
            <p></p>
            <p>
                The social network for film lovers.
            </p>
        </div>
        <section class="feature">
            <div class="inWrap">
                <div class="fInner swiper-container">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem01.jpg" alt="">도리를 찾아서</span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem02.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem03.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem04.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem05.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem06.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem07.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem08.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem09.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem10.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem11.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem12.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem13.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem14.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem15.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem16.jpg" alt=""></span></a></li>
                    </ul>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                </div>
                <div class="button">
                    <div class="back"><a href="#"><span class="hidden">back</span></a></div>
                    <div class="next"><a href="#"><span class="hidden">next</span></a></div>
                </div>
            </div>
        </section>

        <section class="feature">
            <div class="inWrap">
                <div class="Finner wriper-container">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide"><a href="#"><img src="/resources/img/fitem01.jpg" alt=""></a></li>
                        <li class="swiper-slide"><a href="#">제목.작성자.좋.댓</a></li>
                        <li class="swiper-slide"><a href="#"><img src="/resources/img/fitem01.jpg" alt=""></a></li>
                        <li class="swiper-slide"><a href="#">제목.작성자.좋.댓</a></li>
                    </ul>
                </div>
            </div>
        </section>

    </section>  
    <%@include file="/resources/html/footer.jsp" %>
      
>>>>>>> 123f9f9a8ee1ab87befd0100df7b39bd4690db9a:src/main/webapp/WEB-INF/views/main.jsp
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>


<html id="html" lang="ko" >

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=1024" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    
    
 
    <!--이거없으면 BACKDROP이미지 흐리게보임..왜인진모름  -->
    <script>
        var isMobile = false,
            isMobileOptimised = true,
            renderMobile = false,
            useStaticFonts = false,
            disableFrameProtection = false;
    </script>
    <title>&lrm;${filmVO.title} • FILMEE </title>

		<%@include file="../../resources/html/header.jsp" %>   
	
  
    <!-- CSS -->
    
    <link href="../resources/css/film.css" rel="stylesheet" media="screen, projection" />
   
    <script> 

        if (screen.width < 768) {
            var date = new Date();
            var maxAge = 365 * 24 * 60 * 60;
            date.setTime(date.getTime() + maxAge * 1000);
            var expires = '; expires=' + date.toUTCString();
            document.cookie = "useMobileSite=yes" + expires + "; path=/; maxAge=" + maxAge;
            if (document.cookie && document.cookie.indexOf("useMobileSite=yes") >= 0) {
                window.location.reload(true);
            } else {
                // No cookies.  No Mobile version.
            }
        }


        var isWindows = navigator.platform.toUpperCase().indexOf('WIN') >= 0; // Detect windows platform
        if (isWindows) { document.documentElement.classList.add('is-windows'); }

    </script>

    <script src="https://s.ltrbxd.com/static/js/main.min.ed93f370.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
<!-- 	 <script src="../../resources/js/film.js"></script>
 	 <script src="../../resources/js/film2.js"></script> -->
 	 
<!-- 	<script>
	function () {
        $("#cast-overflow").length &&
          $("#show-cast-overflow").on("click", function () {
            $(this).hide(), $("#cast-overflow").fadeIn();
          })         
      }
	</script>
 -->


    <script>
        if ($.cookie("letterboxd.admin.signed.in") === person.username) {
            successMessages.push("You are signed in as " + person.username);
            $(function () { $("#header, #content, body").css("background", "#543"); });
        }
    </script>

	<style>
	
		* {
			font-family: 'ELAND 초이스';
		}
		
	
	</style>

</head>

    <!-- 스틸컷 -->
<body class="film backdropped" data-type="film" data-tmdb-type="movie" data-tmdb-id="${filmVO.film_id}">

        <div class="backdrop-container">
        <div id="backdrop" class="backdrop-wrapper "
            data-backdrop="https://www.themoviedb.org/t/p/original${filmVO.backdrop_path}" width="1200" height="675"          
            data-offset="0">
            <div class="backdropimage js-backdrop-image" style="background-position: center -0px;"></div>
            <div class="backdropmask js-backdrop-fade"></div>
        </div>
    </div>
    
        <div
          class="react-component"
          data-component-class="globals.comps.NavComponent"
        ></div>


    <script>
        var filmData = { id: 26711,  gwiId: 24270, releaseYear: "2010", posterURL: "/film/the-social-network/image-150/", path: "/film/the-social-network/" };
    </script> 




    <div id="content" class="site-body -backdrop">
        <div class="content-wrap">


            <div id="film-page-wrapper" class="cols-3 overflow">

                <div class="col-6 gutter-right-1 col-poster-large" id="js-poster-col">
                            <img
                                src="https://www.themoviedb.org/t/p/original${filmVO.poster_path}"
                                width="230" height="345" alt="${filmVO.original_title}" class="image"                               
                                itemprop="image" /> <span class="frame"><span class="frame-title"></span></span>
                        </div>
                        <div class="js-serial-csi" data-src="/esi/film/the-social-network/stats/" data-on-load="">
                            <ul class="film-stats">
                                <li class="stat"><a class="has-icon icon-placeholder">&nbsp;</a></li>
                            </ul>
                        </div>

              
               
 
                <div class="col-17">
                    <section id="featured-film-header" class="film-header-lockup -default">

                        <h1 class="headline-1 js-widont prettify">${filmVO.original_title}</h1>

                        <p>
                            <small class="number">
                            <fmt:formatDate value="${filmVO.release_date}" pattern="yyyy" />
                            </small>
                            Directed by                                                   
								<c:forEach items="${filmPeopleVOList}" var="filmPeopleVO">
									<c:if test="${filmPeopleVO.credit_order eq null}">
									<a href="/people/${filmPeopleVO.enname}/"><span class="prettify"> 
										${filmPeopleVO.enname} </span></a>
									</c:if>
								</c:forEach>
                        </p>

                    </section>

                    <section class="section col-10 col-main">

                        <section>


                            <div class="review body-text -prose -hero prettify">                          
                                <div class="truncate" data-truncate="450">                              
                                    ${filmVO.plot}                         
                                </div>
                            </div>

                        </section>

                        <div id="tabbed-content" data-selected-tab>
                            <header>
                                <ul>
                                    <li class="active"><a href="#tab-cast" data-id="cast">Cast</a></li>
                                    <li><a href="#tab-details" data-id="details">Details</a></li>  
                                </ul>
                            </header>

                            <div id="tab-cast" class="tabbed-content-block" style="display:block;">
                            <h3 class="hidden">Cast</h3>
                                <div class="cast-list text-sluglist">
                                     <p> 
                                     <c:forEach items="${filmPeopleVOList}" var="filmPeopleVO" begin="0" end="29"  varStatus="status">
	                                     <c:if test="${filmPeopleVO.credit_order != null}">
		                                   <a title="${filmPeopleVO.character}" href="/people/${filmPeopleVO.enname}"
		                                     class="text-slug tooltip">${filmPeopleVO.enname}</a>
		                                     
										 </c:if>
									</c:forEach> 
                                        

                                        <!-- 캐스트 너무 많으면 CAST-OVERFLOW : show all 클릭하면 펼쳐짐 -->
                                        <a class="text-slug" id="show-cast-overflow" >Show All&hellip;</a>
                                        <span id="cast-overflow" style="display:none;">
                                            <c:forEach items="${filmPeopleVOList}" var="filmPeopleVO" begin="30"  varStatus="status">
	                                     		<c:if test="${filmPeopleVO.credit_order != null}">
				                                   <a title="${filmPeopleVO.character}" href="/people/${filmPeopleVO.enname}"
				                                     class="text-slug tooltip">${filmPeopleVO.enname}</a>
										 		</c:if>
											</c:forEach> 
    									</span>
									</p>                               
                                </div>
                            </div>

              
                            <div id="tab-details" class="tabbed-content-block column-block" style="display: none;">    
                            	<h3 class="hidden">Details</h3> 
                            <h3><span>Countries</span></h3>                           
                                <div class="text-sluglist">
                                    <p> ${filmVO.country} </p>                                   
                                </div>
                            <h3><span>Genre</span></h3>
                             <div class="text-sluglist">
                                    <p> ${filmGenreVO.genre} </p>                                   
                                </div>
                            </div>

                        </div>

                        <p class="text-link text-footer">

                            ${filmVO.runtime}&nbsp;mins &nbsp;

                            <span
                                class="report-link has-icon icon-report hide-when-logged-out tooltip tooltip-close-on-click"
                                title="Report this film" data-report-url="/ajax/film:26711/report-form">Report this
                                film</span>
                        </p>


                    </section>


                    <!-- 좋볼본, 리뷰, 별점 남기는 부분  -->
                    <aside class="sidebar">
                        <section id="userpanel" class="actions-panel">
                            <ul class="js-actions-panel">


                                <li class="action-large -watch"><span class="film-watch-link-target"
                                        data-film-id="26711"><span class="film-watch-link -large"><span
                                                class="action -watch ajax-click-action"
                                                data-action="/film/the-social-network/mark-as-watched/">Watch</span></span></span>
                                </li>
                                <li class="action-large -like"><span class="like-link-target react-component"
                                        data-component-class="globals.comps.LikeLinkComponent"
                                        data-likeable-uid="film:26711" data-likeable-name="film" data-likeable="true"
                                        data-likes-page="/film/the-social-network/likes/" data-format="large"><span
                                            class="like-link"><span class="action -like ajax-click-action  "
                                                data-action="/s/film:26711/like/"
                                                data-recaptcha-action="film_like">Like</span></span></span></li>



                                <li class="hidden action-large -watchlist"><a href="#" data-film-id="26711"
                                        class="action -watchlist -on remove-from-watchlist ajax-click-action"
                                        data-action="/film/the-social-network/remove-from-watchlist/"><span
                                            class="watchlist-link-text"><span class="_hidetext">This film is in your
                                            </span>Watchlist</span></a></li>
                                <li class="action-large -watchlist"><a href="#"
                                        class="action -watchlist add-to-watchlist ajax-click-action"
                                        data-film-id="26711"
                                        data-action="/film/the-social-network/add-to-watchlist/">Watchlist</a></li>

                                <li class="-row-clear panel-rate js-panel-rate">
                                    <span class="rateit-label js-rateit-label">Rate</span>
                                    <input id="frm-sidebar-rating" data-film-id="26711" class="panel-rateit-field"
                                        type="range" min="0" max="10" step="1" value="0" style="display: none;">
                                    <div class="rateit panel-rateit instant-rating" data-film-id="26711"
                                        data-rate-action="/film/the-social-network/rate/"
                                        data-rateit-backingfld="#frm-sidebar-rating" data-rateit-starwidth="18"
                                        data-rateit-starheight="32" data-rateit-resetable="false"><button
                                            id="rateit-reset-2" class="rateit-reset" aria-label="reset rating"
                                            aria-controls="rateit-range-2" style="display: none;"></button>
                                        <div id="rateit-range-2" class="rateit-range" tabindex="0" role="slider"
                                            aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0"
                                            aria-valuemax="10" aria-valuenow="0" aria-readonly="false"
                                            style="width: 180px; height: 32px;">
                                            <div class="rateit-selected" style="height: 32px; width: 0px;"></div>
                                            <div class="rateit-hover" style="height:32px"></div>
                                        </div>
                                    </div>
                                </li>


                                <li><a href="${filmid}/review/register" class="add-this-film "> 리뷰 남기기 </a>
                                </li>



                            </ul> 
                        </section>


                        <!-- 별점분포 그래프로 나타내기 - 어려우면 안할수도ㅋ -->
                        <section class="section ratings-histogram-chart">
                            <h2 class="section-heading"><a href="/film/the-social-network/ratings/" class=""
                                    title="">Ratings</a></h2>  <span class="average-rating"
                                itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating"> <a
                                    href="/film/the-social-network/ratings/" class="tooltip display-rating"
                                    data-original-title="Weighted average of 3.94 based on 512,169&nbsp;ratings">3.9</a>
                            </span>
                            <div class="rating-histogram clear rating-histogram-exploded"> <span
                                    class="rating-green rating-green-tiny rating-1"><span
                                        class="rating rated-2">★</span></span>
                                <ul>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 0px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip"
                                            data-original-title="1,034&nbsp;half-★ ratings (0%)">1,034&nbsp;half-★
                                            ratings (0%)<i style="height: 1.2879252956184999px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 16px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip"
                                            data-original-title="3,373&nbsp;★ ratings (1%)">3,373&nbsp;★ ratings (1%)<i
                                                style="height: 1.9392379324189557px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 32px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip"
                                            data-original-title="1,979&nbsp;★½ ratings (0%)">1,979&nbsp;★½ ratings
                                            (0%)<i style="height: 1.5510678530261233px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 48px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip"
                                            data-original-title="15,442&nbsp;★★ ratings (3%)">15,442&nbsp;★★ ratings
                                            (3%)<i style="height: 5.299944308453459px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 64px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip"
                                            data-original-title="13,024&nbsp;★★½ ratings (3%)">13,024&nbsp;★★½ ratings
                                            (3%)<i style="height: 4.6266335107691905px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 80px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip"
                                            data-original-title="74,896&nbsp;★★★ ratings (15%)">74,896&nbsp;★★★ ratings
                                            (15%)<i style="height: 21.8553703487845px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 96px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip"
                                            data-original-title="65,474&nbsp;★★★½ ratings (13%)">65,474&nbsp;★★★½
                                            ratings (13%)<i style="height: 19.231741591224047px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 112px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip"
                                            data-original-title="154,422&nbsp;★★★★ ratings (30%)">154,422&nbsp;★★★★
                                            ratings (30%)<i style="height: 44.0px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 128px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip"
                                            data-original-title="71,170&nbsp;★★★★½ ratings (14%)">71,170&nbsp;★★★★½
                                            ratings (14%)<i style="height: 20.817836836720158px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 144px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip"
                                            data-original-title="111,355&nbsp;★★★★★ ratings (22%)">111,355&nbsp;★★★★★
                                            ratings (22%)<i style="height: 32.00766082553004px;"></i></a> </li>
                                </ul> <span class="rating-green rating-green-tiny rating-5"><span
                                        class="rating rated-10">★★★★★</span></span>
                            </div>
                        </section>

                    </aside>

                   

                </div>

                <div class="clear"></div>
            </div>
 


            <section id="popular-reviews" class="film-reviews section">
					
                <h2 class="section-heading"><a href="/film/${filmVO.film_id}/reviews/by/activity/">Popular reviews</a></h2>
                <a href="/film/${filmVO.film_id}/reviews/by/activity/" class="all-link">More</a>
                <ul class="film-popular-review">
                    
                        <li class="film-detail"> 
                            <a class="avatar -a40" href="/ingridgoeswest/" > <img src="https://a.ltrbxd.com/resized/avatar/upload/3/3/8/3/4/3/shard/avtr-0-80-0-80-crop.jpg?k=4e24a2ba14"  width="40" height="40" /> </a> <div class="film-detail-content"> <div class="attribution-block -large"> <p class="attribution"> <a href="/ingridgoeswest/film/good-time/" class="context" title="Read katie’s review"> Review by <strong class="name">katie</strong> </a> <span class="rating -green rated-10"> ★★★★★ </span> <span class="content-metadata"> <a href="/ingridgoeswest/film/good-time/" class="has-icon icon-comment icon-16 comment-count">17</a> </span> </p> </div> <div class="body-text -prose collapsible-text" data-full-text-url="/s/full-text/viewing:29006694/"> <p>Imagine your worst panic attack.</p><p>Times it by 100.</p> </div> <p class="like-link-target react-component -monotone" data-component-class="globals.comps.LikeLinkComponent" data-likeable-name="review" data-format="svg" > <span class="svg-action -like"></span> </p> </div> </li>

                
                        <li class="film-detail"> 
                            <a class="avatar -a40" href="/ingridgoeswest/" > <img src="https://a.ltrbxd.com/resized/avatar/upload/3/3/8/3/4/3/shard/avtr-0-80-0-80-crop.jpg?k=4e24a2ba14"  width="40" height="40" /> </a> <div class="film-detail-content"> <div class="attribution-block -large"> <p class="attribution"> <a href="/ingridgoeswest/film/good-time/" class="context" title="Read katie’s review"> Review by <strong class="name">katie</strong> </a> <span class="rating -green rated-10"> ★★★★★ </span> <span class="content-metadata"> <a href="/ingridgoeswest/film/good-time/" class="has-icon icon-comment icon-16 comment-count">17</a> </span> </p> </div> <div class="body-text -prose collapsible-text" data-full-text-url="/s/full-text/viewing:29006694/"> <p>Imagine your worst panic attack.</p><p>Times it by 100.</p> </div> <p class="like-link-target react-component -monotone" data-component-class="globals.comps.LikeLinkComponent" data-likeable-name="review" data-format="svg" > <span class="svg-action -like"></span> </p> </div> </li>

                    
                            <li class="film-detail"> 
                                <a class="avatar -a40" href="/ingridgoeswest/" > <img src="https://a.ltrbxd.com/resized/avatar/upload/3/3/8/3/4/3/shard/avtr-0-80-0-80-crop.jpg?k=4e24a2ba14"  width="40" height="40" /> </a> <div class="film-detail-content"> <div class="attribution-block -large"> <p class="attribution"> <a href="/ingridgoeswest/film/good-time/" class="context" title="Read katie’s review"> Review by <strong class="name">katie</strong> </a> <span class="rating -green rated-10"> ★★★★★ </span> <span class="content-metadata"> <a href="/ingridgoeswest/film/good-time/" class="has-icon icon-comment icon-16 comment-count">17</a> </span> </p> </div> <div class="body-text -prose collapsible-text" data-full-text-url="/s/full-text/viewing:29006694/"> <p>Imagine your worst panic attack.</p><p>Times it by 100.</p> </div> <p class="like-link-target react-component -monotone" data-component-class="globals.comps.LikeLinkComponent" data-likeable-name="review" data-format="svg" > <span class="svg-action -like"></span> </p> </div> </li>
                    
                </ul>
            </section>
        </div>

    </div>

<%@include file="../../resources/html/footer.jsp" %>

</body>

</html>
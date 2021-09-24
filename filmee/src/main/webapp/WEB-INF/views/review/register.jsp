<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register.jsp</title>

    <style>

 

    </style>
    
      <link href="../../resources/css/letterboxd.css" rel="stylesheet" media="screen, projection" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>

        $(function () {
            console.clear();
            console.debug('jq started...');
            
            $('#listBtn').click(function () {
                console.log('onclick for #listBtn clicked...');

                // GET, Request URI: /board/listPerPage
                location.href = '/film/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}';
            }); // onclick for #listBtn
        }); // .jq
        
    </script>
</head>
<body>
      
    <div id="colorbox" class="" style="display: block; overflow: hidden; position: absolute; visibility: visible; width: 836px; height: 418px; top: 267px; left: 4px;"><div id="cboxWrapper" style="height: 418px; width: 836px;"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left; width: 800px;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left; height: 382px;"></div><div id="cboxContent" style="float: left; width: 800px; height: 382px;"><div id="cboxLoadedContent" style="overflow: hidden; width: 800px; height: 382px;"><div id="modal" class="modal wide">
	<article id="add-film" class="clearfix expanded">
		<section class="not-expanded">
			<h1 id="add-film-title">Add to your films…</h1>
			<fieldset>
				<div class="row form-row">
					<label>Name of Film</label>
					<input type="text" class="field-large field -reversed -large ac_input" id="frm-film-name" data-url="/s/autocompletefilm" autocomplete="off"><p class="optional-add">Or add <a href="#add-this-film" class="add-this-film modal-link needsclick" data-film-id="433863" data-film-name="The Lighthouse" data-poster-url="/film/the-lighthouse-2019/image-150/" data-film-release-year="2019">The Lighthouse</a></p>
				</div>
			</fieldset>
		</section>
		
		<aside class="col-4 left gutter-right-1 expanded">
			<a id="back-to-film-search" href="#" class="replace back-button" style="display: none;">Back</a>
			<section id="poster-frame" class="poster-list -p150 no-hover">

<div class="react-component poster film-poster film-poster-433863 linked-film-poster" data-component-class="globals.comps.FilmPosterComponent" data-film-id="433863" data-film-name="The Lighthouse" data-poster-url="/film/the-lighthouse-2019/image-150/" data-film-release-year="2019" data-new-list-with-film-action="/list/new/with/the-lighthouse-2019/" data-remove-from-watchlist-action="/film/the-lighthouse-2019/remove-from-watchlist/" data-add-to-watchlist-action="/film/the-lighthouse-2019/add-to-watchlist/" data-rate-action="/film/the-lighthouse-2019/rate/" data-mark-as-watched-action="/film/the-lighthouse-2019/mark-as-watched/" data-mark-as-not-watched-action="/film/the-lighthouse-2019/mark-as-not-watched/" data-film-link="/film/the-lighthouse-2019/"><div><img src="https://a.ltrbxd.com/resized/film-poster/4/3/3/8/6/3/433863-the-lighthouse-0-150-0-225-crop.jpg?k=99443a725d" width="150" height="225" alt="The Lighthouse" srcset="https://a.ltrbxd.com/resized/film-poster/4/3/3/8/6/3/433863-the-lighthouse-0-300-0-450-crop.jpg?k=9c4f0eb0d1 2x" class="image"><a href="/film/the-lighthouse-2019/" class="frame" target="_blank"><span class="frame-title">The Lighthouse (2019)</span><span class="overlay"></span></a></div></div>

</section>
			
		</aside>
		
		<section class="col col-13 overflow expanded">
			<h1 id="diary-entry-form-heading">I watched…</h1>
			<h2 class="headline-2 prettify"><span id="film-title">${filmVO.title}</span> <small class="metadata" id="film-year">2019</small></h2>
			
			<form method="post" action="review/register/${reviewVO.film_id}" id="diary-entry-form" class="fields-reversed"><input type="hidden" name="__csrf" value="a6d05d85249b6cbb8f2e">
				<input type="hidden" name="viewingId" value="" id="frm-viewing-id">
				<input type="hidden" name="filmId" value="433863" id="frm-film-id">
				<fieldset>
					<div class="form-row specified-dates">
						<div class="col col-6 col-gap overflow js-specify-date">
							<div class="needsclick">
								<label for="frm-specify-date" class="needsclick option-label -checkbox -default -reversed">
									<input type="checkbox" name="specifiedDate" id="frm-specify-date" class="needsclick js-specify-date checkbox " value="true"><i class="substitute"></i>
									<span id="frm-specify-date-label">영화를 본 날짜를 남겨보세요</span>
								</label>
								<span id="frm-watched-label" style="display:none"> on <a href="#" id="add-date" class="modal-link">29 Aug 2021</a></span>
							</div>
						</div>
						<div class="col col-6 overflow">
							<label for="frm-rewatch" id="frm-rewatch-label" class="option-label -checkbox -default" style="display: none;">
								<input type="checkbox" name="rewatch" id="frm-rewatch" class="checkbox" value="true"><i class="substitute"></i> 
								I’ve watched this film before
							</label>
						</div>
						<input type="hidden" name="viewingDateStr" id="frm-viewing-date-string" value="2021-08-29">
					</div>
					<div class="form-row">
						<textarea name="review" id="frm-review" class="field" placeholder="Add a review..."></textarea>
					</div>
					<div class="form-row clearfix">
						<div class="col col-7 has-topnote add-tags">
							





<label for="frm-tags">Tags</label>
<p class="note -topnote mob-hide">Press Tab to complete, Enter to create</p>
<div class="autocomplete-tags">
	<div id="tag-container">
		<span class="twitter-typeahead" style="position: relative; display: inline-block;"><input type="text" id="frm-tags" class="tag-input-field field tt-input" name="tags" placeholder="eg. netflix" data-url="/s/autocompletetags" data-limit="4" autocomplete="off" spellcheck="false" dir="auto" aria-owns="frm-tags_listbox" role="combobox" aria-autocomplete="list" aria-expanded="false" style="position: relative; vertical-align: top;"><span role="status" aria-live="polite" style="position: absolute; padding: 0px; border: 0px; height: 1px; width: 1px; margin-bottom: -1px; margin-right: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap;"></span><pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: Graphik-Regular-Web, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre><div role="listbox" class="tags-menu" id="frm-tags_listbox" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;"><div role="presentation" class="tt-dataset tt-dataset-tags"></div></div></span>
	</div>
	<div id="current-tags">
		
	<ul class="tags"></ul></div>
</div>
						</div>
						<div class="col col-1 col-right like-field">
							<label class="option-label -like">
								<input id="film-like-checkbox" type="checkbox" name="liked" value="true" class="like-checkbox"><i class="substitute"></i> 
								좋아요
							</label>
						</div>
						<div class="col col-4 col-right has-topnote rate-film">
							<label>별점</label>
							<p class="note -topnote rating-text"></p>
							<input id="frm-rating" name="rating" type="range" min="0" max="10" step="1" value="0" style="display: none;">
							<div class="rateit" data-rateit-backingfld="#frm-rating" data-rateit-starwidth="13" data-rateit-starheight="26" data-rateit-resetable="true"><button id="rateit-reset-2" class="rateit-reset" aria-label="reset rating" aria-controls="rateit-range-2" style="display: block;"></button><div id="rateit-range-2" class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0" aria-valuemax="10" aria-valuenow="0" style="width: 130px; height: 26px;" aria-readonly="false"><div class="rateit-selected" style="height: 26px; width: 0px;"></div><div class="rateit-hover" style="height:26px"></div></div></div>
						</div>
					</div>
					<div class="form-row clearfix row-last  row-sharing">
						<div id="contains-spoilers" class="col col-6 col-gap overflow" style="opacity: 0.35;">
							<label for="frm-spoilers" class="label-spoilers option-label -checkbox -default">
								<input type="checkbox" name="containsSpoilers" id="frm-spoilers" class="checkbox" value="true" disabled=""><i class="substitute"></i>  
								스포일러를 포함하고 있어요
							</label>
							<p id="frm-spoilers-locked-label" class="note" style="display:none">A moderator has locked this field.</p>
						</div>

						<div class="col right">
							<input id="diary-entry-submit-button" type="submit" class="button -action button-action" value="Save">
							<a href="#" id="diary-entry-delete-button" class="button button-delete -destructive ajax-click-action" data-confirm="Are you sure you want to delete this&nbsp;entry?">Delete</a>
						</div>
					</div>
				</fieldset>
			</form>
		</section>
	</article>
</div></div><div id="cboxTitle" style="float: left; display: block;"></div><div id="cboxCurrent" style="float: left; display: none;"></div><div id="cboxNext" style="float: left; display: none;"></div><div id="cboxPrevious" style="float: left; display: none;"></div><div id="cboxSlideshow" style="float: left; display: none;"></div><div id="cboxClose" style="float: left;">close</div></div><div id="cboxMiddleRight" style="float: left; height: 382px;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left; width: 800px;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div>
  

    

<%--     <hr>

    <div id="wrapper">

        <form action="/film/register" method="POST">
            <!-- 어느 화면에서든, 게시판 목록 페이지로 이동시, 반드시 아래 3개의 기준 전송파라미터를
            전송시키기 위해, hidden 값으로 설정 -->
            <input type="hidden" name="currPage" value="${cri.currPage}">
            <input type="hidden" name="amount" value="${cri.amount}">
            <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
        
            <table>
                <tr>
                    <td><label for="title">제목</label></td>
                    <td><input type="text" name="title" id="title" size="50" placeholder="제목을 입력하세요"></td>
                </tr>
                <tr>
                    <td><label for="content">내용</label></td>
                    <td><textarea name="content" id="content" rows="10" cols="53" placeholder="내용을 입력하세요"></textarea></td>
                </tr>
                <tr>
                    <td><label for="writer">작성자</label></td>
                    <td><input type="text" name="writer" id="writer" size="20" placeholder="작성자"></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" id="submitBtn">Register</button>
                        <button type="button" id="listBtn">List</button>
                    </td>
                </tr>
            </table>
        </form>
    </div> --%>
</body>
</html>
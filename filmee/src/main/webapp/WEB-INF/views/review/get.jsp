<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> 

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html id="html" lang="ko" class="no-mobile no-js">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=1024" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!--     <script>
      var isMobile = false,
        isMobileOptimised = true,
        renderMobile = false,
        useStaticFonts = false,
        disableFrameProtection = false;
    </script>
 -->
    <title>
      &lrm;${reviewVO.title} review by ${reviewVO.nickname} &bull; FILMEE
    </title>

	<%@include file="../../../resources/html/header.jsp" %>   
	
  
    <!-- CSS -->
    <link href="../../resources/css/letterboxd.css" rel="stylesheet" media="screen, projection" />
   

    <script>
      if (screen.width < 768) {
        var date = new Date();
        var maxAge = 365 * 24 * 60 * 60;
        date.setTime(date.getTime() + maxAge * 1000);
        var expires = "; expires=" + date.toUTCString();
        document.cookie =
          "useMobileSite=yes" + expires + "; path=/; maxAge=" + maxAge;
        if (
          document.cookie &&
          document.cookie.indexOf("useMobileSite=yes") >= 0
        ) {
          window.location.reload(true);
        } else {
          // No cookies.  No Mobile version.
        }
      }

      var isWindows = navigator.platform.toUpperCase().indexOf("WIN") >= 0; // Detect windows platform
      if (isWindows) {
        document.documentElement.classList.add("is-windows");
      }
    </script>

    <script src="https://s.ltrbxd.com/static/js/main.min.ed93f370.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <!-- <script src="../../../resources/js/film.js"></script>
    <script src="../../../resources/js/film2.js"></script> -->

   <!--  <script>
      if ($.cookie("filmee.admin.signed.in") === person.username) {
        successMessages.push("You are signed in as " + person.username);
        $(function () {
          $("#header, #content, body").css("background", "#543");
        });
      }
    </script> -->
  </head>

  <body class="view">

    <header class="site-header js-hide-in-app" id="header">
      <div class="site-header-bg"></div>
      <section>
        <div
          class="react-component"
          data-component-class="globals.comps.NavComponent"
        ></div>

	<!-- <div style="display: none">  이거 손봐야됨 -->
       <div> 
          <div id="fb-root"></div>
          <div id="add-this-film"></div>
          <div id="modal" class="modal">
            <article id="add-film" class="not-expanded clearfix" style="display: none">
              <section class="not-expanded">
                <h1 id="add-film-title">Add to your films…</h1>
                <fieldset>
                  <div class="row form-row">
                    <label>${reviewVO.title}</label>
                    <input type="text" class="field-large field -reversed -large" id="frm-film-name" data-url="/s/autocompletefilm"
                    />
                  </div>
                </fieldset>
              </section>

              <aside class="col-4 left gutter-right-1 expanded">
                
                <section id="poster-frame" class="poster-list -p150 no-hover">
                  <div class="poster no-poster">
                    <span class="frame"></span>
                  </div>
                </section>
              </aside>

              <section class="col col-13 overflow expanded">
                <h1 id="diary-entry-form-heading"></h1>
                <h2 class="headline-2 prettify">
                  <span id="film-title"></span>
                  <small class="metadata" id="film-year"></small>
                </h2>

                <form
                  method="post"
                  action="/s/save-diary-entry"
                  id="diary-entry-form"
                  class="fields-reversed"
                >
                  <input
                    type="hidden"
                    name="__csrf"
                    value="a6d05d85249b6cbb8f2e"
                  />
                  <input
                    type="hidden"
                    name="viewingId"
                    value=""
                    id="frm-viewing-id"
                  />
                  <input
                    type="hidden"
                    name="filmId"
                    value=""
                    id="frm-film-id"
                  />
                  <fieldset>
                    <div class="form-row specified-dates">
                      <div class="col col-6 col-gap overflow js-specify-date">
                        <div class="needsclick">
                          <label
                            for="frm-specify-date"
                            class="
                              needsclick
                              option-label
                              -checkbox
                              -default
                              -reversed
                            "
                          >
                            <input
                              type="checkbox"
                              name="specifiedDate"
                              id="frm-specify-date"
                              class="needsclick js-specify-date checkbox"
                              value="true"
                            /><i class="substitute"></i>
                            <span id="frm-specify-date-label"
                              >영화를 본 날짜를 남겨보세요</span
                            >
                          </label>
                          <span id="frm-watched-label" style="display: none">
                            on <a href="#" id="add-date" class="modal-link"></a
                          ></span>
                        </div>
                      </div>
                      <div class="col col-6 overflow">
                        <label
                          for="frm-rewatch"
                          id="frm-rewatch-label"
                          class="option-label -checkbox -default"
                        >
                          <input
                            type="checkbox"
                            name="rewatch"
                            id="frm-rewatch"
                            class="checkbox"
                            value="true"
                          /><i class="substitute"></i>
                         예전에 관람한 영화입니다
                        </label>
                      </div>
                      <input
                        type="hidden"
                        name="viewingDateStr"
                        id="frm-viewing-date-string"
                        value=""
                      />
                    </div>
                    <div class="form-row">
                      <textarea
                        name="review"
                        id="frm-review"
                        class="field"
                        placeholder="Add a review..."
                      ></textarea>
                    </div>
                    <div class="form-row clearfix">
                      <div class="col col-7 has-topnote add-tags"></div>
                      <div class="col col-1 col-right like-field">
                        <label class="option-label -like">
                          <input
                            id="film-like-checkbox"
                            type="checkbox"
                            name="liked"
                            value="true"
                            class="ajax-working like-checkbox"
                          /><i class="substitute"></i>
                          좋아요
                        </label>
                      </div>
                      <div class="col col-4 col-right has-topnote rate-film">
                        <label>별점</label>
                        <p class="note -topnote rating-text"></p>
                        <input
                          id="frm-rating"
                          name="rating"
                          type="range"
                          min="0"
                          max="10"
                          step="1"
                          value="0"
                        />
                        <div
                          class="rateit"
                          data-rateit-backingfld="#frm-rating"
                          data-rateit-starwidth="13"
                          data-rateit-starheight="26"
                          data-rateit-resetable="true"
                        ></div>
                      </div>
                    </div>
                    <div class="form-row clearfix row-last row-sharing">
                      <div
                        id="contains-spoilers"
                        class="col col-6 col-gap overflow"
                      >
                        <label
                          for="frm-spoilers"
                          class="label-spoilers option-label -checkbox -default"
                        >
                          <input
                            type="checkbox"
                            name="containsSpoilers"
                            id="frm-spoilers"
                            class="checkbox"
                            value="true"
                          /><i class="substitute"></i>
                          스포일러를 포함하고 있어요 
                        </label>
                        <p
                          id="frm-spoilers-locked-label"
                          class="note"
                          style="display: none"
                        >
                          A moderator has locked this field.
                        </p>
                      </div>

                      <div class="col right">
                        <input
                          id="diary-entry-submit-button"
                          type="submit"
                          class="button -action button-action"
                          value="Save"
                        />
                        <a
                          href="#"
                          id="diary-entry-delete-button"
                          class="
                            button button-delete
                            -destructive
                            ajax-click-action
                          "
                          data-confirm="Are you sure you want to delete this&nbsp;entry?"
                          >삭제</a
                        >
                      </div>
                    </div>
                  </fieldset>
                </form>
              </section>
            </article>
          </div>
        </div>
      </section>
    </header>

   
    <div id="content" class="site-body">
      <div class="content-wrap">
        <div class="cols-2">
          <section class="section col-17 col-main overflow">
            <div class="col-4 gutter-right-1">
              <section class="poster-list -p150 el col">
                <div
                  class="
                    really-lazy-load
                    poster
                    film-poster film-poster-506032
                    linked-film-poster
                  "
                  data-image-width="150"
                  data-image-height="225"
                >
                  <img
                    src="https://www.themoviedb.org/t/p/original${reviewVO.poster_path}"
                    width="150"
                    height="225"
                    alt="Tenet"
                    class="image"
                    itemprop="image"
                  />
                  <span class="frame"><span class="frame-title"></span></span>
                </div>
              </section>

             

              <div
                class="js-csi"
                data-src="/csi/film/tenet/availability/?esiAllowUser=true&amp;esiAllowCountry=true"
                data-on-load="csi-availability"
              ></div>
            </div>

            <section class="col-12 review">
              <section class="film-viewing-info-wrapper">
                <header class="page-header overflow person-header">
                  <div class="person-summary -inline">
                    <a class="avatar -a24" href="/${reviewVO.writer}/">
                      <img
                        src="https://secure.gravatar.com/avatar/ca5aabe664b120591b1d12557f735a9d?rating=PG&amp;size=48&amp;border=&amp;default=https%3A%2F%2Fs.ltrbxd.com%2Fstatic%2Fimg%2Favatar48.7a758b1e.png"
                        alt="${reviewVO.writer}"
                        width="24"
                        height="24"
                      />
                    </a>
                    <h1
                      class="title-4"
                      itemprop="author"
                      itemscope
                      itemtype="http://schema.org/Person"
                    >
                      <small class="context">Review by</small>
                      <a href="/${reviewVO.writer}/" itemprop="sameAs" class="name">
                        <span itemprop="name">${reviewVO.writer}</span>
                      </a>
                    </h1>
                  </div>

                  <div class="clear"></div>
                </header>

                <h2 class="headline-2 prettify">
                  <span class="film-title-wrapper">
                    <a href="/film/${filmVO.film_id}/">${filmVO.title}</a>
                    <small class="metadata"> <fmt:formatDate value="${reviewVO.release_date}" pattern="yyyy" /></small>
                  </span>
                  <span class="rating rating-large rated-large-10">
                    ★★★★★
                  </span>
                </h2>

                <p class="view-date date-links">


               
                </p>
        
              </section>

              <div class="review body-text -prose -hero -loose">
                <div>
                  <h3 class="hidden">
                    ${reviewVO.nickname}’s review published on FILMEE:
                  </h3>

                  <div>
                    <p>${reviewVO.content}</p>
                  </div>
                </div>
              </div>

              <p
                class="like-link-target react-component review-like -monotone"
                data-component-class="globals.comps.LikeLinkComponent"
                data-likeable-uid="viewing:130509321"
                data-likeable-name="review"
                data-likeable="true"
                data-likes-page="/${reviewVO.writer}/film/tenet/2/likes/"
                data-format="svg"
                data-owner="${reviewVO.writer}"
              >
                <span class="svg-action -like"></span>
              </p>
              <div
                class="
                  block-flag-wrapper
                  show-on-hover
                  hide-when-logged-out hide-for-owner
                "
                data-owner="${reviewVO.writer}"
              >
                <a
                  href="#"
                  class="
                    block-or-report-flag
                    popmenu-link
                    has-icon
                    icon-16 icon-report
                    tooltip
                  "
                  title="Block or Report"
                  data-popmenu-id="report-member-${reviewVO.writer}-review-130509321"
                  data-popmenu-direction="e"
                  >Block or Report</a
                >
                <div
                  id="report-member-${reviewVO.writer}-review-130509321"
                  class="block-or-report-menu popmenu popup-menu"
                  data-username="${reviewVO.writer}"
                >
                  <ul>
                    <li class="popup-menu-text popmenu-close">
                      <span
                        class="report-link has-icon icon-report"
                        data-report-url="/ajax/viewing:130509321/report-form"
                        >Report this review</span
                      >
                    </li>
                  </ul>
                </div>
              </div>
            </section>

            <div
              class="js-csi"
              data-src="/csi/viewing/130509321/comments-section/?esiAllowUser=true"
              data-on-load=""
            ></div>

            <div class="clear"></div>
          </section>
          <aside class="sidebar">
            <section id="userpanel" class="actions-panel">
              <ul class="js-actions-panel">
                <li
                  class="js-csi"
                  data-src="/csi/viewing/130509321/sidebar-user-actions/?esiAllowUser=true"
                  data-on-load=""
                ></li>
              </ul>
            </section>

       
          </aside>
        </div>
      </div>
    </div>
  </body>
</html>

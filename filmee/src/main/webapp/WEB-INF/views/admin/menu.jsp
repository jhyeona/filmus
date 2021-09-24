<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title></title>
        <style>
            #container {
                height: 100%;
                float: left;
            }

            #adminonly {
                text-align: center;
                font-size: 40px;
            }

            #allMenu {
                font: bold 20px;
                display: inline-block;
                width: 150px;
                height: 450px;
                text-align: center;
                line-height: 40px;
            }

            .dropdown-button {
                background: #ffffff;
                color: rgb(38, 51, 95);
                border: none;
                position: relative;
                height: 60px;
                font-size: 17px;
                padding: 0 2em;
                cursor: pointer;
                transition: 800ms ease all;
                outline: none;
            }

            .dropdown-button:hover {
                background: #fff;
                color: #d9deff;
            }

            .dropdown-button:before,
            .dropdown-button:after {
                content: '';
                position: absolute;
                top: 0;
                right: 0;
                height: 2px;
                width: 0;
                background: #d9deff;
                transition: 400ms ease all;
            }

            .dropdown-button:after {
                right: inherit;
                top: inherit;
                left: 0;
                bottom: 0;
            }

            .dropdown-button:hover:before,
            .dropdown-button:hover:after {
                width: 100%;
                transition: 800ms ease all;
            }

            .dropdown {
                width: 150px;
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                width: 150px;
                display: none;
                position: absolute;
                padding: 5px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            }

            .dropdown-content a {
                width: 150px;
                font-size: 14px;
                display: block;
            }

            .dropdown-content a:hover {
                background-color: #cfcfcf73;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropdown-button {
                background-color: #ffffff;
            }
        </style>
    </head>

    <body>
        <div id="container">
            <div id="allMenu">
                <div class="dropdown">
                    <button class="dropdown-button" style="cursor:default">관리자메뉴</button>
                    <div class="dropdown-content">
                        <a href="/admin/main">전체</a>
                        <a href="/admin/user">회원관리</a>
                        <a href="/admin/review">리뷰관리</a>
                        <a href="/admin/report/list">신고관리</a>
                        <a href="/admin/request">요청관리</a>
                        <a href="/admin/film">영화관리</a>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>
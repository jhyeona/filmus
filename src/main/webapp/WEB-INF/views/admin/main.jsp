<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/html/header.jsp" %>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device=width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/css/calender.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <style>
        body,input,textarea,select,button,table{font-family:'ELAND 초이스';}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em; line-height:1.5em; text-align:justify;}
        /* a-style */
        a{color:#333;text-decoration:none;}
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}

        body{
            width: 998px;
            margin: 0 auto;
            font-family: 'ELAND 초이스';
        }
    </style>
</head>
<body>
    <div>
        <table class="table table-hover">
            <thead>
                <tr>
                <th scope="col" id="adminonly"> 관리자 전용 </th>
                </tr>
            </thead>

            </table>
    </div>
    <div id=mainCalender>
        <div class="my-calendar clearfix">
            <div class="clicked-date">
                <div class="cal-day"></div>
                <div class="cal-date"></div>
            </div>
            <div class="calendar-box">
                <div class="ctr-box clearfix">
                    <button type="button" title="prev" class="btn-cal prev">
                    </button>
                    <span class="cal-month"></span> <span class="cal-year"></span>
                    <button type="button" title="next" class="btn-cal next">
                    </button>
                </div>
                <table class="cal-table">
                    <thead>
                        <tr>
                            <th>일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th>토</th>
                        </tr>
                    </thead>
                    <tbody class="cal-body"></tbody>
                </table>
            </div>
        </div>
        <!-- // .my-calendar -->
    </div>

    <div>
        <%@include file="../admin/menu.jsp"%>
        <div id="allMain">

        </div>
        
    
        <div align="center">
            <div class="avatar avatar-xl">
                <img class="calendar" src="/resources/img/calender-2389150_1280.png" alt="CAL">
            </div>
            <input type="text" class="testDatePicker" id="testDatepicker" placeholder="조회 날짜를 선택하세요.">
            <a class="input-button" title="toggle" data-toggle>
                <i class="icon-calendar"></i></a>
        </div>

        <div id="content" class="adm_home">
            <div class="date_info">
                <div class="date_selector">
                    <a role="button" class="stat_btn prev_stat_btn" id="prevBtn">
                        <span class="sr_only">이전 날짜</span>
                    </a>
                    <span id="date" class="stat_date" style="user-select: none;"></span>
                    <a role="button" class="stat_btn next_stat_btn end" id="nextBtn">
                        <span class="sr_only">다음 날짜</span>
                    </a>
                </div>
                <span class="stat_collect_dt"></span>
            </div>

            <!-- 일 기준 -->
            <div class="box_stat" id="statBox">

                <div class="stat">
                    <span class="stat_title">신규가입자<br><br></span>
                    <br>
                    <span class="value_increase" id="inquire_span">0 명</span>
                </div>

                <div class="stat">
                    <span class="stat_title">신규 리뷰<br><br></span>
                    <br>
                    <span class="value_increase" id="report_span"> 0 개</span>
                </div>

                <div class="stat">
                    <span class="stat_title">신고<br><br></span>
                    <br>
                    <span class="value_increase" id="newMember_span"> 0 건</span>
                </div>

                <div class="stat">
                    <span class="stat_title">요청사항<br><br></span>
                    <br>
                    <span class="value_increase" id="saleBoard_span"> 0 건</span>
                </div>
            </div>
        </div>

    </div>

    
    <script type="text/javascript">
        $(function() {

            $( "#testDatepicker" ).datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                    ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                    ,changeYear: true //콤보박스에서 년 선택 가능
                    ,changeMonth: true //콤보박스에서 월 선택 가능                
                    //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
                    //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                    //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                    ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                    ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                    ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
                    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                    ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                    ,maxDate: "0M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)         
            });
        });
    </script>

    <!--달력생성-->
    <script type="text/javascript">
        const init = {
        monList: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayList: ['일', '월', '화', '수', '목', '금', '토'],
        today: new Date(),
        monForChange: new Date().getMonth(),
        activeDate: new Date(),
        getFirstDay: (yy, mm) => new Date(yy, mm, 1),
        getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
        nextMonth: function () {
        let d = new Date();
        d.setDate(1);
        d.setMonth(++this.monForChange);
        this.activeDate = d;
        return d;
        },
        prevMonth: function () {
        let d = new Date();
        d.setDate(1);
        d.setMonth(--this.monForChange);
        this.activeDate = d;
        return d;
        },
        addZero: (num) => (num < 10) ? '0' + num : num,
        activeDTag: null,
        getIndex: function (node) {
        let index = 0;
        while (node = node.previousElementSibling) {
        index++;
        }
        return index;
        }
        };
        
        const $calBody = document.querySelector('.cal-body');
        const $btnNext = document.querySelector('.btn-cal.next');
        const $btnPrev = document.querySelector('.btn-cal.prev');
        function loadDate (date, dayIn) {
        document.querySelector('.cal-date').textContent = date;
        document.querySelector('.cal-day').textContent = init.dayList[dayIn];
        }
        
        function loadYYMM (fullDate) {
        let yy = fullDate.getFullYear();
        let mm = fullDate.getMonth();
        let firstDay = init.getFirstDay(yy, mm);
        let lastDay = init.getLastDay(yy, mm);
        let markToday;  // for marking today date
        if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
        markToday = init.today.getDate();
        }
        document.querySelector('.cal-month').textContent = init.monList[mm];
        document.querySelector('.cal-year').textContent = yy;
        let trtd = '';
        let startCount;
        let countDay = 0;
        for (let i = 0; i < 6; i++) {
        trtd += '<tr>';
        for (let j = 0; j < 7; j++) {
        if (i === 0 && !startCount && j === firstDay.getDay()) {
            startCount = 1;
        }
        if (!startCount) {
            trtd += '<td>'
        } else {
            let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
            trtd += '<td class="day';
            trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
            trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
        }
        trtd += (startCount) ? ++countDay : '';
        if (countDay === lastDay.getDate()) { 
            startCount = 0; 
        }
        trtd += '</td>';
        }
        trtd += '</tr>';
        }
        $calBody.innerHTML = trtd;
        }
        function createNewList (val) {
        let id = new Date().getTime() + '';
        let yy = init.activeDate.getFullYear();
        let mm = init.activeDate.getMonth() + 1;
        let dd = init.activeDate.getDate();
        const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);
        
        let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);
        
        let eventData = {};
        eventData['date'] = date;
        eventData['memo'] = val;
        eventData['complete'] = false;
        eventData['id'] = id;
        init.event.push(eventData);
        $todoList.appendChild(createLi(id, val, date));
        }
        
        loadYYMM(init.today);
        loadDate(init.today.getDate(), init.today.getDay());
        
        $btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
        $btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));
        
        $calBody.addEventListener('click', (e) => {
        if (e.target.classList.contains('day')) {
        if (init.activeDTag) {
        init.activeDTag.classList.remove('day-active');
        }
        let day = Number(e.target.textContent);
        loadDate(day, e.target.cellIndex);
        e.target.classList.add('day-active');
        init.activeDTag = e.target;
        init.activeDate.setDate(day);
        reloadTodo();
        }
        });
    </script>
        
    <script type="text/javascript">
        $(function(){
            var now = new Date();	// 현재 날짜 및 시간
            var year = now.getFullYear();	// 연도
            var month = now.getMonth()+1;
            var date = now.getDate();
            
            if(month<10){
                month='0'+month;
            }
            if(date<10){
                date='0'+date;
            }
            
            $('.cal-day').html(month+"월");
            $('.cal-date').html(date);
            $('.stat_collect_dt').html(year+"."+month+"."+date+" 기준");
            $('.stat_date').html(year+"."+month+"."+date+" 기준");
            
            $.ajax({
                url:'/jaju/manager/getManagerMainCount',
                type:'post',
                dataType:'json',
                success:function(data){
                    console.log("mainChart에 대한 모든정보" + JSON.stringify(data));
                    //만약 모든 정보 가져오는 걸 성공했다면 html로 하나씩 넣어주기. 
                    
                    $('#inquire_span').html(data.inquire_db+'건');
                    $('#report_span').html(data.report_db+'건');
                    $('#newMember_span').html(data.newMember_db+'건');
                    $('#saleBoard_span').html(data.saleReport_db+'건');
        
                },error:function(err){
                    console.log("mainChartJSP에 오류 발생" + err);
                }
            });//ajax
        });
        function getFormatDate(date){
            var year = date.getFullYear();              //yyyy
            var month = (1 + date.getMonth());          //M
            month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
            var day = date.getDate();                   //d
            day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
            return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
        }
        $('.cal-body').click(function (){
            var calyear = $('.cal-year').text();
            var calmonth = $('.cal-month').text();
            var dayactive = $('.day-active').text();
            var calmonthMinus = calmonth.substring(0,1); 
            //alert("cal-year/cal-month/day-active : "+calyear+calmonthMinus+dayactive);
            
            if(calmonthMinus<10){
                calmonthMinus='0'+calmonthMinus;
            }
            if(dayactive<10){
                dayactive='0'+dayactive;
            }
            
            var date = new Date(calyear,calmonthMinus-1,dayactive);
            date= getFormatDate(date);
            //alert(date);
            
            if(confirm(date+" 일자로 조회하시겠습니까?")){
            
            $.ajax({
                url:'/jaju/manager/getCalenderInfo',
                data: {'date': date },
                type:'post',
                dataType:'json',
                success:function(data){
                    //alert("getCalenderInfo 결과물  : " +JSON.stringify(data));
                    //console.log("datepicker 결과물  : " +JSON.stringify(data));
                    $.each(data.list, function(index, items){
                        //console.log(JSON.stringify(data.list[0]));
                        
                        $('.cal-table td.today').css('background', '#fff');
                        $('.cal-table td.today').css('color', '#000000');
        
                        $('.stat_collect_dt').html(date+" 기준");
                        $('.stat_date').html(date+" 기준");
                        
                        $('#inquire_span').html(data.list[0]+'건');
                        $('#report_span').html(data.list[1]+'건');
                        $('#newMember_span').html(data.list[2]+'건');
                        $('#saleBoard_span').html(data.list[3]+'건');
                        
                    });//each
        
                    
                },error:function(err){
                    console.log("managerCalender 에러발생" + err)	
                }
            });
            }
            else{
                alert("다시 선택해주세요.")
            }
        });
        
        
        //$( "#testDatepicker" ).datepicker( "getDate" );
        $('#testDatepicker').change(function (){
            var date = $('#testDatepicker').val();
            //alert("date???" + date);
            
            var arr = date.split('-'); 
            //alert("arr"+arr);
        
            var now = new Date();	// 현재 날짜 및 시간
            var year = arr[0];	// 연도
            var month = arr[1];
            var dateArr = arr[2];
        
            $('.cal-day').html(month+"월");
            $('.cal-date').html(dateArr);
            $('.stat_collect_dt').html(year+"."+month+"."+dateArr+" 기준");
            $('.stat_date').html(year+"."+month+"."+dateArr+" 기준");
            
            $('.cal-table td.today').css("background","#fff");
            $('.cal-table td.today').css("color","#333");
        
            $.ajax({
                url:'/jaju/manager/getDatePickerInfo',
                data: {'date': date },
                type:'post',
                dataType:'json',
                success:function(data){
                    $('#ui-datepicker-div').hide();
                    
                    //console.log("datepicker 결과물  : " +JSON.stringify(data));
                    $('.stat_collect_dt').html(date+" 기준");
                    $('.stat_date').html(date+" 기준");
                        
                    $('#inquire_span').html(data.inquirePickerCount+'건');
                    $('#report_span').html(data.reportPickerCount+'건');
                    $('#newMember_span').html(data.newMemberPickerCount+'건');
                    $('#saleBoard_span').html(data.saleReportPickerCount+'건');
                    
                
                    /* $.each(arr, function(index, value) { 
                        console.log(index + ':값 = ' + value); 
                    }); */
        
                    
                },error:function(err){
                    console.log("managerCalender 에러발생" + err)	
                }
                
            });
            var arr = date.split('-'); 
            //alert("arr"+arr);
        });
    </script>
    

</body>
</html>
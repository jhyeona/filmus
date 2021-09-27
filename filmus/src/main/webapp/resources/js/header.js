//================ 이메일 양식 유효성 검사 ================
function isEmail(email) {
	// console.log("isEamil invoked.");

	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	return reg.test(email);
}//isEmail


//============== alert modal 메세지 처리 =================
function alertModalMessaging(msg){
	$("#alert_modal p").text(msg);
	$("#alert_modal").modal("show");
}//alertModalMessaging


//======================= 회원가입 =======================

// input에 입력시 유효성을 체크할 변수
var isEmailChecked=false;
var isPwValid=false;
var isNickChecked=false;

var isEmailExist=false;	//forgotPw.jsp에서 사용할 변수

//모든 input 태그의 유효성 검사가 성공적이면 Change버튼 활성화
function isSignUpBtnValid(){
	// console.log("isSignUpBtnValid invoked.");

	if(isEmailChecked && isPwValid && isNickChecked){
		$(".sign_up_btn").prop("disabled", false);
	}else{
		$(".sign_up_btn").prop("disabled", true);
	}//if-else
};//isChangeButtonValid

function checkEmail(email){
	console.log("checkEmail invoked.");
	
	console.log("checkEmail :", email);

	if(email.length == 0){
		isEmailChecked = false;
		$("#email_message").text("");

	} else if( !isEmail(email) ){
		isEmailChecked = false;
		$("#email_message").text("옳바른 이메일 형식이 아닙니다.");

	} else{
		$.ajax({
			async:false,
			data : {
				email : email
			},
			type:'get',
			url : "/main/checkEmail",
			dataType:'json',
			success : function(data){
				// console.log("data :", data);
				if (data == '0') {
					isEmailChecked = true;                
					$("#email_message").text("✅☑✔👌🙆🏻‍♂🙆🏻‍♀🙆‍♀");

				} else if (data == '1') {
					isEmailChecked = false;  
					isEmailExist = true;              
					$("#email_message").text("이미 가입된 이메일주소입니다.");
				}//if-elseIf

				// console.log("isEmailExist header.js:",isEmailExist);
				isSignUpBtnValid();

			}//success
		});//ajax

	}//if-elseIf-else

}//checkEmail

function checkPw(){
	// console.log("checkPw invoked.");
	
	var pw = $('#join_password').val();
	var pwLeng = pw.length;

	if(pwLeng==0){
		isPwValid = false;
		$("#pw_message").text("");
		
	}else if(pwLeng < 6){
		isPwValid = false;
		$("#pw_message").text("비밀번호는 6자리 이상이어야 합니다.");

	}else{     
		isPwValid = true;
		$("#pw_message").text("✅☑✔👌🙆🏻‍♂🙆🏻‍♀🙆‍♀");

	}//if-elseif-else
	isSignUpBtnValid();

}//checkPw

function checkNickname(nickname){
	console.log("checkNickname invoked.");
	
	console.log("checkNickname:", nickname);

	if(nickname.length == 0){
		isNickChecked = false;	
		$(".nickname").text("");
	} else if(nickname.length < 2){
		isNickChecked = false;
		$(".nickname").text("닉네임은 두글자 이상이어야 합니다.");
	} else{
		$.ajax({
			data : {
				nickname : nickname
			},
			type:'get',
			url : "/main/checkNickname",
			dataType:'json',
			success : function(data){
				// console.log("data :", data);
				if (data == '0') {
					isNickChecked = true;
					$(".nickname").text("✅☑✔👌🙆🏻‍♂🙆🏻‍♀🙆‍♀");  

				} else if (data == '1') {
					isNickChecked = false;
					$(".nickname").text("이미 등록된 닉네임입니다.");

				}//if-elseif-elseif-elseif
				isSignUpBtnValid();

			}//success
		});//ajax

	}//if-elseIf-else
	
}//checkNickname

//====================== 쿠키 ======================
function getCookie(key){
	let cookieKey = key + "=";
	let result = "";
	const cookieArr = document.cookie.split(";");   //cookie를 가져와서 ;를 단위로 나눠 배열로 저장

	for(let i =0; i<cookieArr.length; i++){ //각 쿠키의 길이만큼 순회
		if(cookieArr[i][0] === " "){        //쿠키의 첫문자가 공백이라면
			cookieArr[i] = cookieArr[i].substring(1);   //공백을 제외한 값을 다시 저장
		}//if

		if(cookieArr[i].indexOf(cookieKey) === 0){  //쿠키를 순회하며 내가 지정한 쿠키의 이름으로 시작하는 쿠키 검색
			result = cookieArr[i].slice(cookieKey.length, cookieArr[i].length); //쿠키의 값만 result 변수에 저장
			console.log("Cookie : ", cookieKey+result);

			return result; //내가 찾고자 했던 쿠키의 값을 반환
		}//if
	}//for

}//getCookie

function deleteCookie(name){
	document.cookie = name + "=;expires= Thu, 02 Sep 2021 00:00:10 GMT;domain=localhost;path=/;"
}//deleteCookie


//============== Google Recaptcha ==============
function onSubmit(token) {
	console.log("token:", token);
	document.getElementById("demo-form").submit();
}//onSubmit


//=================== Jquery ====================
$(function() {
	console.log("header.js jq started");

	//login modal에서 join, forgot password 버튼 누를 시 login modal을 먼저 닫음
		$("#close_login_open_join, #forgot_pw_a").on('click', function(){
		$("#login").modal("hide");  
	});//close_login_open_join

	//modal 새로 열 때 input 초기화
	$(".input_modal").on('hidden.bs.modal',function(){
		$(this).find('form')[0].reset();
	});//modal hidden.bs.modal            

	$("#social_join, #join").on('hidden.bs.modal',function(){
		$(".input_message").text("");

		isEmailChecked=false;
		isPwValid=false;
		isNickChecked=false;
		isEmailExist=false;

		// console.log("isEmailChecked : ", isEmailChecked);
		// console.log("isPwValid : ", isPwValid);
		// console.log("isNickChecked : ", isNickChecked);
		// console.log("isEmailExist : ", isEmailExist);
	});//social join & join hidden.bs.modal            



	//login modal에서 sign in 버튼 누를 시
	$(".login_submit_btn").on('click', function(){
		console.log("SIGN in btn clicked.");

		//alert modal을 닫으면 login modal을 다시 띄움
		let alertModalEl = document.getElementById('alert_modal');
		alertModalEl.addEventListener('hidden.bs.modal',function(){
			$("#login").modal("show");
		});

		let loginEmail = $("#login_email").val();

		if(loginEmail.length == 0){
			$("#login").modal("hide");
			alertModalMessaging("이메일을 입력하세요.");

		}else if(!isEmail(loginEmail)){                  
			$("#login").modal("hide");
			alertModalMessaging("옳바른 이메일 형식이 아닙니다.");

		} else if( $("#login_password").val().length == 0 && 
						loginEmail.substr(0, 10) != "SOC.KAKAO_"){
			$("#login").modal("hide");

			alertModalMessaging("비밀번호를 입력하세요.");

		} else {
			var formData = $("#login_form").serialize();
			console.log("formData :", formData);

			$.ajax({
				async : true,
				data : formData,
				type : 'post',
				url : "/main/loginPost",
				dataType : 'json',
				success : function(data){
					console.log("data :", data);
					console.log("cookieValue:",data.cookieValue);
					console.log("data.loginNum:",data.loginNum);
					console.log("data.isRememberMe:", data.isRememberMe);
					
					let uriCookie = getCookie("__ORIGINAL_REQUEST_URI__");
					console.log("uriCookie :", uriCookie);
					
					switch(data.loginNum){
						case '1' :
							console.log("loginNum : 1");
							$("#login").modal("hide");

							alertModalMessaging("등록되지 않은 이메일 혹은 비밀번호입니다.");

							break;
							
						case '2':
							console.log("loginNum : 2");
							$("#login").modal("hide");

							alertModalMessaging("이메일 인증 후 로그인 가능합니다.");
										
							if(uriCookie != null){   
								alertModalEl.addEventListener('hidden.bs.modal',function(){
									deleteCookie("__ORIGINAL_REQUEST_URI__");
									history.go(-1);
								});//modal close listener
							}//if

							break;

							case '3' :
								console.log("loginNum : 3");
								$("#login").modal("hide");

								alertModalMessaging(data.susTo+"까지 정지된 계정입니다.");

								if(uriCookie != null){   
									alertModalEl.addEventListener('hidden.bs.modal',function(){
										deleteCookie("__ORIGINAL_REQUEST_URI__");
										history.go(-1);
									});//modal close listener
								}//if
	
								break;

							case '4':
								console.log("longinNum : 4");
								
							if(data.isRememberMe == 'true'){    //RemeberMe 체크하고 로그인 했을 시
								//RemberMe 쿠키의 이름과 값, 유효기간 설정
								let rememberMeCookie = 
								"__REMEMBER_ME__=" + data.cookieValue + ";expires=" + data.rememberAge + ";path=/";
								
								//만든 설정대로 쿠키 생성
								document.cookie = rememberMeCookie;
							}//if
							
							if(uriCookie != null){
								location.href=uriCookie;
							} else{
								location.reload();
							}//if-else
							
							break;
						}//switch-case
						
				} //success
				
			});//ajax

		}//if-elseIf-elseIf-else

	});//onclick .login_submit_btn

	
	//login modal에서 카카오 로그인 누를 시
	Kakao.Auth.createLoginButton({
		container: "#kakao_login",
		size : "medium",
		success: function(object){
			console.log(object);

			Kakao.API.request({
				url:'/v2/user/me',
				data : {
					property_keys: ["kakao_account.email"]
				},
				success: function(userData){
					$("#login").modal("hide");
					
					var kakao_email = "SOC.KAKAO_" + userData.kakao_account.email;
					
					console.log("isEmailExist before:", isEmailExist);
					checkEmail(kakao_email);    
					console.log("isEmailExist after:", isEmailExist);

					if(isEmailExist){
						//로그인
						$("#login_email").val(kakao_email);
						$(".login_submit_btn").trigger("click");
					} else{
						//회원가입
						isEmailChecked = true;
						isPwValid = true;
						
						console.log("isEmailChecked-login : ", isEmailChecked);
						console.log("isPwValid-login : ", isPwValid);
						
						$("#social_join_email").val(kakao_email);
						$("#social_join").modal("show");
					}
				}//success
				
			});//Kakao.API.request
		},
		fail: function(error){
			alert('error');
			console.log(error);
		}
	});//Kakao.Auth.createLoginButton

	//logout 누를시
	$("#logout_a").on('click', function(){
		if (!Kakao.Auth.getAccessToken()) {
			console.log('Not logged in.');
		}
		Kakao.Auth.logout(function() {
			console.log(Kakao.Auth.getAccessToken());
		});

		location.href="/main/logout";
	});//logout on click

});//jq
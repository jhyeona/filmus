//이메일 양식 유효성 검사
function isEmail(email) {
	// console.log("isEamil invoked.");

	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	return reg.test(email);
};//isEmail
	
//====== 회원가입 ======

// input에 입력시 유효성을 체크할 변수
var isEmailChecked=false;
var isPwValid=false;
var isNickChecked=false;

var isEmailExist=false;	//forgotPw.jsp에서 사용할 변수

//모든 input 태그의 유효성 검사가 성공적이면 Change버튼 활성화
function isSignUpBtnValid(){
	// console.log("isSignUpBtnValid invoked.");

	if(isEmailChecked && isPwValid && isNickChecked){
		// console.log("good to go");
		$(".sign_up_btn").prop("disabled", false);
	}else{
		// console.log("failed");
		$(".sign_up_btn").prop("disabled", true);
	}//if-else
};//isChangeButtonValid

function checkEmail(email){
	console.log("checkEmail invoked.");
	
	// var email = $('#join_email').val();
	console.log("checkEmail :", email);

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
			if(email.length == 0){
				isEmailChecked = false;
				$("#email_message").text("");
			} else if( !isEmail(email) ){
				isEmailChecked = false;
				$("#email_message").text("옳바른 이메일 형식이 아닙니다.");                
			} else if (data == '0') {
				isEmailChecked = true;                
				$("#email_message").text("✅☑✔");
			} else if (data == '1') {
				isEmailChecked = false;                
				$("#email_message").text("이미 가입된 이메일주소입니다.");
				isEmailExist = true;
			}//if-elseif-elseif-elseif
			console.log("isEmailExist header.js:",isEmailExist);
			isSignUpBtnValid();
		}//success
	});//ajax
};//checkEmail

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
		$("#pw_message").text("✅☑✔");
	}//if-elseif-else
	isSignUpBtnValid();
};//checkPw

function checkNickname(){
	// console.log("checkNickname invoked.");
	
	var nickname = $('#nickname').val();
	$.ajax({
		data : {
			nickname : nickname
		},
		type:'get',
		url : "/main/checkNickname",
		dataType:'json',
		success : function(data){
			// console.log("data :", data);

			if(nickname.length == 0){
				isNickChecked = false;
				$("#nick_message").text("");
			} else if(nickname.length < 2){
				isNickChecked = false;
				$("#nick_message").text("닉네임은 두글자 이상이어야 합니다.");
			} else if (data == '0') {
				isNickChecked = true;
				$("#nick_message").text("✅☑✔");     
			} else if (data == '1') {
				isNickChecked = false;
				$("#nick_message").text("이미 등록된 닉네임입니다.");
			}//if-elseif-elseif-elseif
			isSignUpBtnValid();
		}//success
	});//ajax
};//checkNickname

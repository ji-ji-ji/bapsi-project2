<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.8.1, mobirise.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png"
	type="image/x-icon">
<meta name="description" content="Web Generator Description">
<title>bapsi</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/socicon/css/styles.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/theme/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/mobirise/css/mbr-additional.css"
	type="text/css">

<script
	src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>
<script>
	var checkEmail = 0;
	var checkNickname = 0;
		var checkPinNum = 0;
		var sendPinNum = 0;


	$(document).ready(function() {
		$('#checkEmail').click(function() {

			
			
			var email = $('#email').val();
	
			$.ajax({
				async : true,
				type : 'POST',
				url : '${pageContext.request.contextPath}/check/email',
				dataType : 'json',
				data : email,
				contentType : 'application/json; charset=UTF-8',
				success : function(data) {
					if (data.cnt == 1) {
						alert('존재하는 아이디 입니다. 다른 아이디를 입력해주세요');
						$('#email').focus();
						checkEmail = 0;
					} else {
						alert('사용 가능합니다!');
						$('#email').focus();
						checkEmail = 1;
					}

				}
			});
		});

		$('#checkNickname').click(function() {

			var nickname = $('#nickname').val();

			$.ajax({
				async : true,
				type : 'POST',
				url : '${pageContext.request.contextPath}/check/nickname',
				dataType : 'json',
				data : nickname,
				contentType : 'application/json; charset=UTF-8',
				success : function(data) {
					if (data.cnt == 1) {
						alert('존재하는 닉네임 입니다. 다른 닉네임을 입력해주세요');
						$('#nickname').focus();
						checkNickname = 0;
					} else {
						alert('사용 가능합니다!');
						$('#nickname').focus();
						checkNickname = 1;
					}
				}
			});

		});

	});

	function doWrite() {
		if(sendPinNum == 0){
			alert('인증번호를 이메일로 전송해주세요!');
			$('#email').focus();
			return false;
		}
		
		if(checkPinNum == 0){
			alert('이메일 인증을 완료해주세요!');
			$('#pinNum').focuns();
			return false;
		}
		
		if (checkEmail == 0) {
			alert('이메일 중복체크를 확인해주세요!');
			$('#email').focus();
			return false;
		}

		if ($('#password').val() == "") {
			alert('비밀번호를 입력해주세요');
			$('#password').focus();
			return false;
		}

/* 		if($('#hintq').val() == ""){
			alert('비밀번호 힌트 질문과 대답을 입력해주세요.\n비밀번호 찾기에 꼭 필요합니다.');
			$('#hintq').focus();
			return false;
		}
		
		if($('#hinta').val() == ""){
			alert('비밀번호 힌트 질문과 대답을 입력해주세요.\n비밀번호 찾기에 꼭 필요합니다.');
			$('#hinta').focus();
			return false;
		} */
		
		if ($('#name').val() == "") {
			alert('이름을 입력해주세요');
			$('#name').focus();
			return false;
		}

		if ($('#age').val() == "나이대를 선택해주세요") {
			alert('나이를 입력해주세요');
			$('#age').focus();
			return false;
		}

		if (checkNickname == 0) {
			alert('닉네임 중복체크를 확인해주세요!');
			$('nickname').focus();
			return false;
		}
		
		if($('#gender').val() == "성별을 선택해주세요"){
	           alert('성별을 선택해주세요');
	           $('#gender').focus();
	           return false;
	        }


		if ($('#tel').val() == "") {
			alert('전화번호를 입력해주세요');
			$('#tel').focus();
			return false;
		}
		return true;
	}
	
	var emailTime=0;

	$(function(){
		var emailConfirmInterval;
		$('#emailConfirmation').click(function(){
/* 			emailTime = 60*5;
			setInterval(() => {
				var min = Math.floor(emailTime/60);
				var sec = emailTime%60;
				console.log(min+":"+sec);
				$('#emailConfirmTime').html(min+":"+sec);
				emailTime--;
			}, 1000);
			return false;  */
			
//ajax 로 이메일 주소 전송한다.
			var email = $('#email').val();
			
			$.ajax({
				async : true,
				type : 'post',
				url : '${pageContext.request.contextPath}/sendEmailCheck',
				dataType : 'json',
				data : email,
				contentType : 'application/json; charset=UTF-8',
				success:function(){
					timeout=60*5;
					emailTime = 60*5;
					emailConfirmInterval = setInterval(function(){
						var min = Math.floor(emailTime/60);
						var sec = emailTime%60;
						console.log(min+":"+sec);
						$('#emailConfirmTime').html(min+":"+sec);
						emailTime--;
					}, 1000); 
					alert('이메일 인증 번호를 발송하였습니다.\n5분 이내에 입력해주세요');
					sendPinNum ++;
				},
				error:function(){
					alert("이메일 발송에 문제가 있습니다. 다시 시도해 주세요");
				}
			});
			return false; 
			
		});

		$('#emailConfirmationOK').click(function(){
			var pinNum = $('#pinNum').val();
			$.ajax({
				async : true,
				type:'post',
				url:'${pageContext.request.contextPath}/sendEmailCheckOK', 
				dataType:'text',
			    data:pinNum,
				contentType : 'application/json; charset=UTF-8',
				success:function(data){
					//var $pinNum = $(data).find("pinNum");
					if(data == 'true'){
						alert('이메일 인증이 완료되었습니다!');
						clearInterval(emailConfirmInterval);
						$('#emailConfirmTime').html('인증완료');
						checkPinNum ++;
					}else{
						alert('인증 에러가 발생했습니다.');
					}
				}
			})
			return false;
		})
		
	
	});

	
</script>




</head>
<body>

	<header><jsp:include
			page="/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

	<section class="mbr-section form1 cid-r4PR64ZLCL" id="form1-t">




		<div class="container">
			<div class="row justify-content-center">
				<div class="title col-12 col-lg-8">
					<h2
						class="mbr-section-title align-center pb-3 mbr-fonts-style display-2">회원가입</h2>

				</div>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="media-container-column col-lg-8"
					data-form-type="formoid">
					<form class="mbr-form"
						action="${pageContext.request.contextPath}/join/process"
						method="post" data-form-title="Mobirise Form"
						onsubmit="return doWrite()">
						<div class="row row-sm-offset">
							<div class="col-md-7 multi-horizontal" data-for="name">
								<!-- 스타일 수정 임지영1 시작 -->
								<div class="form-group">
									<label class="form-control-label mbr-fonts-style display-7"
										for="name-form1-t">이메일</label> <input type="email"
										class="form-control" name="email" data-form-field="Name"
										placeholder="이메일을 입력해주세요" id="email" required
										pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$">
									<!-- 스타일 수정 임지영1 시작 -->
									<input type="button"
										class="btn btn-secondary btn-form display-4"
										style="width: 20%; padding-left: 10px; padding-right: 10px; font-size: 130%; border-radius: 30px;font-size: 105%;"
										id="checkEmail" value="중복체크"> <input type="button"
										class="btn btn-secondary btn-form display-4"
										style="width: 20%; padding-left: 10px; padding-right: 10px; font-size: 130%; border-radius: 30px;font-size: 100%;"
										id="emailConfirmation" value="인증번호 전송">

									<div id="emailConfirmTime"></div>

									<div class="form-group">
										<input type="text" class="form-control" name="pinNum"
											data-form-field="Name" placeholder="인증번호를 입력해주세요" id="pinNum"
											required> <input type="button"
											class="btn btn-secondary btn-form display-4"
											style="width: 20%; padding-left: 10px; padding-right: 10px; font-size: 130%; border-radius: 30px;"
											id="emailConfirmationOK" value="인증완료">
									</div>

								</div>


							</div>

							<!-- 스타일 수정 임지영1 끝 -->
							<div class="col-md-7 multi-horizontal" data-for="email">
								<div class="form-group">
									<label class="form-control-label mbr-fonts-style display-7"
										for="email-form1-t">비밀번호</label> <input type="password"
										class="form-control" name="password" data-form-field="Email"
										placeholder="비밀번호를 입력해주세요" id="password">
								</div>
							</div>

<!-- 							<div class="col-md-6 multi-horizontal" data-for="phone">
								<div class="form-group">
									<label class="form-control-label mbr-fonts-style display-7"
										for="phone-form1-t">비밀번호 찾기 힌트</label> <select
										class="form-control" name="hintq" id="hintq">
										<option selected>질문을 선택해 주세요.</option>
										<option></option>
										<option>기억에 남는 추억의 장소는?</option>
										<option>자신의 인생 좌우명은?</option>
										<option>추억하고 싶은 날짜가 있다면?</option>
										<option>인상 깊게 읽은 책 이름은?</option>
										<option>다시 태어나면 되고 싶은 것은?</option>
										<option>자신이 두 번째로 존경하는 인물은?</option>
										<option>유년시절 가장 생각나는 친구 이름은?</option>
										<option>읽은 책 중에 좋아하는 구절이 있다면?</option>
										<option>받았던 선물 중 기억에 남는 독특한 선물은?</option>
									</select>
								</div>
								<input type="text" class="form-control" name="hinta"
									data-form-field="Phone" placeholder="답변을 입력해 주세요" id="hinta">
							</div> -->
							<br> <br>
							<div class="col-md-7 multi-horizontal" data-for="phone">
								<div class="form-group">
									<label class="form-control-label mbr-fonts-style display-7"
										for="phone-form1-t">이름</label> <input type="text"
										class="form-control" name="name" data-form-field="Phone"
										placeholder="이름을 입력해주세요" id="name">
								</div>
							</div>
							<div class="col-md-6 multi-horizontal" data-for="phone">
								<div class="form-group">
									<label class="form-control-label mbr-fonts-style display-7"
										for="phone-form1-t">나이</label>
									<!-- <input type="text" class="form-control" name="age" data-form-field="Phone" placeholder="나이를 입력해주세요" id="age"> -->
									<select class="form-control" name="age" id="age">
										<option selected>나이대를 선택해주세요</option>
										<option>10대</option>
										<option>20대</option>
										<option>30대</option>
										<option>40대</option>
										<option>50대</option>
										<option>60대</option>
										<option>70대</option>
										<option>80대</option>
									</select>
								</div>
							</div>

							<div class="col-md-7 multi-horizontal" data-for="phone">
								<div class="form-group">
									<label class="form-control-label mbr-fonts-style display-7"
										for="phone-form1-t">닉네임</label> <input type="text"
										class="form-control" name="nickname" data-form-field="Phone"
										placeholder="닉네임을 입력해주세요" id="nickname">
									<!-- 스타일 수정 임지영1 -->
									<input type="button"
										class="btn btn-secondary btn-form display-4"
										style="width: 20%; padding-left: 10px; padding-right: 10px; font-size: 130%; border-radius: 30px;"
										id="checkNickname" value="중복체크">
								</div>
							</div>

							<div class="col-md-7 multi-horizontal" data-for="phone">
								<div class="form-group">
									<label class="form-control-label mbr-fonts-style display-7"
										for="phone-form1-t">전화번호</label> <input type="tel"
										class="form-control" name="tel" data-form-field="Phone"
										placeholder="전화번호를 입력해주세요( ex)000-0000-0000 )" id="tel"
										pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
								</div>
							</div>
							
							<div class="col-md-6 multi-horizontal" data-for="phone">
                                <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="phone-form1-t">성별</label>
                                    <select class="form-control" name="gender" id="gender">
                                       <option selected>성별을 선택해주세요</option>
                                       <option>남자</option>
                                       <option>여자</option>
                                    </select>
                                </div>
                            </div>
							

							<div class="col-md-7 multi-horizontal" data-for="phone">
								<div class="form-group">
									<label class="form-control-label mbr-fonts-style display-7"
										for="phone-form1-t">한줄소개</label> <input type="text"
										class="form-control" name="comments" data-form-field="Phone"
										placeholder="한 줄로 자신을 소개해주세요" id="comments">
								</div>
							</div>

						</div>

						<!--  글씨수정 임지영 -->
						<span class="input-group-btn"><button type="submit"
								class="btn btn-form btn-primary-outline display-4">회원가입
								완료</button></span>
					</form>
				</div>
			</div>
		</div>
	</section>

	<footer><jsp:include
			page="/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html>
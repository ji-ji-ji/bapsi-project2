  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
<!--네이버  -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.8.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png" type="image/x-icon">
  <meta name="description" content="Website Builder Description">
  <title>bapsi</title>
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/theme/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  <script src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/parallax/jarallax.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/formoid/formoid.min.js"></script>

<!-- 임지영구글로그인 -->
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
  <meta name="google-signin-client_id" content="1010391818469-985t9r244c2oqur0mroqu2m5mdt9el9q.apps.googleusercontent.com">
<!--  임지영 카카오 로그인 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <meta name="google-signin-client_id" content="1010391818469-ir3v0jfbb7aamt0u5j36pppmobug85me.apps.googleusercontent.com">
<script type="text/javascript">
function checkLoginStatus(){
    var loginBtn = document.querySelector('#loginBtn');
    if(gauth.isSignedIn.get()){
      console.log('logined');
      loginBtn.value = 'Logout';
    } else {
      console.log('logouted');
      loginBtn.value = 'Login';
    }
  }
function init(){
   
	console.log('init');
    gapi.load('auth2', function() {
      console.log('auth2');
      var gauth = gapi.auth2.init({
        client_id:'1010391818469-ir3v0jfbb7aamt0u5j36pppmobug85me.apps.googleusercontent.com'
      })
      gauth.then(function(){
        console.log('googleAuth success');
        console.log("google_url");
      }, function(){
        console.log('googleAuth fail');
        console.log('google_url');
      });
    });
  }
  
  function onSignIn(googleUser){
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  var gname = profile.getName();
	  var gemail = profile.getEmail();
	  location.href="${pageContext.request.contextPath}/googleSuccess?gname="+gname+"&gemail="+gemail;
  };
</script>


  <script>
  
   	$(document).ready(function(){
  		$('#join').click(function(){
  			location.href="${pageContext.request.contextPath}/join"
  		});
		$('#login').click(function() {
  			
  			var email = $("#email").val();
  			var password = $("#password").val();
  			
  			if(email == "") {
  				alert("아이디를 입력하세요");
  				$("#email").focus();
  				return;
  			}
  			if(password == "") {
  				alert("비밀번호를 입력해주세요");
  				$("#password").focus(); 
  				return;	
  			}
  			

  			document.formGO.action = "${pageContext.request.contextPath}/loginCheck"

  			document.formGO.submit();"src/main/webapp/WEB-INF/views"
  			
  		});
  	});

  </script>
</head>
<body>

<header><jsp:include page = "/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

<section class="cid-r4PNSpOKeo mbr-fullscreen mbr-parallax-background" id="header15-n">

    

    <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(7, 59, 76);"></div>

    <div class="container align-right">
<div class="row">
    <div class="mbr-white col-lg-8 col-md-7 content-container">
        
        <p class="mbr-text pb-3 mbr-fonts-style display-5">여러분이 바로 "셰프" 입니다.<br>바로 여기서 당신의 잠재된 요리실력을 보여주세요.<br>혼밥부터 소중한 사람들과의 한끼 식사까지<br>Bapsi가 함께하겠습니다.<br><br><br>Just Make it! Eat it!<br><br></p>
    </div>
    <div class="col-lg-4 col-md-5">
    <div class="form-container">
        <div class="media-container-column" data-form-type="formoid">
            <form class="mbr-form" name = "formGO" action="${pageContext.request.contextPath}/loginCheck" method="post" data-form-title="Mobirise Form">
                <div data-for="name">
                    <div class="form-group">
                        <input type="text" class="form-control px-3" name="email" data-form-field="Name" placeholder="아이디(이메일)" id="email">
                    </div>
                </div>
                
                <div data-for="phone">
                    <div class="form-group">
                        <input type="password" class="form-control px-3" name="password" data-form-field="Phone" placeholder="비밀번호" id="password">
                    </div>
                </div>
                <a href="javascript:void(window.open('${pageContext.request.contextPath}/goToFindPassword', '_blank','width=800, height=800'))" style="color: white;">비밀번호를 잊어버리셨나요?</a>
                <c:if test = "${msg == 'Fail' }">
                	<div style="color:red">
                		<h5>아이디 또는 비밀번호를 다시 확인해주세요.</h5>
                	</div>
                </c:if>

                <span class="input-group-btn">
                	<button type="submit" class="btn btn-secondary btn-form display-4" id = "login"style="width:100%;">로그인</button>
                </span>
                
                <span class="input-group-btn">
                	<input type = "button" class="btn btn-secondary btn-form display-4" style="width:100%; padding-left:31px; padding-right:31px; border-radius: 100px;" id="join" value = "회원가입">
                </span>
                 <br>
		           <!-- 네이버 로그인 화면으로 이동 시키는 URL -->
		            <!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
					 
					<a  href="${url}">
					<button type="button" class="btn btn-light" style="width: 100%; background-color: #38CD25; border-color: #38CD25;color: white; border-radius: 100px; cursor:pointer;">네이버 로그인</button>
					</a>
					
					
		            <a href="${google_url}">
		            <button type="button" class="btn btn-light" style="width: 100%; background-color:#5086EC; color:white; border-radius: 100px;border-width:0; cursor:pointer;" >구글 로그인</button>
		           	</a>
		           	
		           	<a href="http://kauth.kakao.com/oauth/authorize?client_id={827dca2030d65cd46b4328d1351829c9}&redirect_uri={http://localhost:8000/bapsi/kakaoCallback}&response_type=code">
		            <button type="button" id="kakao-login-btn" class="btn btn-light" style="width: 100%; background-color: #F7E405; border-width:0; border-radius: 100px; color: #54210F; cursor:pointer;" >카카오 로그인</button>
		           	</a>
		           	<!-- data-onsuccess="onSignIn" -->
<%-- 		            <div id="naver_id_login" style="text-align:center"><a href="${url}"> --%>
<!-- 		            <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div> -->
<!-- 		         <br> -->
		        <%--  <div class="g-signin2" data-onsuccess="onSignIn" style="text-align:center" >
		         <a href="${google_url}"><img width="223" ></a>
		         
		         </div> --%>
                
            </form>
        </div>
    </div>
    </div>
</div>
    </div>
    
</section>

<footer><jsp:include page = "/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html> 
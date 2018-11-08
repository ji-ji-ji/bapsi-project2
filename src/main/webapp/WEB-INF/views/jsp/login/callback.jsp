<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>           
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
  src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
  charset="utf-8"></script>
<script type="text/javascript"
  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
  margin: 0;
  padding: 0;
}

h3 {
  display: inline-block;
  padding: 0.6em;
}
</style>
 <script type="text/javascript">
  $(document).ready(function() {
    var name = ${result}.response.name;
    var email = ${result}.response.email;
    var nickname= ${result}.response.nickname;
    
    $("#name").html("환영합니다. "+name+"님");
    $("#email").html(email);
    $("#nickname").html(nickname);
    
    });,
    //location.href = "${pageContext.request.contextPath}/";
</script> 

<!--새로 추가한 코드 안된다!!  -->
<script>
window.addEventListener('load', function () {
   naverLogin.getLoginStatus(function (status) {
      if (status) {
         /* 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
         var email = naverLogin.user.getEmail();
/* 		var name = naverLogin.user.getNickName();
		var profileImage = naverLogin.user.getProfileImage();
		var birthday = naverLogin.user.getBirthday();			
		var uniqId = naverLogin.user.getId();
		var age = naverLogin.user.getAge(); */
         if( email == undefined || email == null) {
            alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
            /* 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
            naverLogin.reprompt();
            return;
         }

         window.location.replace("http://localhost:8000/bapsi");
      } else {
         console.log("callback 처리에 실패하였습니다.");
      }
   });
});
</script>

</head>
<body>
  <div
    style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
    <h3>Naver_Login Success</h3>
  </div>
  <br>
  <h2 style="text-align: center" id="name"></h2>
  <h4 style="text-align: center" id="email"></h4>
  <h4 style="text-align: center" id="nickname"></h4>
  
  <script>
    $(function () {
      $("body").hide();
      $("body").fadeIn(1000);  // 1초 뒤에 사라 지자 
     
      setTimeout(function(){$("body").fadeOut(1000);},1000);
      setTimeout(function(){location.href= "${pageContext.request.contextPath}"},2000);
// 2초 뒤에 메인 화면 으로 가자  
    
    })
  </script>

</body>
</html>
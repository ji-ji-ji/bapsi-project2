<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>KakaoLoginTest</title>
</head>
<body>
 ${refresh}



    <script>
       alert('카카오로그인이 성공되었습니다.')
      location.href = "${pageContext.request.contextPath}/"

   </script>
</body>

</html>
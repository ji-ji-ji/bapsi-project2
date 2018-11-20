<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta name="description" content="Web Site Builder Description">
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

<style type="text/css">
#out {
 width: 100%;
 text-align: center;
 }
#in {
 display: inline-block;
 }
</style>

</head>
<body>

	<header><jsp:include
			page="/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

	<section class="mbr-section form4 cid-r5i8KQIDUV" id="form4-21">
		<div id="out">
			<div id="in">
				<form method="post" action="${pageContext.request.contextPath}/changePasswordProcess">
					<div class="form-group">
						<label for="exampleInputEmail1">새 비밀번호</label> <input
							type="password" class="form-control" id="password" name="password"
							placeholder="새 비밀번호를 입력하세요"> 
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">새 비밀번호 확인</label> <input
							type="password" class="form-control" id="confirmPassword" name="confirmPassword"
							placeholder="한번 더 입력하세요">
					</div>
					
					<button type="submit" class="btn btn-primary">비밀번호 변경</button>
				</form>
			</div>
		</div>

	</section>

	<footer><jsp:include
			page="/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html>
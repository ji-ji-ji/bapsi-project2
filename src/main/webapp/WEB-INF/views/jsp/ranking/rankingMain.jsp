<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.8.1, mobirise.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png" type="image/x-icon">
<meta name="description" content="Site Builder Description">
<title>Page 12</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/socicon/css/styles.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/theme/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/gallery/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/mobirise/css/mbr-additional.css"
	type="text/css">


<style type="text/css">
.ellip{
	overflow:hidden;
	text-overflow: ellipsis;	
}
</style>
</head>
<body>
	<header><jsp:include
         page="/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

	<section class="engine">
		<a href="https://mobiri.se/u">bootstrap html templates</a>
	</section>

	<section class="mbr-gallery mbr-slider-carousel cid-r9hdrgT0a1"
		id="gallery2-39">
		<div class="container">
			<div>
				<!-- Filter -->
				<div class="mbr-gallery-filter container gallery-filter-active">
					<ul buttons="0">
						<li class="mbr-gallery-filter-all">
						<a class="btn btn-md btn-warning active display-1" href="">목록</a></li>
					</ul>
				</div>
				<!-- Gallery -->
				<div class="mbr-gallery-row">
					<div class="mbr-gallery-layout-default">
						<div>
							<div>
							 <c:forEach begin="0" end="99" items="${recipeList}" var="recipe" varStatus="loop">
								<div class="mbr-gallery-item mbr-gallery-item--p2 "
									data-video-url="false" data-tags="좋아요게시글 top100">
									<div href="#lb-gallery2-39" data-slide-to="0"
										data-toggle="modal">
										
										<img src="${pageContext.request.contextPath}/resources/css/assets/images/gallery00.jpg" 
										alt="22" title="11">
										
										<a href="${pageContext.request.contextPath}/recipe/readPage?no=${recipe.no}&userNo=${userVO.no}&click=1">
										<c:if test="${recipe.title.length()>7}">
											<span class="icon-focus">[${recipe.title.substring(0,7)}...]<br><br> ${recipe.userNickName}님 
											<br>${recipe.point}점</span>
										</c:if>
										<c:if test="${recipe.title.length()<=7}">
											<span class="icon-focus">[${recipe.title}]<br><br> ${recipe.userNickName}님 
											<br>${recipe.point}점</span>
										</c:if>
										</a>
									</div>
								</div>
							 </c:forEach>

								<c:forEach begin="0" end="99" items="${memberList}" var="member"
									varStatus="loop">
									<div class="mbr-gallery-item mbr-gallery-item--p2"
										data-video-url="false" data-tags="팔로워사용자 top100">
										<div href="#lb-gallery2-39" data-slide-to="1"
											data-toggle="modal">
												<c:choose>
									               <c:when test="${empty member.file_fakename}">
									                  <img
									                     src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
									                     width="400px" height="200px" alt="이미지를 불러올수 없습니다.">
									               </c:when>
									               <c:otherwise>
									                  <img src="${pageContext.request.contextPath}/img/${member.file_fakename}"
									                   width="400px" height="200px" 
									                     style="width: 200px;border: 3px solid black;"
									                     alt="이미지를 불러올수 없습니다.">
									               </c:otherwise>
									            </c:choose>
											<a href="${pageContext.request.contextPath}/ranking/userPage?no=${member.no}&userNo=${userVO.no}">
											<span class="icon-focus">[${member.nickname}] <br> [${member.followrCnt} 명]</span>
											</a>
										</div>
									</div>
								</c:forEach>

								<c:forEach begin="0" end="99" items="${memberListR}" var="memberR">
								<div class="mbr-gallery-item mbr-gallery-item--p2"
									data-video-url="false" data-tags="댓글왕">
									<div href="#lb-gallery2-39" data-slide-to="2"
										data-toggle="modal">
										<img src="${pageContext.request.contextPath}/resources/css/assets/images/gallery02.jpg" alt="" title=""><span
											class="icon-focus">[${memberR.nickname}]</span>
									</div>
								</div>
								</c:forEach>
								
								
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			
			</div>
		</div>

	</section>

   <footer><jsp:include
         page="/WEB-INF/views/jsp/include/footer.jsp" /></footer>


	<script src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/bootstrapcarouselswipe/bootstrap-carousel-swipe.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/vimeoplayer/jquery.mb.vimeo_player.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/masonry/masonry.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/slidervideo/script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/gallery/player.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/gallery/script.js"></script>


</body>
</html>
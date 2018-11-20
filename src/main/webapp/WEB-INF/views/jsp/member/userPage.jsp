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
<meta name="description" content="Site Creator Description">
<title>userPage</title>
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
   .field20 > ul { 
      background-attachment: scroll;
      height:270px;
      overflow-x:hidden;
      overflow-y:visible;
      list-style:none;
      float:left;
   }
</style>
</head>
<body>

	<div class="modal fade" id="ModalsFollower">
		<div class="modal-dialog" id="extra">
			<div class="modal-content">
				<div class="modal-header" id="head">
					<h2 style="color: #c12048;">팔로워</h2>
				</div>
				<div class="modal-body">
					<section class="recomand">
						<div class="inner">
							<fieldset class="field20" style="align-content: center;">
								<div class="followers" id="followers" style="background-color: white;">
									<div style="width: 700px; height: 100px;">
										<img style="border: 2px solid gold; border-radius: 50px; width:100px;height: 100px;"
											src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png">
											&nbsp; &nbsp; &nbsp; &nbsp;
											 <span style="min-width:40%;border: 2px solid black;"> <strong>닉네임88888</strong></span>
										<span>
											<button id="follow3"
												class="btn btn-primary-outline display-4"
												style="width: 25%; heignt: 20; font-size: 13px;"> 보러가기
											</button>
										</span>
									</div>
								</div>
							</fieldset>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="ModalsFollowing">
		<div class="modal-dialog" id="extra">
			<div class="modal-content">
				<div class="modal-header" id="head">
					<h2 style="color: #c12048;">팔로잉</h2>
				</div>
				<div class="modal-body">
					<section class="recomand">
						<div class="inner">
							<fieldset class="field20" style="align-content: center;">
								<div class="followers" id="followers" style="background-color: white;">
									<div style="width: 700px; height: 100px;">
										<img style="border: 2px solid gold; border-radius: 50px; width:100px;height: 100px;"
											src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png">
											&nbsp; &nbsp; &nbsp; &nbsp;
											 <span style="min-width:40%;border: 2px solid black;"> <strong>닉네임88888</strong></span>
										<span>
											<button id="follow3"
												class="btn btn-primary-outline display-4"
												style="width: 25%; heignt: 20; font-size: 13px;"> 보러가기
											</button>
										</span>
									</div>
								</div>
							</fieldset>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>

	<header><jsp:include
         page="/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

	<section class="counters2 counters cid-r9g3DUFTsI" id="counters2-33">
		<div class="container pt-4 mt-2">
			<div class="media-container-row">
				<div class="media-block" style="width: 50%;">
					<span
						class="mbr-section-title pb-3 align-left mbr-fonts-style display-2">
						${member.nickname} </span> &nbsp;&nbsp;&nbsp;&nbsp;
					<button id="follow"
						class="<c:out value="${followCheck == 0? 'btn btn-primary-outline display-4':'btn btn-primary-outline display-4 active'}"/>"
						style="width: 150px; heignt: 20; font-size: 13px;">
						<c:out value="${followCheck == 0? '팔로우':'팔로우취소'}" />
					</button>
					
					<h3
						class="mbr-section-subtitle pb-5 align-left mbr-fonts-style display-5">
						${member.comments}</h3>
					<div class="mbr-figure">
			            <c:choose>
			               <c:when test="${empty writerPhoto}">
			                  <img
			                     src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
			                     width="300px" height="400px" alt="이미지를 불러올수 없습니다.">
			               </c:when>
			               <c:otherwise>
			                  <img src="${pageContext.request.contextPath}/img/${writerPhoto}"
			                     style="width: 450px;border: 3px solid black;"
			                     alt="이미지를 불러올수 없습니다.">
			               </c:otherwise>
			            </c:choose>
					</div>
				</div>
				<div class="cards-block">
					<div class="cards-container">
						<div class="card px-3 align-left col-12 col-md-6">
							<div class="panel-item p-3">
								<a data-toggle="modal" data-target="#ModalsFollower">
								<div class="card-img pb-3">
									<span class="mbr-iconfont pr-2 mbri-user"></span>
									<h3>${member.followrCnt}</h3> <!-- 팔로워수 -->
								</div>
								<div class="card-text">
									<h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">
										팔로워</h4>
									<p class="mbr-content-text mbr-fonts-style display-7">
										설명</p>
								</div>
								</a>
							</div>
						</div>
						<div class="card px-3 align-left col-12 col-md-6">
							<div class="panel-item p-3">
							<a data-toggle="modal" data-target="#ModalsFollowing">
								<div class="card-img pb-3">
									<span class="mbr-iconfont pr-2 mbri-user"></span>
									<h3>${followingCnt}</h3>
								</div>
								<div class="card-text">
									<h4
										class="mbr-content-title mbr-bold mbr-fonts-style display-7">
										팔로잉</h4>
									<p class="mbr-content-text mbr-fonts-style display-7">
										설명</p>
								</div>
							</a>
							</div>
						</div>
						<div class="card px-3 align-left col-12 col-md-6">
							<div class="panel-item p-3">
								<div class="card-img pb-3">
									<span class="mbr-iconfont pr-2 mbri-hearth"></span>
									<h3>${pointCnt}</h3>
								</div>
								<div class="card-text">
									<h4
										class="mbr-content-title mbr-bold mbr-fonts-style display-7">
										받은 좋아요</h4>
									<p class="mbr-content-text mbr-fonts-style display-7">
										설명 </p>
								</div>
							</div>
						</div>
						<div class="card px-3 align-left col-12 col-md-6">
							<div class="panel-item p-3">
								<div class="card-img pb-3">
									<span class="mbr-iconfont pr-2 mbri-edit"></span>
									<h3>${recipeCnt}</h3>
								</div>
								<div class="card-texts">
									<h4
										class="mbr-content-title mbr-bold mbr-fonts-style display-7">
										작성 레시피</h4>
									<p class="mbr-content-text mbr-fonts-style display-7">
										설명</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--★★★★★★★★★★★★★★★★★★★★★★★★ 팔로우 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★-->
<script type="text/javascript">
   $(document).ready(function() {
      
      $('#follow').click(function() {
         var userNo  = ${userVO.no};
         var receipeUserNo = ${member.no};
         var followData = $('#follow').attr('class');
         var followText = $('#follow').text();
          
         var data = {}
          data["userNo"] = ${userVO.no};
          data["receipeUserNo"] = ${member.no};
          
         if(followData == 'btn btn-primary-outline display-4'){
            if(confirm("해당 회원을 팔로우 하시겠습니까?")){
               if(userNo == receipeUserNo){
                  alert('자신은 팔로우 할 수 없습니다.');
               } else {
                $.ajax({
                  type : 'post',
                  url : '/bapsi/point/follow',
                    dataType : 'json',
                  data : JSON.stringify(data),
                    contentType : 'application/json; charset=UTF-8',
                  success : function(data) {
                     alert(data.msg);
                     if(data.followCheck==0) {
                        $('#follow').prop("class","btn btn-primary-outline display-4");
                        $('#follow').text('팔로우');
                          }
                     else if(data.followCheck==1){
                        $('#follow').prop("class","btn btn-primary-outline display-4 active");
                        $('#follow').text('팔로우취소');
                          } else{alert(data.msg)};
                  }, error: function(data){
                     alert("문제가 발생했습니다. 다시 시도해주세요");
                  }
                  });
            } 
            }
         };
         if(followData == 'btn btn-primary-outline display-4 active'){
            if(confirm("팔로우을 취소 하시겠습니까?")){
               if(userNo == receipeUserNo){
                  alert('자신은 팔로우를 취소 할 수 없습니다.');
               } else {
                $.ajax({
                  type : 'post',
                  url : '/bapsi/point/follow2',
                    dataType : 'json',
                  data : JSON.stringify(data),
                    contentType : 'application/json; charset=UTF-8',
                  success : function(data) {
                     alert(data.msg);
                     if(data.followCheck==0) {
                        $('#follow').prop("class","btn btn-primary-outline display-4");
                        $('#follow').text('팔로우');
                          }
                     else if(data.followCheck==1){
                        $('#follow').prop("class","btn btn-primary-outline display-4 active");
                        $('#follow').text('팔로우취소');
                          }else{alert(data.msg)};
                  }, error: function(data){
                     alert("문제가 발생했습니다. 다시 시도해주세요");
                  }
                  });
            } 
            }
                         
         }
      });
      
   });
</script>
		</section>

	<section class="mbr-gallery mbr-slider-carousel cid-r9nqBTNGgu"
		id="gallery2-3b">



		<div class="container">
			<div>
				<!-- Filter -->
				<div class="mbr-gallery-filter container gallery-filter-active">
					<ul buttons="0">
						<li class="mbr-gallery-filter-all"><a
							class="btn btn-md btn-primary-outline active display-1" href="">All</a></li>
					</ul>
				</div>
				<!-- Gallery -->
				<div class="mbr-gallery-row">
					<div class="mbr-gallery-layout-default">
						<div>
							<div>
							<c:forEach items="${recipeList}" var="recipe" varStatus="loop">
								<div class="mbr-gallery-item mbr-gallery-item--p2"
									data-video-url="false" data-tags="작성 게시글">
									<div href="#lb-gallery2-3b" data-slide-to="0"
										data-toggle="modal">
										<img src="${pageContext.request.contextPath}/resources/css/assets/images/gallery00.jpg" alt="" title="">
										
										<a href="${pageContext.request.contextPath}/recipe/readPage?no=${recipe.no}&userNo=${userVO.no}&click=1">
										<c:if test="${recipe.title.length()>7}">
											<span class="icon-focus" style="color: black; background-color: lightgray; width: 205px; height: 130px;">
											[${recipe.title.substring(0,7)}...] <br><br> ${recipe.subTitle} </span>
										</c:if>
										<c:if test="${recipe.title.length()<=7}">
											<span class="icon-focus" style="color: black; background-color: lightgray; width: 205px; height: 130px;">
											[${recipe.title}] <br><br> ${recipe.subTitle} </span>
										</c:if>
										</a>
									</div>
								</div>
							</c:forEach>
							<c:forEach items="${likeRecipe}" var="likeRec" varStatus="loop">
								<div class="mbr-gallery-item mbr-gallery-item--p2"
									data-video-url="false" data-tags="좋아요한 게시글">
									<div href="#lb-gallery2-3b" data-slide-to="1"
										data-toggle="modal">
										<img src="${pageContext.request.contextPath}/resources/css/assets/images/gallery00.jpg" alt="" title="">
										
										<a href="${pageContext.request.contextPath}/recipe/readPage?no=${likeRec.no}&userNo=${userVO.no}&click=1">
										<c:if test="${likeRec.title.length()>7}">	
											<span class="icon-focus" style="color: black; background-color: lightgray; width: 205px; height: 130px;">
											[${likeRec.title.substring(0,7)}...] <br><br> ${likeRec.userNickName}님</span>
										</c:if>
										<c:if test="${likeRec.title.length()<=7}">
											<span class="icon-focus" style="color: black; background-color: lightgray; width: 205px; height: 130px;">
											[${likeRec.title}] <br><br> ${likeRec.userNickName}님</span>										
										</c:if>
										</a>
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
	<script src="${pageContext.request.contextPath}/resources/css/assets/masonry/masonry.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/bootstrapcarouselswipe/bootstrap-carousel-swipe.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/vimeoplayer/jquery.mb.vimeo_player.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/viewportchecker/jquery.viewportchecker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/slidervideo/script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/gallery/player.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/assets/gallery/script.js"></script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
  <!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.8.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png" type="image/x-icon">
  <meta name="description" content="">
  <title>bapsi</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/theme/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  <script src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/parallax/jarallax.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/viewportchecker/jquery.viewportchecker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>
 <style>
.floating {
	position: fixed;
	z-index: 100;
	text-align: center;
	width: 230px;
	padding: 5px;
	bottom: 80px;
	right: 0px;
	cursor: pointer;
}

@media ( min-width :576px) {
	.floating {
		max-width: 160px
	}
}

@media ( min-width :768px) {
	.floating {
		max-width: 180px
	}
}

@media ( min-width :992px) {
	.floating {
		max-width: 200px
	}
}

@media ( min-width :1500px) {
	.floating {
		max-width: 230px
	}
}

</style>
</head>
<body>

<header><jsp:include page = "/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

<section class="header1 cid-r4Ph1rRQGM mbr-parallax-background" id="header1-j">

    

    

    <div class="container">
        <div class="row justify-content-md-center">
            <div class="mbr-white col-md-10">
                
                <h3 class="mbr-section-subtitle align-center mbr-light pb-3 mbr-fonts-style display-2"><font color="#ffffff"><strong>배고플 땐 Bapsi</strong></font></h3>
                <p class="mbr-text align-center pb-3 mbr-fonts-style display-7"><font color="#ffffff"><strong>여러분이 주인공입니다. &nbsp;지금 바로 셰프가 되어 보세요!</strong></font><br><strong><br></strong></p>
                <div class="mbr-section-btn align-center">
                	<c:choose>
                		<c:when test="${empty userVO}">
                			<a class="btn btn-md btn-secondary display-7" href="${pageContext.request.contextPath}/login"><span class="mbri-play mbr-iconfont mbr-iconfont-btn">시작하기</span></a>
                		</c:when>
                		<c:otherwise>
                			<a class="btn btn-md btn-secondary display-7" href="${pageContext.request.contextPath}/recipe/recipeList"><span class="mbri-play mbr-iconfont mbr-iconfont-btn">시작하기</span></a>
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
        </div>
    </div>

</section>

   <section class="features16 cid-r4OiBsP4t5" id="features16-1">

      <div class="container align-center">
         <h2 class="pb-3 mbr-fonts-style mbr-section-title display-2">뱁시맨의
            추천 메뉴</h2>

         <div class="row media-row">
         <c:forEach begin="0" end="3" items="${recipeList}" var="recipe"
               varStatus="loop">
            <div class="team-item col-lg-3 col-md-6">
               <div class="item-image">
                <a
                           href="${pageContext.request.contextPath}/recipe/readPage${pagingMaker.makeFind(pagingMaker.cri.page)}&no=${recipe.no}&userNo=${userVO.no}&click=1">
                  <img
                     src="${pageContext.request.contextPath}/resources/css/assets/images/face6.jpg">
                     </a>
               </div>
               <div class="item-caption py-3">
                  <div class="item-name px-2">
                     <p class="mbr-fonts-style display-5">${recipe.title}</p>
                  </div>
                  <div class="item-role px-2">
                     <p>${recipe.userNickName}님</p>
                  </div>
                  <div class="item-social pt-2">
                     <p>${recipe.point}점</p>
                  </div>
               </div>
            </div>
             </c:forEach>
         </div>
      </div>
   </section>
<section class="features16 cid-r4OiDcWg1U" id="features16-3">
    
    
    
    <div class="container align-center">
        <h2 class="pb-3 mbr-fonts-style mbr-section-title display-2">추천 야식(아침, 점심) 메뉴</h2>
        
        <div class="row media-row">
            
        <div class="team-item col-lg-3 col-md-6">
                <div class="item-image">
                    <img src="${pageContext.request.contextPath}/resources/css/assets/images/face6.jpg">
                </div>
                <div class="item-caption py-3">
                    <div class="item-name px-2">
                        <p class="mbr-fonts-style display-5">
                           John Smith
                        </p>
                    </div>
                    <div class="item-role px-2">
                        <p>Developer</p>
                    </div>
                    <div class="item-social pt-2">
                        <a href="https://twitter.com/mobirise" target="_blank">
                            <span class="p-1 socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.facebook.com/pages/Mobirise/1616226671953247" target="_blank">
                            <span class="p-1 socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://plus.google.com/u/0/+Mobirise" target="_blank">
                            <span class="p-1 socicon-googleplus socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.linkedin.com/in/mobirise" target="_blank">
                            <span class="p-1 socicon-linkedin socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.instagram.com/mobirise/" target="_blank">
                            
                        </a>
                        <a href="https://www.youtube.com/channel/UCt_tncVAetpK5JeM8L-8jyw" target="_blank">    
                            
                        </a>
                    </div>
                </div>
            </div><div class="team-item col-lg-3 col-md-6">
                <div class="item-image">
                    <img src="${pageContext.request.contextPath}/resources/css/assets/images/face6.jpg">
                </div>
                <div class="item-caption py-3">
                    <div class="item-name px-2">
                        <p class="mbr-fonts-style display-5">
                           John Smith
                        </p>
                    </div>
                    <div class="item-role px-2">
                        <p>Developer</p>
                    </div>
                    <div class="item-social pt-2">
                        <a href="https://twitter.com/mobirise" target="_blank">
                            <span class="p-1 socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.facebook.com/pages/Mobirise/1616226671953247" target="_blank">
                            <span class="p-1 socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://plus.google.com/u/0/+Mobirise" target="_blank">
                            <span class="p-1 socicon-googleplus socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.linkedin.com/in/mobirise" target="_blank">
                            <span class="p-1 socicon-linkedin socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.instagram.com/mobirise/" target="_blank">
                            
                        </a>
                        <a href="https://www.youtube.com/channel/UCt_tncVAetpK5JeM8L-8jyw" target="_blank">    
                            
                        </a>
                    </div>
                </div>
            </div><div class="team-item col-lg-3 col-md-6">
                <div class="item-image">
                    <img src="${pageContext.request.contextPath}/resources/css/assets/images/face6.jpg">
                </div>
                <div class="item-caption py-3">
                    <div class="item-name px-2">
                        <p class="mbr-fonts-style display-5">
                           John Smith
                        </p>
                    </div>
                    <div class="item-role px-2">
                        <p>Developer</p>
                    </div>
                    <div class="item-social pt-2">
                        <a href="https://twitter.com/mobirise" target="_blank">
                            <span class="p-1 socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.facebook.com/pages/Mobirise/1616226671953247" target="_blank">
                            <span class="p-1 socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://plus.google.com/u/0/+Mobirise" target="_blank">
                            <span class="p-1 socicon-googleplus socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.linkedin.com/in/mobirise" target="_blank">
                            <span class="p-1 socicon-linkedin socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.instagram.com/mobirise/" target="_blank">
                            
                        </a>
                        <a href="https://www.youtube.com/channel/UCt_tncVAetpK5JeM8L-8jyw" target="_blank">    
                            
                        </a>
                    </div>
                </div>
            </div><div class="team-item col-lg-3 col-md-6">
                <div class="item-image">
                    <img src="${pageContext.request.contextPath}/resources/css/assets/images/face6.jpg">
                </div>
                <div class="item-caption py-3">
                    <div class="item-name px-2">
                        <p class="mbr-fonts-style display-5">
                           John Smith
                        </p>
                    </div>
                    <div class="item-role px-2">
                        <p>Developer</p>
                    </div>
                    <div class="item-social pt-2">
                        <a href="https://twitter.com/mobirise" target="_blank">
                            <span class="p-1 socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.facebook.com/pages/Mobirise/1616226671953247" target="_blank">
                            <span class="p-1 socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://plus.google.com/u/0/+Mobirise" target="_blank">
                            <span class="p-1 socicon-googleplus socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.linkedin.com/in/mobirise" target="_blank">
                            <span class="p-1 socicon-linkedin socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                        <a href="https://www.instagram.com/mobirise/" target="_blank">
                            
                        </a>
                        <a href="https://www.youtube.com/channel/UCt_tncVAetpK5JeM8L-8jyw" target="_blank">    
                            
                        </a>
                    </div>
                </div>
            </div></div>    
    </div>
</section>

<section class="counters1 counters cid-r4OiDA6F9z" id="counters1-4">

    

    

    <div class="container">
        
        

        <div class="container pt-4 mt-2">
            <div class="media-container-row">
                <div class="card p-3 align-center col-12 col-md-6 col-lg-4">
                    <div class="panel-item p-3">
                        <div class="card-img pb-3">
                            <span class="mbr-iconfont mbri-preview"></span>
                        </div>

                        <div class="card-text">
                            <h3 class="count pt-3 pb-3 mbr-fonts-style display-2">
                                  500</h3>
                            <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">페이지 방문한 수</h4>
                            <p class="mbr-content-text mbr-fonts-style display-7">
                                4
                            </p>
                        </div>
                    </div>
                </div>


                <div class="card p-3 align-center col-12 col-md-6 col-lg-4">
						<div class="panel-item p-3">
							<div class="card-img pb-3">
								<span class="mbr-iconfont mbri-touch"></span>
							</div>
							<div class="card-text">
								<h3 class="count pt-3 pb-3 mbr-fonts-style display-2">${pagingMaker.totalData}</h3>
								<h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">
									레시피 수</h4>
								<p class="mbr-content-text mbr-fonts-style display-7">4</p>
							</div>
						</div>
					</div>
					

                <div class="card p-3 align-center col-12 col-md-6 col-lg-4">
                    <div class="panel-item p-3">
                        <div class="card-img pb-3">
                            <span class="mbr-iconfont mbri-user"></span>
                        </div>
                        <div class="card-text">
                            <h3 class="count pt-3 pb-3 mbr-fonts-style display-2">
                                  300
                            </h3>
                            <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">
                                회원수</h4>
                            <p class="mbr-content-text mbr-fonts-style display-7">
                                    4
                            </p>
                        </div>
                    </div>
                </div>


                
            </div>
        </div>
   </div>
</section>

<div class = "floating">
   <div><a href="${pageContext.request.contextPath}/WhatToEat">
   <img src="${pageContext.request.contextPath}/resources/images/Floating_logo2.png" style="width:100%" title="뭐 먹을지 모르겠다면 클릭!"></a></div> <!-- 원래 200px -->
</div>

<footer><jsp:include page = "/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html>
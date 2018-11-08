<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  
     .cid {
        padding-top: 135px;
        padding-bottom: 135px;
        background-image:url("${pageContext.request.contextPath}/resources/images/콩개많음.jpg");
     }
     
  </style>

</head>
<body>

  <div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">오늘은 <b style="color:blue">${randomEat.food}</b> 어때요?<br>오늘의 추천동영상과 함께 맛있는 식사하세요!</div>
      <div class="modal-body">
      	<div class="video-block" style="width: 100%;">
 		<iframe class="mbr-embedded-video" src="${randomEat.url}" width="465" height="720" frameborder="0" allowfullscreen></iframe>
 		</div>
      </div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>
    

   <header><jsp:include page = "/WEB-INF/views/jsp/include/topMenu.jsp" /></header>
   
   <section class="header1 cid mbr-parallax-background" id="header1-j">
   
   <div class="container">
        <div class="row justify-content-md-center">
            <div class="mbr-white col-md-10">
                
                <h3 class="mbr-section-subtitle align-center mbr-light pb-3 mbr-fonts-style display-2"><font color="#ffffff"><strong>Random Food</strong></font></h3>
                <p class="mbr-text align-center pb-3 mbr-fonts-style display-7"><font color="#ffffff"><strong>정말 무엇을 먹을지 모르겠다구요? 한번 뽑아보세요!</strong></font><br><strong><br></strong></p>
                <%-- <div class="mbr-section-btn align-center"><a class="btn btn-md btn-secondary display-7" href="${pageContext.request.contextPath}/randomEat"><span class="mbri-play mbr-iconfont mbr-iconfont-btn">그냥 이거 먹자...!</span>
                </a></div> --%>
                
                <div class="mbr-section-btn align-center"><button class="btn btn-md btn-secondary display-7" id = "random" data-toggle="modal" data-target="#myModal"><span class="mbri-play mbr-iconfont mbr-iconfont-btn">그냥 이거 먹자...!</span>
                </button></div>
                
            </div>
        </div>
    </div>
    
    </section>
   <footer><jsp:include page = "/WEB-INF/views/jsp/include/footer.jsp" /></footer>
</body>
</html>
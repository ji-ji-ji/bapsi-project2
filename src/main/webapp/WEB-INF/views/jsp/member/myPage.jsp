<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.8.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png" type="image/x-icon">
  <meta name="description" content="Web Site Builder Description">
  <title>bapsi</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons/mobirise-icons.css">
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
  <script src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>

  <script>
     $(document).ready(function(){
    	 $('#changePassword').click(function(){
             if(confirm('비밀번호를 수정하시겠습니까?')){
                location.href = "${pageContext.request.contextPath}/changePassword"
             }
          });   
    	 
        $('#memberUpdate').click(function(){
           if(confirm('회원정보를 수정하시겠습니까?')){
              location.href = "${pageContext.request.contextPath}/mypage/update"
           }
        });
        

        $('#selfDelete').click(function(){
           if(confirm('정말로 탈퇴를 하시겠습니까?')){
              location.href = "${pageContext.request.contextPath}/selfdelete"
           }
        });
        
        $('#fileDelete').click(function(){
            if(confirm('프로필을 삭제 하시겠습니까?')){

               location.href = "${pageContext.request.contextPath}/fileDelete"
            }
         });
        
        
     });
  </script>

</head>
<body>

   <header><jsp:include page = "/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

   <section class="mbr-section form4 cid-r5i8KQIDUV" id="form4-21">

    

    
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                  <div class="mbr-figure">
                     <form action = "${pageContext.request.contextPath}/upload/uploadFile" enctype="multipart/form-data" method="post">
                         <c:choose>
                             <c:when test = "${empty upload.file_fakename}">
                           <img src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"   alt="이미지를 불러올수 없습니다.">
                        </c:when>
                        <c:otherwise>
                           <img src="${pageContext.request.contextPath}/img/${upload.file_fakename}" style="width:435px; height:435px;"   alt="이미지를 불러올수 없습니다.">
                        </c:otherwise>
                     </c:choose>
                     
                     <c:choose>
                        <c:when test = "${empty upload.file_fakename}">
                           
                        </c:when>
                        <c:otherwise>
                           <input type = "button" id = "fileDelete" name = "fileDelete" value = "프로필 삭제">
                        </c:otherwise>
                     </c:choose>
                    </form>
                 </div>
               </div>
            
            <div class="col-md-6">
                <h2 class="pb-3 align-left mbr-fonts-style display-2">마이 페이지</h2>
                <div>
                    <div class="icon-block pb-3">
                        <span class="icon-block__icon">
                            <span class="mbr-iconfont mbri-info"></span>
                        </span>
                        <h4 class="icon-block__title align-left mbr-fonts-style display-5">
                            회원님의 프로필 입니다.</h4>
                    </div>
                    
                </div>
                <div data-form-type="formoid">
                    
                    <form class="block mbr-form">
                        <div class="row">
                        
                           <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="회원번호" id="no" readonly="readonly" style = "text-align : center;">
                            </div>
                           <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="no" data-form-field="Email" placeholder="회원번호" id="no" value = "${member.no}" readonly="readonly">
                            </div>
                                                    
                           <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="아이디" id="email" readonly="readonly" style = "text-align : center;">
                            </div>
                           <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="email" data-form-field="Email" placeholder="이메일" id="email" value = "${member.email}" readonly="readonly">
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input"  data-form-field="Email" placeholder="이름" id="name" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="name" data-form-field="Email" placeholder="이름" id="name" value = "${member.name}" readonly="readonly">
                            </div>
                            
                             <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="성별" id="gender" readonly="readonly" style = "text-align : center;">
                            </div>
                           	 <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="gender" data-form-field="Email" placeholder="성별" id="gender" value = "${member.gender}" readonly="readonly">
                            </div>
 <%--                            <c:if test="${member.socialLogin == '0'}">
                            <div class="col-md-4" data-for="hintq">
									<input type="text" class="form-control input"
										data-form-field="hintq" placeholder="비밀번호힌트 질문" id="hintq"
										readonly="readonly"
										style="text-align: center; font-size: 15px;">
								</div>
								<div class="col-md-8" data-for="email">
									<input type="text" class="form-control input" name="hintq"
										data-form-field="Email" placeholder="${member.hintq}" id="hintq"
										value="${member.hintq}" readonly="readonly"
										style="font-size: 15px">
								</div>

								<div class="col-md-4" data-for="email">
									<input type="text" class="form-control input"
										data-form-field="Email" placeholder="비밀번호힌트 대답" id="age"
										readonly="readonly"
										style="text-align: center; font-size: 15px;">
								</div>
								<div class="col-md-8" data-for="email">
									<input type="text" class="form-control input" name="age"
										data-form-field="Email" placeholder="나이대" id="age"
										value="${member.hinta}" readonly="readonly"
										style="font-size: 15px">
								</div>
                            </c:if>
                             --%>
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="나이대" id="age" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="age" data-form-field="Email" placeholder="나이대" id="age" value = "${member.age}" readonly="readonly">
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="닉네임" id="nickname" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="nickname" data-form-field="Email" placeholder="닉네임" id="nickname" value = "${member.nickname}" readonly="readonly">
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="전화번호" id="tel" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="tel" data-form-field="Email" placeholder="전화번호" id="tel" value = "${member.tel}" readonly="readonly">
                            </div>
                            
                            <div class="col-md-3" data-for="message">
                                <textarea class="form-control input" rows="3" data-form-field="Message" placeholder="소  개" style="resize:none; text-align : center;" id="comments" readonly="readonly"></textarea>
                            </div>
                            <div class="col-md-9" data-for="message">
                                <textarea class="form-control input" name="comments" rows="3" data-form-field="Message" placeholder="한 줄 자기소개" style="resize:none" id="comments" readonly="readonly">${member.comments}</textarea>
                            </div>
                            
                            <div class="input-group-btn col-md-12" style="margin-top: 15px;">
                            <c:if test="${member.socialLogin == '0'}">
								<input type="button" class="btn btn-form btn-secondary display-4" id = "changePassword" value="비밀번호변경">
							</c:if>
                            <input type="button" class="btn btn-form btn-secondary display-4" id = "memberUpdate" value="정보 수정">
                            <input type="button" class="btn btn-form btn-secondary display-4" id = "selfDelete" value="회원 탈퇴">
                               <!-- <button href="" type="submit" class="btn btn-form btn-secondary display-4">회원정보 수정</button> -->
                               <!-- <input type="button" class="btn btn-secondary btn-form display-4" style="width:199px; padding-left:31px; padding-right:31px;"  id="checkNickname" value="회원정보 수정"> -->
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

   <footer><jsp:include page = "/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html>
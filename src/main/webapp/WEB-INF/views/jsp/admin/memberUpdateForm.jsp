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
        $('#updateCancel').click(function(){
           if(confirm('수정을 취소 하시겠습니까?')){
              location.href = "${pageContext.request.contextPath}/list"
           }
        });
        
    var checkNickname = 0;
        
	$('#checkNickname').click(function(){
  			
			var nickname = $('#nickname').val();
			
			$.ajax({
				async : true,
				type : 'POST',
				url : '${pageContext.request.contextPath}/check/nickname',
				dataType : 'json',
				data : nickname,
				contentType : 'application/json; charset=UTF-8',
				success : function(data) {
					if(data.cnt == 1){
						alert('존재하는 닉네임 입니다. 다른 닉네임을 입력해주세요');
						$('#nickname').focus();
						checkNickname = 0;
					}else{
						alert('사용 가능합니다!');
						$('#nickname').focus();
						checkNickname = 1;
					}
				}
			});
		});
     });
     
     function doWrite(){

    		if(checkNickname == 0){
    			alert('닉네임 중복체크를 확인해주세요!');
    			$('#nickname').focus();
    			return false;
    		}
    		return true;
    	}
     
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
                    </form>
                 </div>
               </div>
            
            <div class="col-md-6">
                <h2 class="pb-3 align-left mbr-fonts-style display-2">회원정보 수정</h2>
                <div>
                    <div class="icon-block pb-3">
                        <span class="icon-block__icon">
                            <span class="mbr-iconfont mbri-info"></span>
                        </span>
                        <h4 class="icon-block__title align-left mbr-fonts-style display-5"><b style="color: #c12048">${ member.name }</b>회원님의 프로필 입니다.</h4>
                    </div>
                    
                </div>
                <div data-form-type="formoid">
                    
                    <form class="block mbr-form" action="${pageContext.request.contextPath}/updatecomplete" method = "post" onsubmit="return doWrite()">
                        <div class="row">
                        
                           <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="회원번호" id="noFix" readonly="readonly" style = "text-align : center;">
                            </div>
                           <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="no" data-form-field="Email" placeholder="회원번호" id="no" value = "${member.no}" readonly="readonly">
                            </div>
                        
                           <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="아이디" id="emailFix" readonly="readonly" style = "text-align : center;">
                            </div>
                           <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="email" data-form-field="Email" placeholder="아이디" id="email" value = "${member.email}" readonly="readonly">
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="이름" id="nameFix" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="name" data-form-field="Email" placeholder="이름을 입력해주세요" id="name" value = "${member.name}">
                            </div>
                            
                             <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="성별" id="genderFix" readonly="readonly" style = "text-align : center;">
                            </div>
                           	 <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="gender" data-form-field="Email" placeholder="성별" id="gender" value = "${member.gender}" readonly="readonly">
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="나이대" id="ageFix" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <%-- <input type="text" class="form-control input" name="age" data-form-field="Email" placeholder="나이대" id="age" value = "${member.age}" readonly="readonly"> --%>
                                <select class="form-control input" name="age" id = "age">
                                   <option selected>${member.age}</option>
                                   <option>------------------</option>
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
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="닉네임" id="nicknameFix" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-5" data-for="email">
                                <input type="text" class="form-control input" name="nickname" data-form-field="Email" placeholder="닉네임" id="nickname" value = "${member.nickname}"> 
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                            	<input type="button" class="btn btn-secondary btn-form display-4" style="width:199px; padding-left:31px; padding-right:31px;"  id="checkNickname" value="중복체크">
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="전화번호" id="telFix" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="tel" data-form-field="Email" placeholder="전화번호를 입력해주세요" id="tel" value = "${member.tel}">
                            </div>
                            
                            <div class="col-md-3" data-for="message">
                                <textarea class="form-control input" rows="3" data-form-field="Message" placeholder="소  개" style="resize:none; text-align : center;" id="commentsFix" readonly="readonly"></textarea>
                            </div>
                            <div class="col-md-9" data-for="message">
                                <textarea class="form-control input" name="comments" rows="3" data-form-field="Message" placeholder="한 줄 자기소개를 입력해주세요" style="resize:none" id="comments">${member.comments}</textarea>
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="가입일자" id="reg_dateFix" readonly="readonly" style = "text-align : center;">
                            </div>
                           <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="reg_date" data-form-field="Email" id="reg_date" value = "${member.reg_date}" readonly="readonly">
                            </div>
                            
                            <div class="input-group-btn col-md-12" style="margin-top: 15px;">
                            <input type="submit" class="btn btn-form btn-secondary display-4" id = "update" value="완료">
                            <input type="button" class="btn btn-form btn-secondary display-4" id = "updateCancel" value="취소">
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
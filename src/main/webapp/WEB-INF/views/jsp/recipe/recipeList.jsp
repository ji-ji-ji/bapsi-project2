<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png"
   type="image/x-icon">
<meta name="description" content="Web Generator Description">
<title>byAmountRecipes</title>
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
<Script>
   var result = '${result}';

   if (result == 'Update') {
      alert("게시글이 수정 되었습니다!");
   }

   if (result == 'Delete') {
      alert("게시글이 삭제 되었습니다!");
   }

   if (result == 'Write') {
      alert("게시글이 등록 되었습니다!");
   }
</Script>
</head>
<body>

   <header><jsp:include
         page="/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

   <section class="features3 cid-r4QcxVNCog" id="features3-17">
      <div class="media-container-row">
         <div class="btn-group" role="group">
            <select name = "findType" class="form-control input-sm">
               <option value="N"
                 <c:out value="${fCri.findType == null? 'selected' : ''}"/>>------------</option>
               <option value="S"
                 <c:out value="${fCri.findType eq 'S'? 'selected' : ''}"/>>제목</option>
               <option value="C"
                 <c:out value="${fCri.findType == 'C'? 'selected' : ''}"/>>내용</option>
               <option value="W"
                 <c:out value="${fCri.findType == 'W'? 'selected' : ''}"/>>닉네임</option>
               <option value="SC"
                 <c:out value="${fCri.findType == 'F'? 'selected' : ''}"/>>요리이름</option>
            </select>
            <input type="text" size="50" name="keyword" id="findword" value="${fCri.keyword}" />
            <button id="findBtn"  class="form-control input-sm">검색</button>
            
            
         </div>
      </div>
      <div class="container">

         <div class="media-container-row">
            <c:forEach begin="0" end="2" items="${recipeList}" var="recipe"
               varStatus="loop">
               <div class="card p-3 col-12 col-md-6 col-lg-4">
                  <div class="card-wrapper">
                     <div class="card-img">
                     	<c:choose>
	                     	<c:when test="${empty userVO }">
	                           <a href="#" onclick="AfterLogin();"> 
	                           		<img src="${pageContext.request.contextPath}/resources/css/assets/images/015.jpg" alt="Mobirise" title="">
	                  		   </a>
	                     	</c:when>
                     	<c:otherwise>
	                        <a
	                           href="${pageContext.request.contextPath}/recipe/readPage${pagingMaker.makeFind(pagingMaker.cri.page)}&no=${recipe.no}&userNo=${userVO.no}&click=1">
	                           <img src="${pageContext.request.contextPath}/resources/css/assets/images/015.jpg" alt="Mobirise" title="">
	                        </a>
                        </c:otherwise>
                        </c:choose>
                     </div>
                     <div class="card-box">
                        <h10 class="mbr-text mbr-fonts-style display-7">글번호:&nbsp;${recipe.no}</h10>
                        <h4 class="card-title mbr-fonts-style display-7">${recipe.title}</h4>
                        <p class="mbr-text mbr-fonts-style display-7">${recipe.subTitle}</p>
                        <p class="mbr-text mbr-fonts-style display-7">${recipe.userNickName}님</p>
                        <br>
                        <h5 class="mbr-text mbr-fonts-style display-7">조회수:&nbsp;${recipe.viewCnt}</h5>
                     </div>

                  </div>
               </div>
            </c:forEach>
         </div>

         <div class="media-container-row">
            <c:forEach begin="3" end="5" items="${recipeList}" var="recipe"
               varStatus="loop">
               <div class="card p-3 col-12 col-md-6 col-lg-4">
                  <div class="card-wrapper">
                     <div class="card-img">
                     	<c:choose>
	                     	<c:when test="${empty userVO }">
	                     		<a href="#" onclick="AfterLogin();"> 
	                				<img src="${pageContext.request.contextPath}/resources/css/assets/images/015.jpg" alt="Mobirise" title="">
	                     		</a>
	                     	</c:when>
                     	<c:otherwise>
	                        <a
	                           href="${pageContext.request.contextPath}/recipe/readPage${pagingMaker.makeFind(pagingMaker.cri.page)}&no=${recipe.no}&userNo=${userVO.no}&click=1">
	                           <img src="${pageContext.request.contextPath}/resources/css/assets/images/015.jpg" alt="Mobirise" title="">
	                        </a>
                        </c:otherwise>
                        </c:choose>
                     </div>
                     <div class="card-box">
                        <h10 class="mbr-text mbr-fonts-style display-7">글번호:&nbsp;${recipe.no}</h10>
                        <h4 class="card-title mbr-fonts-style display-7">${recipe.title}</h4>
                        <p class="mbr-text mbr-fonts-style display-7">${recipe.subTitle}</p>
                        <p class="mbr-text mbr-fonts-style display-7">${recipe.userNickName}님</p>
                        <br>
                        <h5 class="mbr-text mbr-fonts-style display-7">조회수:&nbsp;${recipe.viewCnt}</h5>
                     </div>

                  </div>
               </div>
            </c:forEach>
         </div>

         <br> <br>
         <button onclick="location.href='new'">새글등록</button>
         <br> <br> <br>

         <div class="media-container-row">
            <div class="btn-group" role="group" aria-label="Basic example"
               style="text-align: center;">
               <c:if test="${pagingMaker.prev}">
                  <button type="button" class="btn btn-outline-danger btn-sm"
                     onclick="location.href='${pageContext.request.contextPath}/recipe/recipeList${pagingMaker.makeFind(pagingMaker.startPage-1)}'">◀</button>
               </c:if>

               <c:forEach begin="${pagingMaker.startPage}"
                  end="${pagingMaker.endPage}" var="pNum">
                  <a
                     href="${pageContext.request.contextPath}/recipe/recipeList${pagingMaker.makeFind(pNum)}">
                     <button type="button"
                        class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-outline-danger btn-sm  active':' btn  btn-default btn-sm'}"/>">
                        ${pNum}</button>
                  </a>
               </c:forEach>
               <c:if test="${pagingMaker.next&&pagingMaker.endPage>0}">
                  <button type="button" class="btn btn-outline-danger btn-sm"
                     onclick="location.href='${pageContext.request.contextPath}/recipe/recipeList${pagingMaker.makeFind(pagingMaker.endPage+1)}'">▶</button>
               </c:if>
            </div>
         </div>
      </div>
   </section>
   
	 <script type="text/javascript">
	 		function AfterLogin(){
	 			if(confirm('로그인 후 이용해주시길 바랍니다.')){
	 				location.href="${pageContext.request.contextPath}/login";
	 			}else{
	 				location.href="${pageContext.request.contextPath}/recipe/recipeList";
	 			}
	 		}
	 
	      	$(document).ready(function(){
	      		$('#findBtn').on("click",function(e){
	      			self.location="recipeList"+"${pagingMaker.makeURI(1)}"
	      				+"&findType="
	      					+$("select option:selected").val()
	      				+"&keyword="
	      					+$("#findword").val();
	      		});
	      		
	      		$('#writeBtn').on("click",function(e){
	      			self.location ="write";
	      		});
	      		
	      	});
      
      </script>

   <footer><jsp:include
         page="/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html>
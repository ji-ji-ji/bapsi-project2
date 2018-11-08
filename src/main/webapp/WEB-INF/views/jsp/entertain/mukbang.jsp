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
  <meta name="description" content="Site Builder Description">
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
  
  <style>
     .col-md-3{
        background-color: #f5f5f5; 
        border: 1px solid #e8e8e8; 
        line-height: 1.43; 
        min-height: 3.5em; 
        padding: 1.07em .5em; 
        border-radius: .25rem; 
        color: #565656;
        width:90px;
     }
     
     .whatSearch{
        background-color: #f5f5f5; 
        line-height: 1.43; 
        padding: 1.07em .5em; 
        border: 1px solid #e8e8e8; 
        border-radius: .25rem; 
        color: #565656; 
     }
  
     .search{
        background-color: #c12048 !important;
        border-color: #c12048 !important; 
        color: #ffffff !important; 
        line-height: 1.43; 
        padding: 1.07em .5em; 
        padding: 1rem 3rem; 
        border-radius: .25rem; 
        cursor: pointer; 
        letter-spacing: 1px; 
        border: 1px solid transparent; 
        color: #565656;
     }
     /* 
    @media ( min-width :576px) {
	.mbr-figure {
		max-width: 570px
	}
}
	
	@media ( min-width :768px) {
		.mbr-figure {
			max-width: 700px
		}
}
	
	@media ( min-width :992px) {
		.mbr-figure {
			max-width: 990px
		}
}
	
	@media ( min-width :1500px) {
		.mbr-figure {
			max-width: 1200px
		}
}
   */
  </style>
  
  <script type="text/javascript">
         $(document).ready(function(){
            $('#findBtn').on("click",function(e){
               self.location="youtuber"+"${pagingMaker.makeURI(1)}"
                  +"&findType="
                  +$("select option:selected").val()
                  +"&keyword="+$("#findword").val();
            });
            
            $('#findword').keypress(function (e) {
               if(e.which == 13){
                  $(this).blur();
                  $('#findBtn').focus().click();
               }
            });
            
         });
      
      </script>
  
</head>
<body>

   <header><jsp:include page = "/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

   <section class="cid-r5iDgiaLcG" id="video3-2g">
   <h2 class="pb-3 mbr-fonts-style mbr-section-title display-2" style="text-align:center;">유튜브 먹방</h2>
            <div align= "center" >
                  <span class="col-md-12">                        
                       <select name="findType" class="col-md-3" >
                       <option value="A" <c:out value="${ fCri.findType =='A'? 'selected':''}"/>>전체</option>
                       <option value="Y" <c:out value="${ fCri.findType =='Y'? 'selected':''}"/>>유튜버</option>
                       <option value="K" <c:out value="${ fCri.findType =='K'? 'selected':''}"/>>한식</option>
                       <option value="C" <c:out value="${ fCri.findType =='C'? 'selected':''}"/>>중식</option>
                       <option value="U" <c:out value="${ fCri.findType =='U'? 'selected':''}"/>>양식</option>
                       <option value="J" <c:out value="${ fCri.findType =='J'? 'selected':''}"/>>일식</option>
                       <option value="N" <c:out value="${ fCri.findType =='N'? 'selected':''}"/>>야식</option>
                       <option value="D" <c:out value="${ fCri.findType =='D'? 'selected':''}"/>>디저트</option>
                  </select>
                  
                     <input  class="whatSearch" type="text" name="keyword" id="findword" value="${fCri.keyword}" />
                     <button class="search" id="findBtn">검색</button><br/><br/>
               </span>
            </div>


         
                  
    <figure class="mbr-figure align-center container" style="display:flex; margin-bottom:30px;">
     <c:forEach begin = "0" end = "2" var="mukbang" items="${ mukbangList }">
           <div class="video-block" style="width: 100%; margin-right:30px;"> <!-- 원래 46%  -->
               <div><iframe class="mbr-embedded-video" src="${ mukbang.url }" width="1280" height="720" frameborder="0" allowfullscreen></iframe></div>
              </div>
     </c:forEach>
    </figure>
    
    
   <figure class="mbr-figure align-center container" style="display:flex; margin-bottom:30px;">
        <c:forEach begin="3" end="5" var="mukbang" items="${ mukbangList }">
              <div class="video-block" style="width: 100%; margin-right:30px;"> <!-- 원래 46%  -->
               <div><iframe class="mbr-embedded-video" src="${ mukbang.url }" width="1280" height="720" frameborder="0" allowfullscreen></iframe></div>
           </div>
        </c:forEach>
    </figure>
     
    
    <div class="showback" align="center">
            <div class="btn-group">
               <c:if test="${pagingMaker.prev}">
                  <a href="${pageContext.request.contextPath}/youtuber${pagingMaker.makeFind(pagingMaker.startPage-1) }">
                     <button type="button" class="btn btn-outline-danger btn-sm" style = "cursor: pointer;">◀</button>
                  </a>
               </c:if>

               <c:forEach begin="${pagingMaker.startPage}" end="${pagingMaker.endPage}" var="pNum">
                      <a href="${pageContext.request.contextPath}/youtuber${pagingMaker.makeFind(pNum) }" >       
                     <button type="button"  style="cursor: pointer;" class="<c:out value="${pagingMaker.cri.page ==pNum?'btn btn-outline-danger btn-sm active':' btn btn-sm btn-default'}"/>">${pNum}</button>
                  </a>
               </c:forEach>

               <!--a태그는 button밖에 넣어줘야 먹힌다.  -->
               <c:if test="${pagingMaker.next&&pagingMaker.endPage>0}">
                  <a href="${pageContext.request.contextPath}/youtuber${pagingMaker.makeFind(pagingMaker.endPage+1) }">
                     <button type="button" class="btn btn-outline-danger btn-sm" style="cursor: pointer;">▶</button>
                  </a>
               </c:if>
            </div>
         </div>
    
</section>

   <footer><jsp:include page = "/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> <!--데이터를 가져오는 format  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
<meta name="description" content="Web Builder Description">
<title>bapsi</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/socicon/css/styles.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/datatables/data-tables.bootstrap4.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/theme/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/mobirise/css/mbr-additional.css" type="text/css">

<script  src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/datatables/jquery.data-tables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/datatables/data-tables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
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

  </style>

<script>
   /*-------- 체크박스 전체선택, 전체해제  임지영*/
   $(document).ready(function() {
      $("#checkall").click(function() {
         if ($("#checkall").is(":checked")) {
            $(".check").prop("checked", true);
         } else {
            $(".check").prop("checked", false);
         }
      });
   });
</script>
</head>
<body>

   <header><jsp:include
         page="/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

   <section class="section-table cid-r5iAcKGWpd" id="table1-2b">



      <div class="container container-table">
         <h2
            class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">회원목록 조회</h2>

         <div class="table-wrapper">
            <div class="container">
<!--                <div class="row search">
                  <div class="col-md-6"></div>
                  <div class="col-md-6">
                     <div class="dataTables_filter">
                        <input class="form-control input-sm">&nbsp; <input
                           class="form-control input-sm" type="submit" value="검색">
                                          <label class="searchInfo mbr-fonts-style display-7">검색</label>
                     </div>
                  </div>
               </div> -->
            </div>

            <div class="container table-info-container">
               <div class="row info">
                  <div class="col-md-6">
                     <div class="dataTables_info mbr-fonts-style display-7">
                        <c:out value="Total : ${findCountData} 명"></c:out>
                     </div>
                  </div>
                  <div class="col-md-6"></div>
               </div>
            </div>
                
                <div align= "center" >
                  <span class="col-md-12">
                                   <!--jquery core library  -->                         
                       <select name="findType" class="col-md-3">
                       <option value="N" <c:out value="${ fCri.findType =='N'? 'selected':''}"/>>전체</option>
                       <option value="E" <c:out value="${ fCri.findType =='E'? 'selected':''}"/>>이메일</option>
                       <option value="N" <c:out value="${ fCri.findType =='N'? 'selected':''}"/>>이름</option>
                       <option value="G" <c:out value="${ fCri.findType =='G'? 'selected':''}"/>>성별</option>
                       <option value="K" <c:out value="${ fCri.findType =='K'? 'selected':''}"/>>닉네임</option>
                       <option value="T" <c:out value="${ fCri.findType =='T'? 'selected':''}"/>>전화번호</option>
                       <option value="A" <c:out value="${ fCri.findType =='A'? 'selected':''}"/>>연령대</option>
                       <option value="S" <c:out value="${ fCri.findType =='S'? 'selected':''}"/>>관리자/사용자</option>
                       <option value="P" <c:out value="${ fCri.findType =='P'? 'selected':''}"/>>포인트</option>
                       <option value="D" <c:out value="${ fCri.findType =='D'? 'selected':''}"/>>가입일자</option>
                  
                  
                  </select>
                     <input type="text" class="whatSearch" name="keyword" id="findword" value="${fCri.keyword}" />
                     <button id="findBtn" class="search">검색</button><br/><br/>
               </span>
            </div>

            
            <div align= "right" >
                  <span class="col-md-12">
                                   <!--jquery core library  -->                         
                       <select id="onchangetest" onchange="javascript:myListener(this)" class="col-md-3">
                       <option value="" selected disabled>페이지당 갯수</option>    
                          <option value="10">10</option>     
                     <option value="30">30</option>
                     <option value="50">50</option>
                     <option value="70">70</option>
                     <option value="100">100</option>
                                    
                  </select>
               </span>
            </div>
                     
            <div class="container scroll">
<form 
<%--                자바스크립트를 위해 아이디 준다. --%>
                   id="checkbox-form"method="post" action="/babo">
                  <table class="table isSearch" cellspacing="0">
                     <thead>
                        <tr class="table-heads"
                           style="background-color: #c12048; color: white;" align="center">
                           <!-- <th class="head-item mbr-fonts-style display-7">-</th> -->
                           <th class="head-item mbr-fonts-style display-7"><input
                              type="checkbox" class="checkall" name="checkall" id="checkall"
                              style="width: 20px; height: 20px;"></th>
                           <th class="head-item mbr-fonts-style display-7">번호</th>
                           <th class="head-item mbr-fonts-style display-7">이메일</th>
                           <th class="head-item mbr-fonts-style display-7">이름</th>
                           <th class="head-item mbr-fonts-style display-7">성별</th>
                           <th class="head-item mbr-fonts-style display-7">나이</th>
                           <th class="head-item mbr-fonts-style display-7">닉네임</th>
                           <th class="head-item mbr-fonts-style display-7">전화번호</th>
                           <th class="head-item mbr-fonts-style display-7">등록일</th>
                           <th class="head-item mbr-fonts-style display-7">구분</th>
                           <!-- <th class="head-item mbr-fonts-style display-7">회원가입일자</th> -->
                        </tr>
                     </thead>
                     <tbody>

                        <c:forEach var="member" items="${ list }">
                           <tr align="center">
                              <td class="body-item mbr-fonts-style display-7">
                              <input type="checkbox" class="check" name="noList" id="noList" value="${member.no }" style="width: 20px; height: 20px;" /></td>
                              <td class="body-item mbr-fonts-style display-7">${ member.no }</td>
                              <td class="body-item mbr-fonts-style display-7"><a
                                 href="${pageContext.request.contextPath}/list/detail/${ member.no }">${ member.email }</a></td>
                              <td class="body-item mbr-fonts-style display-7">${ member.name }</td>
                              <td class="body-item mbr-fonts-style display-7">${ member.gender }</td>
                              <td class="body-item mbr-fonts-style display-7">${ member.age }</td>
                              <td class="body-item mbr-fonts-style display-7">${ member.nickname }</td>
                              <td class="body-item mbr-fonts-style display-7">${ member.tel }</td>
                              <td class="body-item mbr-fonts-style display-7">${ member.reg_date }</td>
                              <%-- 타입 수정 --%>
                              <td class="body-item mbr-fonts-style display-7"><c:choose>
                                    <c:when test="${member.type == 'S'}">
                                       <b style="color: red">관리자</b>
                                    </c:when>
                                    <c:otherwise>
                                       <p>사용자</p>
                                    </c:otherwise>
                                 </c:choose></td>
                           </tr>
                        </c:forEach>

                     </tbody>
                  </table>
         <%-- 체크 박스 --%>
            <div class="button" style="text-align: center;">
               <input type="submit" class="btn btn-outline-primary  btn-sm" id=checkUp value="관리자로 변경"> 
               <input type="submit"  class="btn btn-outline-warning btn-sm" id=checkDown value="일반회원으로 변경"> 
               <input type="submit"  class="btn btn-outline-danger btn-sm" id=checkDelete value="회원탈퇴">
                  </div>
               </form>
            </div>
         </div>
         
         
         <div class="showback" align="center">
            <div class="btn-group">
               <c:if test="${pagingMaker.prev}">
                  <a href="${pageContext.request.contextPath}/list${pagingMaker.makeFind(pagingMaker.startPage-1) }">
                     <button type="button" class="btn btn-outline-danger btn-sm">◀</button>
                  </a>
               </c:if>

               <c:forEach begin="${pagingMaker.startPage}" end="${pagingMaker.endPage}" var="pNum">
                      <a href="${pageContext.request.contextPath}/list${pagingMaker.makeFind(pNum) }" >       
                     <button type="button"  class="<c:out value="${pagingMaker.cri.page ==pNum?'btn btn-outline-danger btn-sm active':' btn btn-sm btn-default'}"/>">${pNum}</button>
                  </a>
               </c:forEach>

               <!--a태그는 button밖에 넣어줘야 먹힌다.  -->
               <c:if test="${pagingMaker.next&&pagingMaker.endPage>0}">
                  <a href="${pageContext.request.contextPath}/list${pagingMaker.makeFind(pagingMaker.endPage+1) }">
                     <button type="button" class="btn btn-outline-danger btn-sm">▶</button>
                  </a>
               </c:if>
            </div>
         </div>
         <!-- /showback -->
         
         
      </div>
   
   </section>
   
<script>
//---------------------다중 제출 버튼 임지영------------------------- 
$(document).ready(function() {
               $('#checkUp').click(function(event) {
                              event.preventDefault();
                              if (confirm('선택한 회원을 관리자로 설정하시겠습니까?') ==    false) {
                                 return;
                              }
                              $('#checkbox-form').attr( 'action', '${pageContext.request.contextPath}/checkUp');
                              $('#checkbox-form').submit();
                           });
         
               $('#checkDown')
                     .click(function(event) {event.preventDefault();
                              if (confirm('선택한 회원을 일반회원으로 설정하시겠습니까?') ==    false) {
                                 return;
                              }
                              $('#checkbox-form').attr( 'action', '${pageContext.request.contextPath}/checkDown');
                              $('#checkbox-form').submit();
                           });                  
               

               $('#checkDelete').click(function(event) {
                              event.preventDefault();
                              if (confirm('정말로 선택한 회원을 탈퇴시키시겠습니까?') == false) {
                                 return;
                              }
                              
                              $('#checkbox-form').attr( 'action', '${pageContext.request.contextPath}/checkDelete');
                              $('#checkbox-form').submit();                                    
                              
                           });
            });
/*-------- 체크박스 전체선택, 전체해제  임지영*/
</script>   

    
      <script type="text/javascript">
         function myListener(obj){
            self.location="list"
            +"?numPerPage="+obj.value;
         
         }
   /*       function myListener(obj){
            alert(obj.value);
         } */
      </script> 
      
      <script type="text/javascript">
         $(document).ready(function(){
            $('#findBtn').on("click",function(e){
               self.location="list"+"${pagingMaker.makeURI(1)}"
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

   <footer><jsp:include
         page="/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html>
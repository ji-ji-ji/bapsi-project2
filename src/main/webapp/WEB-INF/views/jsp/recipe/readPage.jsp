<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<meta name="description" content="Web Page Builder Description">
<title>detail</title>
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
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
a:hover {
   color: blue;
}
.btn:focus, .btn:active {
  outline: none !important;
  box-shadow: none !important;
}

</style>

</head>
<body>
   <header><jsp:include
         page="/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

   <section class="features12 cid-r5sLXhqF4t" id="features12-2p">

      <input type="hidden" name="no" value="${recipe.no}" /> <input
         type="hidden" name="page" value="${fCri.page}" /> <input
         type="hidden" name="numPerPage" value="${fCri.numPerPage}" /> <input
         type="hidden" name="findType" value="${fCri.findType}" /> <input
         type="hidden" name="keyword" value="${fCri.keyword}" />

      <div class="container">
         <h2 class="mbr-section-title pb-2 mbr-fonts-style display-2">제목
            : ${ recipe.title }</h2>
         <h3>요리이름: ${ recipe.recipeName }</h3>
         <hr>
         <br>
         <!-- ---------------------------프로필사진--------------------------------------------- -->
         <div class="media-container-row">
            <c:choose>
               <c:when test="${empty writerPhoto}">
                  <img
                     src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
                     width="300px" height="300px" alt="이미지를 불러올수 없습니다.">
               </c:when>
               <c:otherwise>
                  <img src="${pageContext.request.contextPath}/img/${writerPhoto}"
                     style="width: 200px;border: 3px solid black;"
                     alt="이미지를 불러올수 없습니다.">
               </c:otherwise>
            </c:choose>
         </div>
         <div class="media-container-row">
            <br>
            <h5 style="text-align: center; padding-top: 20px;"><strong>${recipe.userNickName}</strong></h5>
            <button id="follow"
               class="<c:out value="${followCheck == 0? 'btn btn-primary-outline display-4':'btn btn-primary-outline display-4 active'}"/>"
               style="width: 150px;heignt:20; font-size: 13px;">
               <c:out value="${followCheck == 0? '팔로우':'팔로우취소'}" />
            </button>
         </div>


         <!-- ------------------------------------------------------------------------------ -->
         <hr>

         <div class="media-container-row pt-5">
            <div class="block-content align-right">
               <div class="card pl-3 pr-3 pb-5">
                  <div class="mbr-card-img-title">
                     <div class="card-img pb-3">
                        <span class="mbr-iconfont mbri-clock align-center"></span>
                     </div>
                     <div class="mbr-crt-title">
                        <h4
                           class="card-title py-2 mbr-crt-title mbr-fonts-style display-7">
                           조리시간</h4>
                     </div>
                  </div>

                  <div class="card-box">
                     <p style="text-align: center"
                        class="mbr-text mbr-section-text mbr-fonts-style display-7">
                        ${ recipe.time }</p>
                  </div>
                  <hr>
                  <div class="mbr-card-img-title">
                     <div class="card-img pb-3">
                        <span class="mbri-sites mbr-iconfont"></span>
                     </div>
                     <div class="mbr-crt-title">
                        <h4
                           class="card-title py-2 mbr-crt-title mbr-fonts-style display-7">
                           조리비용</h4>
                     </div>
                  </div>

                  <div class="card-box">
                     <p style="text-align: center"
                        class="mbr-text mbr-section-text mbr-fonts-style display-7">
                        ${ recipe.cost }</p>
                  </div>
                  <hr>

               </div>

               <div class="card pl-3 pr-3 pb-5">
                  <div class="mbr-card-img-title">
                     <div class="card-img pb-3">
                        <span class="mbr-iconfont mbri-cart-full"></span>

                     </div>
                     <div class="mbr-crt-title">
                        <h4
                           class="card-title py-2 mbr-crt-title mbr-fonts-style display-7">
                           재료 목록</h4>
                     </div>
                  </div>
                  <div class="card-box">
                     <c:forEach items="${ ingList }" var="ing" varStatus="loop">
                        <p style="text-align: center"
                           class="mbr-text mbr-section-text mbr-fonts-style display-7">
                           ${ing.ingName } : ${ing.amount}</p>

                     </c:forEach>
                  </div>
               </div>
            </div>

            <div class="mbr-figure" style="width: 50%;">
              <h3> 부제목 : ${ recipe.subTitle }</h3>
               <p style="text-align: center"
                  class="mbr-text mbr-section-text mbr-fonts-style display-7">
                  ${recipe.content }</p>

            </div>

            <div class="block-content align-left  ">
               <div class="card pl-3 pr-3 pb-5">
                  <div class="mbr-card-img-title">
                     <div class="card-img pb-3">
                        <span class="mbr-iconfont mbri-features"></span>
                     </div>
                     <div class="mbr-crt-title">
                        <h4
                           class="card-title py-2 mbr-crt-title mbr-fonts-style display-7">
                           태그목록</h4>
                     </div>
                  </div>

                  <div class="card-box">
                     <c:forEach items="${ tagList }" var="tag" varStatus="loop">
                        <a
                           href="${pageContext.request.contextPath}/recipe/recipeTagList?page=${fCri.page}&numPerPage=${fCri.numPerPage}&TagName=${tag.tagName}">
                           <p style="text-align: center; color: blue;"
                              class="mbr-text mbr-section-text mbr-fonts-style display-7">
                              # ${tag.tagName }</p>
                        </a>
                     </c:forEach>
                     <hr>
                  </div>
               </div>

               <div class="media-container-row title" id="likeDiv">
                  <div class="col-12 col-md-11">
                     <!-- 원래 8    -->
                     <div class="mbr-section-btn align-center">
                        <button id="recommand" 
                        class="<c:out value="${checkLike == 0? 'btn btn-primary-outline display-4':'btn btn-primary-outline display-4 active'}"/>"
                           style="width: 220px; font-size: 18px;"> <span
                           class="mbri-smile-face mbr-iconfont mbr-iconfont-btn "></span>좋아요
                        </button> 
                        <button id="oppose" 
                        class="<c:out value="${checkDown == 0? 'btn btn-secondary-outline display-4':'btn btn-secondary-outline display-4 active'}"/>"
                        style="width: 220px; font-size: 18px;"><span
                           class="mbri-sad-face mbr-iconfont mbr-iconfont-btn"></span>싫어요</button>
                     </div>
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>

   <section class="mbr-section content8 cid-r5sQEYUmOJ" id="content8-2t">



      <div class="container">
         <br> <br>
         <div>
         <div>
               <table class="table">
                  <tr>
                     <td>
                        <div style="width: 1000px" rows="3" cols="30">
                           <input type="hidden" name="loginUserNo" id="writer"
                              value="${userVO.no}" /> 
                              <input type="text"
                              class="form-control input" name="comments"
                              data-form-field="comments" placeholder="댓글을 입력하세요"
                              id="addReContent">
                        </div>
                        <div>
                           <button id="submitBtn" class="btn pull-right btn-success">댓글
                              작성</button>
                        </div> <!-- 대화 수정 창 -->

                     </td>
                  </tr>
               </table>
            </div>
            <ul id="reply">
               <!-- 댓글 리스트 공간 ! -->
            </ul>
            
            <!-- 수정창 띄우기 -->
            <div id="modifyDiv" style="display: none;">
               <span class='title-dialog'></span>번 댓글
               <div>
                  수정할 댓글 내용 : <br /> <input type="text" id="reContent" size="65">
               </div>

               <div align="center">
                  <button type="button" id="reModifyBtn">수정</button>
                  <button type="button" id="closeBtn">닫기</button>
               </div>
            </div>
  
            <!-- 댓글 페이징 공간 !-->
            <ul class="pgeNumList" id="lastPage" name="lastPageName">

            </ul>

            <div>
               <span><strong>댓글</strong></span> <span id="cCnt"></span>
            </div>
         </div>
                  <!-- ★★★★★댓글 ajax!!!!!!!!!!!!!!!스크립트!!! 자리 옮기면 안됨!!! 여기 있어야됨 무조건@!!!!!!!!!!!!!!!!!!!! ★★★★★★-->
         <script type="text/javascript">
      // 해당 게시글 번호 
      var recipeNo = ${recipe.no};
      var page = 1;
      getPgeNum(page);

      // 댓글 페이지 목록 만들기
      function getPgeNum(page) {
         $.getJSON("/bapsi/replies/" + recipeNo + "/" + page, function(data) {
            
            //console.log(data.reList.length);

            var sNo = '${userVO.no}';
            var str = ""; //화면에 뿌려 줄 댓글List 변수 선언 
  
            console.log('test');
            $(data.reList).each(function() {
                  
               //console.log('result2:'+(this.loginUserNo==sNo));
                     str += "<hr><li data-no='"+this.no+"' class='reList'>";
                     str +="<strong>"+this.nickName + "</strong><div class='replyE'>&nbsp;" + this.comments + "</div>&nbsp;&nbsp;";
               if(this.loginUserNo==sNo)   {
                  str+="<button style='font-size:15px;border-radius: 12px;border: 2px solid #555555;'>수정 </button>" + "<input type='button' class='deleteC' id='reDelBtn' style='font-size:15px;border-radius: 12px;border: 2px solid #555555;' value='삭제'></input>";
               }
                     str+="<span style='position: absolute; right:5%'>" + this.updateDate + "</span>";
                     str+= "</li>"; 
            });
            
            $("#reply").html(str);
            
            showPageNum(data.pagingMaker);
            
         });  
      } // getPgeNum()
      
      // 페이징 버튼 클릭 -> 해당 페이지 댓글
      function showPageNum(pagingMaker){
         var str = "";
         
         if(pagingMaker.prev){
            str += "<a href='"+(pagingMaker.startPage-1)+"'><button type='button'>◀</button></a>"
         }
         
         for(var i=pagingMaker.startPage, end=pagingMaker.endPage; i <= end; i++){
            str += "<a href='"+i+"'><button type='button'>"+i+"</button></a>"
         }
         
         if(pagingMaker.next){
            str += "<a href='"+(pagingMaker.endPage+1)+"'><button type='button'>▶</button></a>"
         }
         
         $(".pgeNumList").html(str);
         
      } //showPageNum
      
      
      //처음에 1값을 넣어줌, 기본 1페이지 디폴트 값
      var rePage = 1; 
      // 페이지 번호를 클릭하면, 해당 페이지로 이벤트 발생
      $(".pgeNumList").on("click", "a button", function(e){
         e.preventDefault(); //<a>태그의 화면전환이 일어나지 않게 하는 역할
         
         rePage = $(this).parent().attr("href"); //a태그의 href의 속성 즉, i값 가져오는 것 
         
         getPgeNum(rePage);
      });
      
      
      
      // 수정 버튼 - ul안의 click reList의 버튼 이벤트 설정 function 
      $("#reply").on("click", ".reList button", function() {
         var li = $(this).parent(); //바보

         var no = li.attr("data-no");
//          var reContent = document.getElementById('replyE');
      var reContent = $(this).parent().children('.replyE').text();

         $(".title-dialog").html(no);
         $("#reContent").val(reContent);
         $("#modifyDiv").show("slow");
         $("#reContent").focus(); 

      });
      
      // 삭제 버튼 - ul안의 click reList의 버튼 이벤트 설정 function 
      $("#reply").on("click", ".reList .deleteC", function() {
         if(confirm("삭제하시겠습니까?")){
         var li = $(this).parent();
         var no = li.attr("data-no");
          var reContent = $("#reContent").val();

          $.ajax({ 
             type : 'delete',
             url : '/bapsi/replies/' + no,
             headers : {
                "Content-Type" : "application/json",
                "X-HTTP-Method-Override" : "DELETE"
             },
             dataType : 'text',
             success : function(result) {
                console.log("result : " + result);
                if (result == 'Success') {
                   alert("삭제했습니다.");
                   $("#modifyDiv").hide("slow");
                   
                   //var rePage = data.pagingMaker.cri.page;
                   
                   getPgeNum(page);
                   
                }
             }
          }); //ajax

          };  //confirm
       });
      
      
      // 댓글 등록 click 함수 
      $("#submitBtn").on("click", function() {
         var rewriter = $("#writer").val();
         var reContent = $("#addReContent").val();
      if(reContent == ''){
         alert("댓글 내용을 작성해주세요");
      }else{
         $.ajax({
            type : 'post',
            url : '/bapsi/replies',
            headers : {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "POST" //브라우저 필터링임 -> web.xml
            },

            dataType : 'text',
            data : JSON.stringify({
               recipeNo : recipeNo,
               loginUserNo : rewriter,
               comments : reContent
            }),

            success : function(result) {
               if (result == 'Success') {
                  alert("댓글을 등록했습니다.");
                  $('#addReContent').val('');
                  getPgeNum(1);
               }
            }
         });
      }
      });

/*       //삭제 처리 
      $("#reDelBtn").on("click", function() {

         var no = $(".title-dialog").html();
         var reContent = $("#reContent").val();

         $.ajax({
            type : 'delete',
            url : '/bapsi/replies/' + no,
            headers : {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "DELETE"
            },
            dataType : 'text',
            success : function(result) {
               console.log("result : " + result);
               if (result == 'Success') {
                  alert("삭제 성공 !!!!!!!!");
                  $("#modifyDiv").hide("slow");
                  
                  //var rePage = data.pagingMaker.cri.page;
                  
                  getPgeNum(page);
                  
               }
            }
         }); //ajax

      }); */
      
      //닫기 처리 
      $("#closeBtn").on("click", function() {
               $("#modifyDiv").hide("slow");
      });

      //수정 처리 
      $("#reModifyBtn").on("click", function() {

         var no = $(".title-dialog").html();
         var reContent = $("#reContent").val();

         $.ajax({
            type : 'put',
            url : '/bapsi/replies/' + no,
            headers : {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "PUT"
            },
            data : JSON.stringify({
               comments : reContent
            }),
            dataType : 'text',
            success : function(result) {
               console.log("result : " + result);
               if (result == 'Success') {
                  alert("수정 성공 !!!!!!!!");
                  $("#modifyDiv").hide("slow");
                  //reListAll();
                  getPgeNum(page);
               }
            }
         }); //ajax

      });
   </script>

         <!-- ★★★★★포인트ajax!!!!!!!!!!!!!!!스크립트!!! 자리 옮기면 안됨!!! 여기 있어야됨 무조건@!!!!!!!!!!!!!!!!!!!! ★★★★★★-->
         <script type="text/javascript">
   $(document).ready(function() {
      
      $('#recommand').click(function() {
         var userNo  = ${userVO.no};
         var receipeUserNo = ${recipe.userNo};
         var receipeNo = ${recipe.no};
         var checkLikeData = $('#recommand').attr('class');
          
         var data = {}
          data["userNo"] = ${userVO.no};
          data["receipeUserNo"] = ${recipe.userNo};
          data["receipeNo"] = ${recipe.no};
          
         if(checkLikeData == 'btn btn-primary-outline display-4'){
            if(confirm("추천하시겠습니까?")){
               if(userNo == receipeUserNo){
                  alert('자신의 게시물은 추천할 수 없습니다.');
               } else {
                $.ajax({
                  type : 'post',
                  url : '/bapsi/point/recommand',
                    dataType : 'json',
                  data : JSON.stringify(data),
                    contentType : 'application/json; charset=UTF-8',
                  success : function(data) {
                     alert(data.msg);
                     if(data.checkLike==0) {
                              $('#recommand').prop("class","btn btn-primary-outline display-4");
                              $('#recommand').removeClass('clicked');
                          }
                     else if(data.checkLike==1){
                              $('#recommand').prop("class","btn btn-primary-outline display-4 active");
                              $('#oppose').prop("class","btn btn-secondary-outline display-4");
                              $('#recommand').removeClass('clicked');
                          } else{alert(data.msg)};
                  }, error: function(data){
                     alert("문제가 발생했습니다. 다시 시도해주세요");
                  }
                  });
            } 
            }
         };
         if(checkLikeData == 'btn btn-primary-outline display-4 active'){
            if(confirm("추천을 취소 하시겠습니까?")){
               if(userNo == receipeUserNo){
                  alert('자신의 게시물은 추천 취소 할 수 없습니다.');
               } else {
                $.ajax({
                  type : 'post',
                  url : '/bapsi/point/recommand2',
                    dataType : 'json',
                  data : JSON.stringify(data),
                    contentType : 'application/json; charset=UTF-8',
                  success : function(data) {
                     alert(data.msg);
                     if(data.checkLike==0) {
                              $('#recommand').prop("class","btn btn-primary-outline display-4");
                              $('#recommand').removeClass('clicked');
                          }
                     else if(data.checkLike==1){
                              $('#recommand').prop("class","btn btn-primary-outline display-4 active");
                              $('#oppose').prop("class","btn btn-secondary-outline display-4");
                              $('#recommand').removeClass('clicked');
                          }else{alert(data.msg)};
                  }, error: function(data){
                     alert("문제가 발생했습니다. 다시 시도해주세요");
                  }
                  });
            } 
            }
                         
         }
      });

      
      $('#oppose').click(function() {
         var userNo  = ${userVO.no};
         var receipeUserNo = ${recipe.userNo};
         var receipeNo = ${recipe.no};
         var checkDownData = $('#oppose').attr('class');
         
         var data = {}
          data["userNo"] = ${userVO.no};
          data["receipeUserNo"] = ${recipe.userNo};
          data["receipeNo"] = ${recipe.no};
          
         if(checkDownData == 'btn btn-secondary-outline display-4'){ 
            if(confirm("싫어요 하시겠습니까?")){
               if(userNo == receipeUserNo){
                  alert('자신의 게시물은 싫어요 할 수 없습니다.');
               } else{
                $.ajax({
                  type : 'post',
                  url : '/bapsi/point/oppose',
                    dataType : 'json',
                  data : JSON.stringify(data),
                    contentType : 'application/json; charset=UTF-8',
                    success : function(data) {
                     alert(data.msg);
                     if(data.checkDown==0) {
                              $('#oppose').prop("class","btn btn-secondary-outline display-4");
                              $('#oppose').removeClass('clicked');
                          }
                     else if(data.checkDown==1){
                              $('#oppose').prop("class","btn btn-secondary-outline display-4 active");
                              $('#recommand').prop("class","btn btn-primary-outline display-4");
                              $('#oppose').removeClass('clicked');
                          }else{alert(data.msg)};
                  }, error: function(data){
                     alert("문제가 발생했습니다. 다시 시도해주세요");
                  }
                  });
               }
            }
         };
         if(checkDownData == 'btn btn-secondary-outline display-4 active'){
            if(confirm("싫어요를 취소 하시겠습니까?")){
               if(userNo == receipeUserNo){
                  alert('자신의 게시물은 싫어요를 취소 할 수 없습니다.');
               } else {
                $.ajax({
                  type : 'post',
                  url : '/bapsi/point/oppose2',
                    dataType : 'json',
                  data : JSON.stringify(data),
                    contentType : 'application/json; charset=UTF-8',
                  success : function(data) {
                     alert(data.msg);
                     if(data.checkDown==0) {
                              $('#oppose').prop("class","btn btn-secondary-outline display-4");
                              $('#oppose').removeClass('clicked');
                          }
                     else if(data.checkDown==1){
                              $('#oppose').prop("class","btn btn-secondary-outline display-4 active");
                              $('#recommand').prop("class","btn btn-primary-outline display-4");
                              $('#oppose').removeClass('clicked');
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

   <!-- ★★★★★ 팔로우 ajax!!!!!!!!!!!!!!!스크립트!!! 자리 옮기면 안됨!!! 여기 있어야됨 무조건@!!!!!!!!!!!!!!!!!!!! ★★★★★★-->
<script type="text/javascript">
   $(document).ready(function() {
      
      $('#follow').click(function() {
         var userNo  = ${userVO.no};
         var receipeUserNo = ${recipe.userNo};
         var followData = $('#follow').attr('class');
         var followText = $('#follow').text();
          
         var data = {}
          data["userNo"] = ${userVO.no};
          data["receipeUserNo"] = ${recipe.userNo};
          
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

         <hr>
         <br> <br>
         <c:if test="${ recipe.userNo eq userVO.no }">
         <button type="button"
            onclick="location.href='${pageContext.request.contextPath}/recipe/update?no=${recipe.no}&page=${fCri.page}&numPerPage=${fCri.numPerPage}&findType=${fCri.findType }&keyword=${fCri.keyword }'">수정</button>
         &nbsp;&nbsp;
         <button type="button"
            onclick="location.href='${pageContext.request.contextPath}/recipe/delPage?no=${recipe.no}&page=${fCri.page}&numPerPage=${fCri.numPerPage}&findType=${fCri.findType }&keyword=${fCri.keyword }'">삭제</button>
         &nbsp;&nbsp;
         </c:if>
      
         <button type="button"
            onclick="location.href='${pageContext.request.contextPath}/recipe/recipeList?page=${fCri.page}&numPerPage=${fCri.numPerPage}&findType=${fCri.findType }&keyword=${fCri.keyword }'">목록</button>
         &nbsp;&nbsp;<br> <br> <br> <br>
         <hr>
      </div>
   </section>

   <footer><jsp:include
         page="/WEB-INF/views/jsp/include/footer.jsp" /></footer>


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


</body>
</html>
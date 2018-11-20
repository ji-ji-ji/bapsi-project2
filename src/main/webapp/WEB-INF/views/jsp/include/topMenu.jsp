<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta name="description" content="">
<title>topMenu</title>

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
<!-- 드롭박스 추가 -->   
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/ddmenu.css" type="text/css">
<!-- 자도완성 기능 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/autocomplete/css/jquery-ui.css" type="text/css">

   

<script src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
<!-- 자동완성 기능 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/autocomplete/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/autocomplete/js/jquery-ui.js"></script>

<script src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/parallax/jarallax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/viewportchecker/jquery.viewportchecker.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>
<!-- 드롭박스 추가  -->
<script src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/ddmenu.js"></script>


<style>
   
   @media ( min-width :576px) {
      #extra {
         max-width: 920px;
         margin: 1.75rem auto
      }
      .modal-dialog-centered {
         min-height: calc(100% - ( 1.75rem * 2))
      }
      .modal-sm {
         max-width: 300px
      }
   }
   
   @media ( min-width :576px) {
      .whatIngredient {
         width:458px;
      }
   }
   
   
   .inner > li {
      padding:0;
   }
   
   .field1 {
      float:left;
   }
   
   .field1 > ul {
      border : 1px solid #a73f40;
      background-attachment: scroll;
      height:270px;
      overflow-x:hidden;
      overflow-y:visible;
      list-style:none;
      float:left;
   }
   
   .big_wrap {
      width:190px;
      padding:0;
      margin-right:9px;
   }
   
   .big_wrap > li {
      font-size:15px;
      border-bottom:1px solid #dddddd;
      padding-left:18px;
      cursor:pointer;
      
   }
   
   .big_wrap > li > a {
      line-height:44px;
      color:#565656;
   }
   
   .IngredientSearch {
      
      margin-bottom : 9px;
   }
   
   .small_wrap {
      width:396px;
      padding:0;
      margin-right:9px;
      box-sizing:border-box;
   }
   
   .small_wrap > li {
      font-size:15px;
      border-bottom:1px solid #dddddd;
      padding-left:18px;
      cursor:pointer;
   }
   
   .small_wrap > li > a {
      line-height:44px;
      color:#565656;
   }
   
   .whatIngredient{
        background-color: #f5f5f5; 
        line-height: 1.43; 
        padding: 1.07em .5em; 
        border: 1px solid #e8e8e8; 
        border-radius: .25rem; 
        color: #565656; 
     }
  
     .search2{
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
     }
     
     .field2 {
        width:280px;
        float:right;
     }
     
     .field2 > dl {
        border:1px solid #a73f40;
        background:#fff;
        position:relative;
        
     }
     
     .field2 > dl > dt {
        height:59px;
        color:#565656;
        font-size:20px;
        padding:10px 15px;
        box-sizing:border-box;
        border-bottom:1px solid #dddddd;
        text-align: center;
     }
     
     .field2 > dl > dd {
        height:268px;
        box-sizing : border-box;
     }
     
     .field2 > dl > dd > ul {
        list-style:none;
        height:205px;
        padding:12px 0;
        overflow-x:hidden;
        overflow-y:visible;
        box-sizing:border-box;
     }
     
     .field2 > dl > dd > ul > li.select_Ingredients {
        float:none;
        font-size:17px;
        color:#b7b7b7;
        text-align:center;
        margin-top:80px;
        padding:0;
     }
     
     .field2 > dl > dd > .btn {
        position:absolute;
        left:0;
        right:0;
        bottom:0;
        padding:12px 16px;
        background-color:#fff;
     }
     
     .field2 > dl > dd > .btn > button {
        width:194px;
        height:48px;
        background-color: #c12048 !important;
        border-color: #c12048 !important; 
        color: #ffffff !important;
        line-height: 1.43;
        border-radius: .25rem;
        cursor: pointer;
        letter-spacing: 1px; 
        border: 1px solid transparent;
     }
     
    #head {
      display: inline;
      text-align:center;
      -webkit-box-align: start;
      -ms-flex-align: start;
      align-items: flex-start;
      -webkit-box-pack: justify;
      -ms-flex-pack: justify;
      justify-content: space-between;
      padding: 1rem;
      border-bottom: 1px solid #e9ecef;
      border-top-left-radius: .3rem;
      border-top-right-radius: .3rem
   }
     
</style>
<!-- 카테고리 ajax -->
<script type="text/javascript">
   $(function () {
      
      $('.column').each(function() {
         var column = $(this);
         var query = $(this).find('h3').text();
         console.log(query);
         
            $.ajax({
               url : "${pageContext.request.contextPath}/recipe/getCategoryNames",
               data : {"type" : query},
               method : "post",
               success:function(result) {
                  //alert("통신 성공 : " + JSON.stringify(result));
                  
               var tagInsert = "";
               $.each(result, function(i, TagVO) {
                  tagInsert += '<li><input type="checkbox" name="chk-situ" value="1" />'+ TagVO["tagName"] +'</li>'
               });
               
               column.html(column.html()+tagInsert);
                  
               },
               error: function(xhr, status, error) {
                  alert("에러발생. status : " + status + ", xhr : " + xhr + ", error : " + error);   
               }
            })
      })
   });
</script>
<script>
	
	$(".close").on("click", function() {
	    $(".modal-dialog").close();
	});

	var availableTags = [];       
    var selectIngredientsName=[];
    
    function ajaxIngredientsName(Type){
       
       $.ajax({
             url:"${pageContext.request.contextPath}/ingredientsName",
             method:"get",
             data:{"Type":Type},
             success:function(ingredientsNameList){
                var ingredientsNameInsert = "";
                availableTags = [];
                 $.each(ingredientsNameList, function(i, name){
                       availableTags.push(name);
                         ingredientsNameInsert += '<li><a class="ingredientsName" href="#">'+name+'</a></li>';
                      })
                      
                      $("#small_wrap").html(ingredientsNameInsert);
                      
                      
                      $('.ingredientsName').bind('click', function(){
                         var selected = $(this).text();
                         var selectIngredientsNameInsert = "";
                         if(selectIngredientsName.indexOf(selected) == -1){
                            selectIngredientsName.push(selected);
                            selectIngredientsNameInsert += '<div><input type="button" id ="selectedName" value="'+$(this).text()+'"/></div>';
                            
                            if($("#select_Ingredients").text() == '재료를 선택해주세요.') {
                             console.log('재료를 선택해주세요 없앰')
                             $("#select_Ingredients").empty();
                            }
                            $("#select_Ingredients").append(selectIngredientsNameInsert);
                         }else{
                            alert("이미 선택한 재료입니다.");
                         }
                         
                       });
                  }
                })
    }

      $(function(){
         // 전체 타입 얻어오기
          $.ajax({
             url:"${pageContext.request.contextPath}/ingredientsType",
             method:"get",
             success:function(ingredientsTypeList){
                var ingredientsTypeInsert = "";
                $.each(ingredientsTypeList, function(i, type){
                   ingredientsTypeInsert += '<li><a class="ingredientsType" href="#">'+type+'</a></li>';
                })
                
                $("#big_wrap").html(ingredientsTypeInsert);   
                
                // 타입을 클릭하면 해당 타입의 재료 얻어와서 보여주기
                $('.ingredientsType').bind('click', function(){
                   ajaxIngredientsName($(this).text());
                   
                   }); 
                
             }
          })
          
          // 전체 재료 얻어오기
          ajaxIngredientsName(null);
          
          $('#Modals').on('shown.bs.modal',function(){
             $( "#thisIngredients" ).autocomplete({
                 source: availableTags
               },'appendTo','#Modals');
          })
       })
       
</script>


</head>
<body>

	<div class="modal fade" id="Modals">
		<div class="modal-dialog" id="extra">
		      <!--close 버튼  -->
         <button type="button" class="close" aria-label="Close">&times;</button>
         
			<div class="modal-content">
				<div class="modal-header" id="head">
					<h2 style="color: #c12048;">내가 가진 재료로 레시피 추천받자!</h2>
				</div>
				<div class="modal-body">
					<section class="recomand">
						<div class="inner">
							<form class="mbr-form" action="" method="get"
								data-form-title="Mobirise Form">
								<fieldset class="field1">
									<div class="IngredientSearch ui-front">
										<label for="thisIngredients"></label> <input
											class="whatIngredient" id="thisIngredients"
											placeholder="재료명으로 검색해보세요" />
										<button class="search2" id="">담기</button>
									</div>
									<ul class="big_wrap" id="big_wrap">

									</ul>

									<ul class="small_wrap" id="small_wrap">

									</ul>
								</fieldset>

								<fieldset class="field2">
									<dl>
										<dt>
											<h3>내가 선택한 재료</h3>
										</dt>
										<dd>
											<ul>
												<li class="select_Ingredients" id="select_Ingredients">재료를
													선택해주세요.</li>
											</ul>
											<div class="btn">
												<button type="submit">이 재료로 추천받기</button>
											</div>
										</dd>
									</dl>
								</fieldset>
							</form>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>

	<section class="menu cid-r4OiAWAZRu" once="menu" id="menu2-0">



      <nav
         class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
         <button class="navbar-toggler navbar-toggler-right" type="button"
            data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <div class="hamburger">
               <span></span> <span></span> <span></span> <span></span>
            </div>
         </button>
         <div class="menu-logo">
            <div class="navbar-brand">
               <span class="navbar-logo"> <a
                  href="${pageContext.request.contextPath}"> <img
                     src="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png"
                     alt="Mobirise" title="" style="height: 5.9rem;">
               </a>
               </span> <span class="navbar-caption-wrap"><a
                  class="navbar-caption text-secondary display-4"
                  href="${pageContext.request.contextPath}">Bapsi</a></span>
            </div>
         </div>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <c:if test="${not empty userVO}">
               <b style="color: red">${userVO.nickname}(${userVO.email})</b>님 환영합니다.
                 </c:if>

				<ul class="navbar-nav nav-dropdown nav-right"
					data-app-modern-menu="true">
					<li class="nav-item"><a
						class="nav-link link text-black display-5" href="#"
						data-toggle="modal" data-target="#Modals"><span
							class="mbrib-smile-face mbr-iconfont mbr-iconfont-btn"
							title="있는 재료로 추천받기"></span></a></li>
							
					<li class="nav-item"><a
						class="nav-link link text-black display-5"
						href="${pageContext.request.contextPath}/recipe/new"><span
							class="mbri-plus mbr-iconfont mbr-iconfont-btn"
							title="내 레시피 등록하기"></span></a></li>
					<li class="nav-item dropdown open"><a
						class="nav-link link text-black dropdown-toggle display-5" href=""
						data-toggle="dropdown-submenu" aria-expanded="true"><span
							class="mbri-users mbr-iconfont mbr-iconfont-btn"></span></a>

						<div class="dropdown-menu">
							<c:choose>
								<c:when test="${empty userVO}">
									<a class="text-black dropdown-item display-5"
										href="${pageContext.request.contextPath}/login">로그인</a>
								</c:when>
								<c:when test="${0 ne userVO.socialLogin}">
									<a class="text-black dropdown-item display-5"
										href="${pageContext.request.contextPath}/logout">로그아웃</a>
									<!--                               href="#" onclick='signOut()'>로그아웃</a> -->
									<a class="text-black dropdown-item display-5"
										href="${pageContext.request.contextPath}/mypage"
										aria-expanded="false">마이페이지</a>
								</c:when>
								<c:otherwise>
									<a class="text-black dropdown-item display-5"
										href="${pageContext.request.contextPath}/logout">로그아웃</a>
									<!--                               href="#" onclick='signOut()'>로그아웃</a> -->
									<a class="text-black dropdown-item display-5"
										href="${pageContext.request.contextPath}/mypage"
										aria-expanded="false">마이페이지</a>
								</c:otherwise>
							</c:choose>
							<c:if test="${userVO.type == 'S'}">
								<a class="text-black dropdown-item display-5"
									href="${pageContext.request.contextPath}/list"
									aria-expanded="false">회원목록</a>
							</c:if>
						</div></li>
				</ul>

			</div>
      </nav>
   </section>

   <section class="engine">
      <a href="https://mobiri.se/q">responsive website templates</a>
   </section>

	<section class="mbr-section content8 cid-r4OiCHvuLI" id="content8-2">
		<div class="container">
			<div class="media-container-row title">
				<div class="col-10 col-xl-12">
					<div class="mbr-section-btn align-center">

						<nav id="ddmenu">
							<div class="menu-icon"></div>
							<ul>
								<li class="full-width"><span class="top-heading">&nbsp;&nbsp;&nbsp;카테고리&nbsp;&nbsp;&nbsp;</span>
									<i class="caret"></i>&nbsp;&nbsp;&nbsp;

									<div class="dropdown">
										<form
											action="${pageContext.request.contextPath}/recipe/recipeTagList"
											method="post">
											<div class="dd-inner" id="checkboxArea">
												<ul class="column" id="col-si">
													<li><h3>상황별 요리</h3></li>
													<!--                                  <li><input type="checkbox" name="chk-situ" value="1" />&nbsp;간식/야식</li> -->
													<!--                                  <li><input type="checkbox" name="chk-situ" value="2" />&nbsp;술안주</li> -->
													<!--                                  <li><input type="checkbox" name="chk-situ" value="3" />&nbsp;해장요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-situ" value="4" />&nbsp;손님 접대 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-situ" value="5" />&nbsp;나들이 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-situ" value="6" />&nbsp;파티/명절요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-situ" value="7" />&nbsp;실생활 요리</li> -->
												</ul>
												<ul class="column" id="col-co">
													<li><h3>나라별 요리</h3></li>
													<!--                                  <li><input type="checkbox" name="chk-nati" value="8" />&nbsp;한식 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-nati" value="9" />&nbsp;중식 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-nati" value="10" />&nbsp;일식 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-nati" value="11" />&nbsp;동남아/인도 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-nati" value="12" />&nbsp;멕시칸 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-nati" value="13" />&nbsp;양식 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-nati" value="14" />&nbsp;퓨전 요리</li> -->
												</ul>
												<ul class="column col-in">
													<li><h3>재료별 요리</h3></li>
													<!--                                  <li><input type="checkbox" name="chk-ingr" value="15" />&nbsp;육류 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-ingr" value="16" />&nbsp;채소류 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-ingr" value="17" />&nbsp;해산물 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-ingr" value="18" />&nbsp;콩/두부 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-ingr" value="19" />&nbsp;과일 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-ingr" value="20" />&nbsp;달걀/유제품 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-ingr" value="21" />&nbsp;면/만두 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-ingr" value="22" />&nbsp;김치 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-ingr" value="23" />&nbsp;제철재료 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-ingr" value="24" />&nbsp;가공식품 요리</li> -->
												</ul>
												<ul class="column col-re">
													<li><h3>조리법별 요리</h3></li>
													<!--                                  <li><input type="checkbox" name="chk-cook" value="25" />&nbsp;밥 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-cook" value="26" />&nbsp;면 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-cook" value="27" />&nbsp;국물 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-cook" value="28" />&nbsp;찜/조리/구이 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-cook" value="29" />&nbsp;볶음/튀김/부침 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-cook" value="30" />&nbsp;나물/샐러드 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-cook" value="31" />&nbsp;김장/절임 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-cook" value="32" />&nbsp;베이킹/디저트 요리</li> -->
													<!--                                  <li><input type="checkbox" name="chk-cook" value="33" />&nbsp;양념/소스/잼</li> -->
													<!--                                  <li><input type="checkbox" name="chk-cook" value="34" />&nbsp;음료/차/커피</li> -->
												</ul>
												<!-- <ul class="column mayHide">
                                 <li><br /><img src="ddmenu/img1.jpg" /></li>
                             </ul> -->
											</div>
											<input type="submit" value="검색하기" id="getCheckedAll"
												class="btn btn-secondary btn-sm">
											<!--                            <!-- <input type="button" value="getall" id="getCheckedAll"> -->
											<!-- <input type="hidden" id="splitCode" name="splitCode" value="A,C,D" />  -->
										</form>
									</div></li>
								<li class="no-sub"><a class="top-heading"
									href="${pageContext.request.contextPath}/recipe/recipeTagList?TagName=야식">&nbsp;&nbsp;야식&nbsp;&nbsp;</a></li>
								<li class="no-sub"><a class="top-heading"
									href="${pageContext.request.contextPath}/ranking/rankingMain">&nbsp;&nbsp;랭킹&nbsp;&nbsp;</a></li>
								<li class="no-sub"><a class="top-heading"
									href="${pageContext.request.contextPath}/recipe/recipeList">&nbsp;&nbsp;전체
										레시피&nbsp;&nbsp;</a></li>
								<li class="no-sub"><a class="top-heading"
									href="${pageContext.request.contextPath}/youtuber">&nbsp;&nbsp;유튜버
										먹방&nbsp;&nbsp;</a></li>
							</ul>
						</nav>

					</div>
				</div>
			</div>
		</div>
	</section>


</body>
    
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>배꼽시계</title>
<!-- summernote -->
<!-- <script src = "http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- <!-- include libraries(jQuery, bootstrap) --> -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> -->
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> -->
<!-- <!-- include summernote css/js--> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js" defer></script> -->
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet"> -->
<!-- <!-- summer note korean language pack --> -->
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script> 
</head>
<body>
<!-- header -->
<div class="modal-header">
    <!-- 닫기(x) 버튼 -->
  <button type="button" class="close" data-dismiss="modal">×</button>
  <!-- header title -->
  <h4 class="modal-title">Header</h4>
</div>
<!-- body -->
<div class="modal-body">
    <textarea id="my-summernote" name="content"></textarea>
</div>
<!-- Footer -->
<div class="modal-footer">
    Footer
  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>
</body>
<!-- summernote -->
<script type="text/javascript">
//     $(document).ready(function() {
//       $('#my-summernote').summernote({
//         height: 300,
//         minHeight: null,
//         maxHeight: null,
//         lang: 'ko-KR',
//         placeholder: '조리과정을 입력하세요',
//         callbacks: {
//           onImageUpload: function(files, editor, welEditable) {
//             for (var i = files.length - 1; i >= 0; i--) {
// //             	alert('test1');
//               sendFile(files[i], this);
//             }
//           }
//         }
//       });
//     });
    
    function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('recipeImg', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '${pageContext.request.contextPath}/recipe/insertImg',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
//         	alert('test2:'+url);
          $(el).summernote('editor.insertImage', '${pageContext.request.contextPath}/'+url);
//           alert('test3:'+url);
          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        },
        error:function(){
        	alert('ajax error');
        }
      });
    }
</script>
</html>
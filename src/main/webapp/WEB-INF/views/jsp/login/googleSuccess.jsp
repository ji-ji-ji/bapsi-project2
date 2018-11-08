<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
/* $(document).ready(function(){
 function onSignIn(googleUser) { 
	  var profile = googleUser.getBasicProfile();
	  console.log('이거는 새 ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  var gname = profile.getName();
	  var gemail = profile.getEmail();
	  
	  location.href="${pageContext.request.contextPath}/googleSuccess?gname="+gname+"&gemail="+gemail;
	} */

 	alert('구글로그인이 완료되었습니다.')
	location.href = "${pageContext.request.contextPath}/"


</script>
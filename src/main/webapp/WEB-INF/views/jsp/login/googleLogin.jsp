<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="1010391818469-ir3v0jfbb7aamt0u5j36pppmobug85me.apps.googleusercontent.com">
<script>
/* $(document).ready(function(){ */
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
}
	  var gemail = profile.getEmail();
	  location.href="${pageContext.request.contextPath}/googleSuccess?gname="+gname+"&gemail="+gemail;
	  
/* 	}); */
</script>

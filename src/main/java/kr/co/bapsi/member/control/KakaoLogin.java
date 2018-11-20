package kr.co.bapsi.member.control;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.bapsi.member.vo.UserVO;

public class KakaoLogin {
   public static JsonNode getAccessToken(String autorize_code) {
      final String RequestUrl = "https://kauth.kakao.com/oauth/token";

      final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
      postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
      postParams.add(new BasicNameValuePair("client_id", "f411cad21142d14e0d64c52c74235f62")); // REST API KEY
      postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8000/bapsi/kakaoLogin")); // 리다이렉트 URI
      postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값

      final HttpClient client = HttpClientBuilder.create().build();
      final HttpPost post = new HttpPost(RequestUrl);
      JsonNode returnNode = null;

      try {
         post.setEntity(new UrlEncodedFormEntity(postParams));
         final HttpResponse response = client.execute(post);
         final int responseCode = response.getStatusLine().getStatusCode();

         System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
         System.out.println("Post parameters : " + postParams);
         System.out.println("Response Code : " + responseCode);

         // JSON 형태 반환값 처리
         ObjectMapper mapper = new ObjectMapper();
         returnNode = mapper.readTree(response.getEntity().getContent());

      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      } catch (ClientProtocolException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         // clear resources
      }

      return returnNode;

   }
   
   public static JsonNode agreeEmail(String autorize_code) {
      final String RequestUrl = "https://kauth.kakao.com/oauth/authorize";

      final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
//      postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
      postParams.add(new BasicNameValuePair("client_id", "737b9d433050d8163005456b02b4e952")); // REST API KEY
      postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8000/bapsi/kakaoLogin")); // 리다이렉트 URI
      postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값
      postParams.add(new BasicNameValuePair("response_type", "code"));
      postParams.add(new BasicNameValuePair("scope", "account_email,age_range,birthday,gender"));
      

      final HttpClient client = HttpClientBuilder.create().build();
      final HttpGet get= new HttpGet(RequestUrl);
      JsonNode returnNode = null;

      try {
         ((HttpResponse) get).setEntity(new UrlEncodedFormEntity(postParams));
         final HttpResponse response = client.execute(get);
         final int responseCode = response.getStatusLine().getStatusCode();

         System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
         System.out.println("Post parameters : " + postParams);
         System.out.println("Response Code : " + responseCode);

         // JSON 형태 반환값 처리
         ObjectMapper mapper = new ObjectMapper();
         returnNode = mapper.readTree(response.getEntity().getContent());

      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      } catch (ClientProtocolException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         // clear resources
      }

      return returnNode;

   }
   

   public static JsonNode getKakaoUserInfo(String autorize_code) {

      final String RequestUrl = "https://kapi.kakao.com/v2/user/me";

      final HttpClient client = HttpClientBuilder.create().build();
      final HttpGet post = new HttpGet(RequestUrl);

      // add header
      post.addHeader("Authorization", "Bearer " + autorize_code);

      JsonNode returnNode = null;

      try {
         final HttpResponse response = client.execute(post);
         final int responseCode = response.getStatusLine().getStatusCode();

         System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
         System.out.println("Response Code : " + responseCode);

         // JSON 형태 반환값 처리
         ObjectMapper mapper = new ObjectMapper();
         returnNode = mapper.readTree(response.getEntity().getContent());

      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      } catch (ClientProtocolException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         // clear resources
      }
      return returnNode;

   }

   public static UserVO changeData(JsonNode userInfo) {
      UserVO vo = new UserVO();

      vo.setUser_snsId(userInfo.path("id").asText()); // id -> vo 넣기

      if (userInfo.path("kaccount_email_verified").asText().equals("true")) { // 이메일 받기 허용 한 경우
         vo.setUser_email(userInfo.path("kaccount_email").asText()); // email -> vo 넣기

      } else { // 이메일 거부 할 경우 코드 추후 개발

      }

      JsonNode properties = userInfo.path("properties"); // 추가정보 받아오기
      if (properties.has("nickname"))
         vo.setUser_name(properties.path("nickname").asText());
         vo.setUser_profileImagePath(properties.path("profile_image").asText());
      return vo;
   }
}
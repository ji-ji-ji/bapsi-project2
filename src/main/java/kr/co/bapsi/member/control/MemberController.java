package kr.co.bapsi.member.control;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.bapsi.mail.Email;
import kr.co.bapsi.mail.EmailSender;
import kr.co.bapsi.member.service.MemberService;
import kr.co.bapsi.member.vo.FindCriteria;
import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.member.vo.PagingMaker;
import kr.co.bapsi.upload.vo.UploadVO;
@Controller
public class MemberController {

   /* NaverLoginBO */
   private NaverLoginBO naverLoginBO;
   private String apiResult = null;
   // ************************Email 인증 시작**************************
   @Autowired
   private EmailSender emailSender;

   @Autowired
   private Email emailVO;

   // 랜덤값함수 위에 넣어준다.
   Random random = new Random();
   // ************************Email 인증 끝 **************************

   // *********************** 구글로그인 인증 **************************
   /* GoogleLogin */
   @Autowired
   private GoogleConnectionFactory googleConnectionFactory;
   @Autowired
   private OAuth2Parameters googleOAuth2Parameters;
   // ***********************구글로그인끝**************************

   @Autowired
   private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
      this.naverLoginBO = naverLoginBO;
   }

   ModelAndView mav = new ModelAndView();

   @Resource(name = "uploadPath")
   String uploadPath;

   @Inject
   private MemberService memberService;
   private OAuth2Operations oauthOperations;

// *******************회원가입 **************************
   // 회원가입
   @RequestMapping(value = "/join", method = RequestMethod.GET)
   public String join() {

      return "jsp/member/join";
   }

   // 회원가입 : alert창 띄우는 회원가입 창
   @RequestMapping(value = "/join/process", method = RequestMethod.POST)
   public String joinProcess(MemberVO member) throws Exception {

      memberService.join(member);

      return "jsp/member/joinCome";
   }

   // 이메일 중복 체크
   @RequestMapping(value = "/check/email")
   @ResponseBody
   public Map<Object, Object> checkEmail(@RequestBody String email) throws Exception {

      int count = 0;

      Map<Object, Object> map = new HashMap<Object, Object>();

      count = memberService.checkEmail(email);

      map.put("cnt", count);

      return map;
   }

   // 닉네임 중복 체크
   @RequestMapping(value = "/check/nickname")
   @ResponseBody
   public Map<Object, Object> checkNickname(@RequestBody String nickname) throws Exception {

      int count = 0;

      Map<Object, Object> map = new HashMap<Object, Object>();

      count = memberService.checkNickname(nickname);

      map.put("cnt", count);

      return map;

   }

// ****************************************************

//**************************마이페이지*******************************

   // 회원정보조회(마이페이지)
      @RequestMapping(value = "/mypage")
      public String myPage(HttpSession session, Model model) throws Exception {

         MemberVO authUser = (MemberVO) session.getAttribute("userVO");

         /*MemberVO member = memberService.myPage(authUser.getNo());*/
         MemberVO member =memberService.apiMemSelect(authUser.getEmail());
         UploadVO upload = memberService.myPagefile(authUser.getNo());

         model.addAttribute("member", member);
         model.addAttribute("upload", upload);
         System.out.println(member);
         return "jsp/member/myPage";
      }

   // 회원정보수정
   @RequestMapping(value = "/mypage/update", method = RequestMethod.GET)
   public String memberUpdate(Model model, HttpSession session) throws Exception {

      MemberVO authUser = (MemberVO) session.getAttribute("userVO");
      
//      MemberVO member = memberService.myPage(authUser.getNo());
      //로그인 API를 위한 설정
      MemberVO member = memberService.loginMyPage(authUser.getEmail());
      System.out.println("가져온 값"+member);
      UploadVO upload = memberService.myPagefile(authUser.getNo());
      

      model.addAttribute("member", member);
      model.addAttribute("upload", upload);

      return "jsp/member/updateForm";
   }

   @RequestMapping(value = "/update", method = RequestMethod.POST)
   public String update(MemberVO member) throws Exception {

      memberService.update(member);

      return "jsp/member/updateCome";
   }

   // 회원탈퇴
      @RequestMapping("/selfdelete")
      public String selfDelete(HttpSession session, UploadVO upload) throws Exception {
         
         System.out.println("selfdelete 접근 했습니다.");
         MemberVO authUser = (MemberVO) session.getAttribute("userVO");
         System.out.println(authUser.getNo());
         /*memberService.selfDelete(authUser.getNo());*/
         System.out.println(authUser.getFile_fakename());

         if(authUser.getFile_fakename() == null) {
            memberService.selfDelete(authUser.getNo());
            
            session.invalidate();
            
            System.out.println("뭔데 시발 이게 있냐고 : " + authUser.getFile_fakename());
            
            return "jsp/member/deleteCome";
            
            } else {
               upload = memberService.detailProfile(authUser.getNo());
               
               String path = "";
         
               String profile = "/" + upload.getFile_fakename();
         
               path = uploadPath + profile;

               File file = new File(path);
         
               if (file.exists() == true) {
         
                     file.delete();
               }
               
               memberService.selfDelete(authUser.getNo());
               memberService.profileDelete(authUser.getNo());
               
         
               session.removeAttribute(profile);
               session.invalidate();
               
               return "jsp/member/deleteCome";
         }
         
         
        /* if(upload.getFile_fakename() != null) {
            
            System.out.println("파일 fakename : " + upload.getFile_fakename());
      
            String path = "";
      
            String profile = "/" + upload.getFile_fakename();
      
            path = uploadPath + profile;
      
            System.out.println("삭제할 파일 경로 : " + path);
      
            File file = new File(path);
      
            if (file.exists() == true) {
      
                  file.delete();
            }
      
            memberService.profileDelete(authUser.getNo());
            
      
            session.removeAttribute(profile);
            session.invalidate();
         } else {
           memberService.selfDelete(authUser.getNo());
            session.invalidate();
         }*/
         
         
         
         
         
      }

   // id(email) 찾기??
   @RequestMapping("/find/email")
   public ModelAndView findEmail() {

      return mav;
   }

   // 비밀번호 찾기
   @RequestMapping("/find/password")
   public ModelAndView findPassword() {

      return mav;
   }

// *******************************************************************************

//****************회원목록(관리자) 관련 메소드******************

   /*
    * @RequestMapping(value = "/list") public String adminMlist(Model model,
    * MemberVO member, PageCriteria pCri) throws Exception {
    * 
    * // controller -> service -> dao 요청 // List<MemberVO> list =
    * memberService.memberList(); // model.addAttribute("list", list);
    * 
    * model.addAttribute("list", memberService.pagingCriteria(pCri)); PagingMaker
    * pagingMaker = new PagingMaker(); pagingMaker.setCri(pCri);
    * 
    * // pagingMaker.setTotalData(255); //int형으로 데이터를 몇 개 받을 지 여기서 정한다.!! 또는 전체
    * 데이터를 가르킨다.!! pagingMaker.setTotalData(memberService.pagingCountData(pCri));
    * model.addAttribute("pagingCountData",memberService.pagingCountData(pCri));
    * 
    * // 뷰페이지에 보일 수 있게 공유영역에 올리는 거다!! model.addAttribute("pagingMaker",
    * pagingMaker);
    * 
    * return "jsp/admin/memberList"; }
    */
   // 회원목록 페이지 - 검색기능 구현 및 페이징(위에꺼 업그레이드 버전)
   @RequestMapping(value = "/list")
   public String adminMlist(Model model, MemberVO member, FindCriteria fCri) throws Exception {

      // controller -> service -> dao 요청
//        List<MemberVO> list = memberService.memberList();
//        model.addAttribute("list", list);

      model.addAttribute("list", memberService.listFind(fCri));
      PagingMaker pagingMaker = new PagingMaker();
      pagingMaker.setCri(fCri);

//     pagingMaker.setTotalData(255);  //int형으로 데이터를 몇 개 받을 지 여기서 정한다.!! 또는 전체 데이터를 가르킨다.!!
      pagingMaker.setTotalData(memberService.findCountData(fCri));
      model.addAttribute("findCountData", memberService.findCountData(fCri));

      // 뷰페이지에 보일 수 있게 공유영역에 올리는 거다!!
      model.addAttribute("pagingMaker", pagingMaker);

      return "jsp/admin/memberList";
   }

   // 회원상세보기 페이지
   @RequestMapping(value = "/list/detail/{no}")
   public String memberView(@PathVariable("no") int no, Model model) {

      // 회원 정보를 model에 저장
      MemberVO member = memberService.detailMember(no);
      UploadVO upload = memberService.detailProfile(no);

      model.addAttribute("member", member);
      model.addAttribute("upload", upload);

      return "jsp/admin/memberDetail";
   }

   // 관리자 회원 수정
   @RequestMapping(value = "/{no}/mypage/update", method = RequestMethod.GET)
   public String memberUpdate(@PathVariable("no") int no, Model model) throws Exception {

      MemberVO member = memberService.detailMember(no);
      UploadVO upload = memberService.detailProfile(no);

      model.addAttribute("member", member);
      model.addAttribute("upload", upload);

      return "jsp/admin/memberUpdateForm";
   }

   @RequestMapping(value = "/updatecomplete", method = RequestMethod.POST)
   public String UpdateComplete(MemberVO member) throws Exception {

      memberService.memberUpdate(member);

      return "jsp/admin/memberUpdateCome";
   }

   // 강퇴(관리자모드)
   @RequestMapping("/{no_pv}/adminDelete")
   public String Delete(@PathVariable("no_pv") int no, UploadVO upload, HttpSession session) throws Exception {
      System.out.println("강퇴(관리자 모드) 들어옴");
      
      
      System.out.println("if문 들어가기전 : " + upload.getFile_fakename());
      
      MemberVO member = memberService.detailMember(no);
      
      System.out.println("member file_fakename 받아 오니 ? :" + member.getFile_fakename());
      
      if(member.getFile_fakename() == null) {
         
         memberService.deleteMember(no);
         
         return "jsp/admin/adminDelete";
      
      } else {
         
         upload = memberService.detailProfile(no);
         
         System.out.println("adminDelete 에서의 : " + upload.getFile_fakename());
         
         
         System.out.println("파일 fakename : " + upload.getFile_fakename());
   
         String path = "";
   
         String profile = "/" + upload.getFile_fakename();
   
         path = uploadPath + profile;
   
         System.out.println("삭제할 파일 경로 : " + path);
   
         File file = new File(path);
   
         if (file.exists() == true) {
   
            file.delete();
         }
         
         memberService.deleteMember(no);
         memberService.deleteMemberProfile(no);
         
         return "jsp/admin/adminDelete";
      }
   }

   // 검색기능 구현

// **********************************************************
   // ************************ 로그인 *******************************

   // 네이버 로그인 api+구글로그인+카카오 로그인
   @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
   public String login(Model model, HttpSession session) {
      /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      // https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
      // redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
      System.out.println("네이버:" + naverAuthUrl);
      // 네이버
      model.addAttribute("url", naverAuthUrl);
      // 구글 추가 !!!!
      // url값을 넘겨주는 것,
      OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
      String googleUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
      System.out.println("구글:" + googleUrl);
      model.addAttribute("google_url", googleUrl);
   
      // 카카오 url 값 넘겨주는 것 추가 !!
      String kakaoUrl = "";

      System.out.println(kakaoUrl);
      model.addAttribute("kakao_url", kakaoUrl);
      return "jsp/login/login";
   }
   // **************************카카오 로그인**********************************

   @RequestMapping(value = "/kakaoLogin", method = { RequestMethod.GET, RequestMethod.POST })
   public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      System.out.println("카카오 로그인 진입확인!!!!!!!!!!!!!!!!");

      JsonNode token = KakaoLogin.getAccessToken(code);
      System.out.println();
      //JsonNode result = KakaoLogin.agreeEmail(code);
      //System.out.println("동의?:"+result.toString());
      JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
      System.out.println("프로필이 뭘까요? :" + profile);

      System.out.println("id:"+profile.get("id"));
      //System.out.println("nick:"+profile.get("properties").get("nickname"));
      System.out.println("email:"+profile.get("kakao_account").get("has_email"));
      
      
      // *********VO를 따로 만들거기에 별로 상관없을 것 같다.*****************************
//        UserVO vo = KakaoLogin.changeData(profile);
//        vo.setUser_snsId("k"+vo.getUser_snsId());
//
//        System.out.println("session값을 찍어봅시다"+session);
//        session.setAttribute("login", vo);
//        System.out.println("vo값을 가져옵시다"+vo.toString());
        //memberService.kakaoLogin(vo);

      // **********************************************************************
//      ObjectMapper mapper = new ObjectMapper();
////      System.out.println("profile as text:"+profile.asText());
////      System.out.println("profile tostring:"+profile.toString());
//      Map<String, Object> map = mapper.readValue(profile.toString(), new TypeReference<Map<String, Object>>() {});
//      Map<String, Object> mapResponse = (Map<String, Object>) map.get("properties");

//      String email = map.get("id")+"";
//      System.out.println("이메일 확인 "+ email);
//      String name = (String)mapResponse.get("nickname");
//      System.out.println("닉네임 확인" + name);
      return "jsp/login/kakaoLogin";
   }

   // *************************임지영1 구글로그인********************************
   @SuppressWarnings("unused")
   @RequestMapping(value = "/googleCallback", method = { RequestMethod.GET, RequestMethod.POST })
   public String googleCallback(HttpServletRequest request, Model model, HttpSession session) throws Exception {
      String code = request.getParameter("code");
      oauthOperations = googleConnectionFactory.getOAuthOperations();
      AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
            null);
      String accessToken = accessGrant.getAccessToken();
      Long expireTime = accessGrant.getExpireTime();
      System.out.println("나는 구글 콜백이다. accessToken" + accessToken);
      if (expireTime != null && expireTime < System.currentTimeMillis()) {
         accessToken = accessGrant.getRefreshToken();
         System.out.printf("액세스토큰 = {}", accessToken);

      }
      


      Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
      System.out.println("구글 커넷견 성공");
      Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
      System.out.println(connection);
      System.out.println("구글 커넷견 성공222");
   
      
      PlusOperations plusOperations = google.plusOperations();
      System.out.println("구글 들어올까?" + plusOperations );
      
      Person person = plusOperations.getGoogleProfile();
      System.out.println("구글 프로필을 못가져올까?  " + person);
      String nickname = person.getGivenName();
      System.out.println("닉네임: " + nickname);
      String name = person.getDisplayName();
      System.out.println("이름 가져올까 : " + name);
      String email = person.getDisplayName();
      System.out.println("email :"+ email);
      
      /*
       * MemberVO socialMember = new MemberVO(); int num = random.nextInt(89999999) +
       * 10000000; String password = "google" + Integer.toString(num);
       * socialMember.setPassword(password); socialMember.setEmail(email);
       * socialMember.setName(name); socialMember.setNickname(nickname);
       * socialMember.setSocialLogin(socialLogin);
       */

      MemberVO socialMember = null;
      socialMember = memberService.googleSelect(email);

      if (socialMember == null) {
         System.out.println("구글 VO에 들엉오나 확인 ");
         socialMember = new MemberVO();

         socialMember.setEmail(email);
         socialMember.setName(name);
         socialMember.setNickname(nickname);
         socialMember.setGender("S");
         socialMember.setAge("나이대를 회원정보 수정을 통해 선택해주세요");
//         socialMember.setHintq("질문을 회원정보 수정을 통해 선택해주세요");
//         socialMember.setHinta("대답을 회원정보 수정을 통해 선택해주세요");
         socialMember.setTel("000-0000-0000");
         socialMember.setComments("할 말을 수정을 통해 선택해주세요");
         socialMember.setSocialLogin("G");
         memberService.joinGoogle(socialMember);
         System.out.println("VO에 닮겼나?" + socialMember.toString());
         session.setAttribute("userVO", socialMember);
         try {
            System.out.println("Closing Token....");
            String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
            URL url = new URL(revokeUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
               response.append(inputLine);
            }

            in.close();
         } catch (Exception e) {

            e.printStackTrace();
         }
         return "jsp/login/googleCallback";

      } else {
         session.setAttribute("userVO", socialMember);
         System.out.println("구글 여기에 오려나?");
         try {
            System.out.println("Closing Token....");
            String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
            URL url = new URL(revokeUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
               response.append(inputLine);
            }

            in.close();
         } catch (Exception e) {

            e.printStackTrace();
         }
         return "jsp/login/googleCallback";
      }

      /*
       * if (socialMember == null) { return "jsp/login/googleFail"; } else {
       * System.out.println(socialMember); int checkNum =
       * memberService.checkGoogleLogin(socialMember); if (checkNum == 0) {
       * System.out.println("checkNum 이 0일 때 " + socialMember); int checkGoogle =
       * memberService.checkGoogleLogin(socialMember);
       * System.out.println(checkGoogle+"체크구글"); if (checkGoogle != 0) {
       * session.setAttribute("userVO", socialMember); } else {
       * memberService.joinGoogle(socialMember); session.setAttribute("userVO",
       * socialMember); } } else { System.out.println("checkNum 이 1일 때 " +
       * socialMember); session.setAttribute("userVO", socialMember); }
       * 
       * // Access Token 취소
       * 
       * try { System.out.println("Closing Token...."); String revokeUrl =
       * "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + ""; URL
       * url = new URL(revokeUrl); HttpURLConnection conn = (HttpURLConnection)
       * url.openConnection(); conn.setRequestMethod("GET"); conn.setDoOutput(true);
       * 
       * BufferedReader in = new BufferedReader(new
       * InputStreamReader(conn.getInputStream(), "UTF-8")); String inputLine;
       * StringBuffer response = new StringBuffer(); while ((inputLine =
       * in.readLine()) != null) { response.append(inputLine); }
       * 
       * in.close(); } catch (Exception e) {
       * 
       * e.printStackTrace(); } return "jsp/login/googleCallback"; }
       */
   }

   // 로그인 콜백
   @SuppressWarnings({ "unchecked", "unused" })
   @RequestMapping(value = "/login/callback", method = { RequestMethod.GET, RequestMethod.POST })
   public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
         throws IOException {
      System.out.println("여기는 callback-");
      OAuth2AccessToken oauthToken;
      oauthToken = naverLoginBO.getAccessToken(session, code, state);
      // 로그인 사용자 정보를 읽어온다.
      apiResult = naverLoginBO.getUserProfile(oauthToken);
      System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
      model.addAttribute("result", apiResult);
      System.out.println("result" + apiResult);

      /* 네이버 로그인 성공 페이지 View 호출 */
      ObjectMapper mapper = new ObjectMapper();
      Map<String, Object> map = (Map<String, Object>) mapper.readValue(apiResult, HashMap.class);
      Map<String, Object> mapResponse = (Map<String, Object>) map.get("response");
      String email = (String) mapResponse.get("email");
      String name = (String) mapResponse.get("name");
      // String nickname = (String)mapResponse.get("nickname");
      System.out.println("email: " + email + "//" + session.getId());
      System.out.println("name: " + name);
      // System.out.println("nickname: " + nickname);

//      MemberVO userVO =new MemberVO();
      MemberVO userVO = null;
      try {
         userVO = memberService.apiMemSelect(email);
      } catch (Exception e) {
         e.printStackTrace();
      }
      // mvo.setNickname(nickname);

      if (userVO == null) {
         userVO = new MemberVO();
         userVO.setEmail(email);
         userVO.setName(name);
         userVO.setGender("S");
         userVO.setAge("나이대를 회원정보 수정을 통해 선택해주세요");
//         userVO.setHintq("질문을 회원정보 수정을 통해 선택해주세요");
//         userVO.setHinta("대답을 회원정보 수정을 통해 선택해주세요");
         userVO.setNickname("별병을 회원정보 수정을 통해 선택해주세요");
         userVO.setTel("000-0000-0000");
         userVO.setComments("할 말을 수정을 통해 선택해주세요");
         userVO.setSocialLogin("N");
         memberService.naverInsert(userVO);

         System.out.println("네이버 userVO를 확인하세요 " + userVO);
         session.setAttribute("userVO", userVO);
         return "jsp/login/callback";

      } else {
//         userVO.setEmail(email);
//         userVO.setName(name);
//         userVO.setGender("남");
         session.setAttribute("userVO", userVO);
         System.out.println("네이버 userVO 집어넣장!!" + userVO);
         return "jsp/login/callback";

      }
   }
   // alert 창 띄어주는 직적만든 로그인
   @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
   public String loginCheck(@ModelAttribute("member") MemberVO member, Model model, HttpSession session)
         throws Exception {

      // 로그인 시작
      /* 생성한 인증 URL을 View로 전달 */
      MemberVO userVO = memberService.loginCheck(member);

      String msg = "";

      if (userVO == null) {
         msg = "Fail";
         model.addAttribute("msg", msg);

         return "jsp/login/login";
      } else {
         msg = userVO.getNickname() + "님 환영합니다.";
         session.setAttribute("msg", msg);
         session.setAttribute("no", userVO.getNo());
         session.setAttribute("userVO", userVO);

         return "jsp/login/loginCome";
      }
   }

   // 로그아웃
   @RequestMapping("/logout")
   public String logout(HttpSession session) {

      session.invalidate();

      return "jsp/login/logoutBye";
   }

//**********************************************************

// *************************임지영1 체크박스 모드*********************************

//    체크박스 관리자 등업
   @RequestMapping(value = "/checkUp", method = RequestMethod.POST)
   public String checkUp(@Valid MemberVO memberVO) throws Exception {
      if (memberVO.getNoList() == null) {
         return "jsp/admin/nochecks";
      } else {
         memberService.checkUp(memberVO);
         System.out.println("-----------임지영임지영임지영->" + memberVO);
         return "jsp/admin/checkUp";
      }
   }

   // 체크박스 일반사용자강등
   @RequestMapping(value = "/checkDown", method = RequestMethod.POST)
   public String checkDown(@Valid MemberVO memberVO) throws Exception {
      if (memberVO.getNoList() == null) {
         return "jsp/admin/nochecks";
      } else {
         memberService.checkDown(memberVO);
         return "jsp/admin/checkDown";
      }
   }

   // 체크박스 회원탈퇴
   @RequestMapping(value = "/checkDelete", method = RequestMethod.POST)
   public String checkDelete(@Valid MemberVO memberVO) throws Exception {
      if (memberVO.getNoList() == null) {
         return "jsp/admin/nochecks";
      } else {
         System.out.println("체크박스 회원탈퇴 파일 페이크 네임 : " + memberVO.getFile_fakename());
         System.out.println("체크박스 회원탈퇴 넘버 가져오니? : " + memberVO.getNo());
         memberService.checkDelete(memberVO);
         return "jsp/admin/checkDelete";
      }
   }
//   *************************임지영1 비밀번호 재설정 이동*********************************
   @RequestMapping(value = "/goToFindPassword", method = RequestMethod.GET)
   public String findPassword(MemberVO memberVO) {

      return "jsp/member/newPasswordForm";
   }
//   *************************임지영1 이메일 비밀번호 재설정, 세션에 등록*********************************

   // 새로운 비밀번호가 생성된다.
   @RequestMapping("/newPassword")
   public String newPassword(@Valid MemberVO memberVO, HttpSession session) throws Exception {
      System.out.println("-----------------나올까? --------------->>>" + memberVO.getPassword());
      int num = random.nextInt(89999) + 10000;
      String password = "bapsi" + Integer.toString(num);// 새로운 비밀번호 변경
      String npassword = password;
      memberVO.setPassword(npassword);
      // 우선 가짜 정보 저장 후
      session.setAttribute("memberVO", memberVO);
      // 비교한여맞으면 비번 교체, 틀리면 비번 냅둔다.
      memberService.newPassword(memberVO);
      return "jsp/member/comparePassword";
   }

   // //세션에 등록되어있는 것과 비교 , 세션에 들어있는 것은 새로 설정된것 갖고오는 것은 기존
   @RequestMapping("/comparePassword")
   public String findPasswordOK(MemberVO memberVO, HttpSession session) throws Exception {
      MemberVO fUser = (MemberVO) session.getAttribute("memberVO");
      MemberVO rUser = memberService.comparePassword(fUser);

      if (rUser == null) {
         session.invalidate();
         return "jsp/member/findPasswordNOK";
      } else {
         System.out.println("!맞아");
         emailVO.setSubject("안녕하세요" + fUser.getEmail() + "님  Bapsi 팀 입니다. 재설정된 비밀번호를 확인해주세요");
         emailVO.setContent("새로운 비밀번호는 " + fUser.getPassword()
               + " 입니다. \n로그인 후 비밀번호를 다시 설정해 주세요 \n http://localhost:8000/bapsi/login");
         emailVO.setReceiver(fUser.getEmail());
         emailSender.SendEmail(emailVO);
         System.out.println(emailVO);
         session.invalidate();
         return "jsp/member/findPasswordOK";
      }
   }

   // *************************임지영1 이메일 비밀번호 재설정, 세션에 등록
   // 끝********************************
   // *************************임지영1 이메일 인증*********************************
   @RequestMapping(value="/sendEmailCheck", method=RequestMethod.POST)
   @ResponseBody
   public Map<Object, Object> sendEmailCheck(@RequestBody String email, Model model, HttpSession session) throws Exception {
      Map<Object, Object> map = new HashMap<Object, Object>();
      int num = random.nextInt(89999) + 10000;
      System.out.println(email);
      String pinNum = Integer.toString(num);
      session.setMaxInactiveInterval(60*5);
      session.setAttribute("pinNum", pinNum);
      System.out.println(pinNum);
      emailVO.setSubject("Bapsi 가입을 환영합니다.");
      emailVO.setContent("인증번호는 " + pinNum + "입니다.\n인증신청을 하지 않으셨다면 메일을 삭제해주세요");
      emailVO.setReceiver(email);
      emailSender.SendEmail(emailVO);
      map.put("pinNum", pinNum);
      return map;
   }
   //이메일 인증번호 입력
   //true 와 false 을 string으로 전달
   @RequestMapping(value="/sendEmailCheckOK", method=RequestMethod.POST)
   @ResponseBody
   public String sendEmailOK(@RequestBody String PinNum, HttpSession session) throws Exception{
      Map<Object, Object> map = new HashMap<Object, Object>();
      String isPinNum = (String) session.getAttribute("pinNum");
      if(PinNum.equals( isPinNum)) {
         session.invalidate();
         return "true";
      }else {
         session.invalidate();
         return "false";
      }
   }
   
// *************************임지영1 이메일 인증 끝*********************************
// *************************   임지영1 비밀번호 변경 *********************************
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String changePassword(MemberVO memberVO, HttpSession session) throws Exception {
		MemberVO authUser = (MemberVO) session.getAttribute("userVO");
		return "jsp/member/changePasswordForm";
	}

	@RequestMapping(value = "/changePasswordProcess", method = RequestMethod.POST)
	public String changePasswordProcess(String password, String confirmPassword, HttpSession session) throws Exception {
		MemberVO authUser = (MemberVO) session.getAttribute("userVO");
		System.out.println(authUser + "세션값 ????????");
		String email = authUser.getEmail();
		String password1 = password;
		String password2 = confirmPassword;
		System.out.println(password1+"이거하고"+password2);
		if (password1.equals(password2)) {
			authUser.setPassword(password);
			memberService.changePassword(authUser);
			System.out.println(authUser);
			session.invalidate();
			return "jsp/member/changePasswordOK";
		} else {
			return "jsp/member/changePasswordNOK";

		}
	}
}
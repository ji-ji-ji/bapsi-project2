package kr.co.bapsi.member.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bapsi.member.vo.FindCriteria;
import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.member.vo.PageCriteria;
import kr.co.bapsi.upload.vo.UploadVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
   
   @Inject
   private SqlSession sqlSession;

//*******************회원가입 **************************
   // 회원가입
   @Override
   public void join(MemberVO member) throws Exception {
      sqlSession.insert("join", member);

   }

   // 이메일 중복 체크
   @Override
   public int checkEmail(String email) throws Exception {

      return sqlSession.selectOne("checkEmail", email);
   }

   // 닉네임 중복 체크
   @Override
   public int checkNickname(String nickname) throws Exception {

      return sqlSession.selectOne("checkNickname", nickname);
   }

//****************************************************

//***************마이페이지*******************************
   @Override
   public MemberVO myPage(int no) throws Exception {

      return sqlSession.selectOne("myPage", no);
   }
   
   //마이페이지 로그인 API+ 기존 회원 API 
   @Override
   public MemberVO loginMyPage(String email) throws Exception{
      return sqlSession.selectOne("loginMyPage",email);
   }
   // 로그인 API파일 + 기존 회원 API 파일  
   @Override
   public UploadVO myPagefile(int userNo) {

      return sqlSession.selectOne("myPagefile", userNo);
   }

   @Override
   public void update(MemberVO member) throws Exception {

      sqlSession.update("update", member);

   }

   @Override
   public void selfDelete(int no) throws Exception {

      sqlSession.delete("selfDelete", no);
   }

   @Override
   public void profileDelete(int userNo) throws Exception {

      sqlSession.delete("profileDelete", userNo);
   }
//*****************************************************

//****************회원목록(관리자) 관련 메소드******************

   // 회원목록 상세정보
   @Override
   public MemberVO detailMember(int no) {

      return sqlSession.selectOne("detailMember", no);
   }

   // 회원정보 프로필
   public UploadVO detailProfile(int no) {

      return sqlSession.selectOne("detailProfile", no);
   }

   // 회원정보 수정
   public void memberUpdate(MemberVO member) {

      sqlSession.update("memberUpdate", member);
   }

   // 회원삭제
   @Override
   public void deleteMember(int no) {

      sqlSession.delete("adminDelete", no);

   }
   
   // 회원삭제 할때 프로필도 같이 회원삭제
   @Override
   public void deleteMemberProfile(int no) {
      sqlSession.delete("adminDeleteProfile", no);
   }

   // 검색부분에서의 DAO ( 검색 창)
   @Override
   public List<MemberVO> listFind(FindCriteria findCri) throws Exception {
      return sqlSession.selectList("listFindM", findCri);
   }

   // 검색 부분에서의 DAO(count)
   @Override
   public int findCountData(FindCriteria findCri) throws Exception {
      return sqlSession.selectOne("findCountDataM", findCri);
   }

//*****************************************************

//*******************관리자 페이징 **************************   

   // 관리자 회원관리 목록 페이징
   @Override
   public List<MemberVO> pagingList(int page) throws Exception {
      if (page <= 0) {
         page = 1;
      }

      return sqlSession.selectList("pagingList", page);

   }

   // 관리자 회원관리 목록 페이징2
   @Override
   public List<MemberVO> pagingCriteria(PageCriteria cCri) throws Exception {
      return sqlSession.selectList("pagingCriteria", cCri);
   }

   // 페이징 전체 수 가져오기
   @Override
   public int pagingCountData(PageCriteria pCri) throws Exception {
      return sqlSession.selectOne("" + "" + "", pCri);
   }
//*****************************************************   

//***************  로그인 *******************************
   // 로그인 저장DAOImpl
   @Override
   public MemberVO loginCheck(MemberVO member) throws Exception {

      return sqlSession.selectOne("loginCheck", member);
   }

   @Override
   public MemberVO apiMemSelect(String email) throws Exception {
      return sqlSession.selectOne("apiMemSelect", email);
   }
   // 네이버DB 저장 DAOImpl
   @Override
   public void naverInsert(MemberVO mvo) {
      sqlSession.insert("naverInsert", mvo);

   }

//*****************************************************   
   // *****************체크박스************************************

   @Override
   public void checkUp(MemberVO memberVO) throws Exception {
      List<Integer> noList = memberVO.getNoList();
      int noListSize = noList.size();
      for (int i = 0; i < noListSize; i++) {
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("noList", noList.get(i));
         System.out.println(map);
         int no = (int) map.get("noList");
         System.out.println(no);
         sqlSession.update("checkUpM", no);
      }
   }

   @Override
   public void checkDown(MemberVO memberVO) throws Exception {
      List<Integer> noList = memberVO.getNoList();
      int noListSize = noList.size();
      for (int i = 0; i < noListSize; i++) {
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("noList", noList.get(i));
         int no = (int) map.get("noList");
         System.out.println(no);
         sqlSession.update("checkDownM", no);
      }
   }

   @Override
   public void checkDelete(MemberVO memberVO) throws Exception {
      List<Integer> noList = memberVO.getNoList();
      int noListSize = noList.size();
      for (int i = 0; i < noListSize; i++) {
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("noList", noList.get(i));
         int no = (int) map.get("noList");
         System.out.println(no);
         
         MemberVO member = new MemberVO();
         
         member = sqlSession.selectOne("detailMember", no);
         System.out.println("체크박스에서 fileFakename : " + member.getFile_fakename());
         
         if(member.getFile_fakename() == null) {
            
            sqlSession.update("checkDelete", no);
            
         } else {
            
            UploadVO upload = new UploadVO();
            
            upload = sqlSession.selectOne("detailProfile", no);
            
            String path = "";
            
            String profile = "/" + upload.getFile_fakename();
      
            String uploadPath = "/bapsi/uploads";
            
            path = uploadPath + profile;
      
            System.out.println("삭제할 파일 경로 : " + path);
      
            File file = new File(path);
      
            if (file.exists() == true) {
      
               file.delete();
            }
            
            sqlSession.update("checkDelete", no);
            sqlSession.delete("adminDeleteProfile", no);
         }
         
         /*sqlSession.update("checkDelete", no);*/
      }
   }

   // *****************************************************

//   @Override
//   public void insertMember(MemberVO member) {
//      
//   }
//   
//   @Override
//   public MemberVO viewMember(String email) {
//      
//      return sqlSession.selectOne("viewMember", email);
//   }
//   
//   @Override
//   public void deleteMember(String email) {
//      
//   }
//   
//   @Override
//   public void updateMember(MemberVO member) {
//      sqlSession.update("updateMember", member);
//   }

   @Override
   public void newPassword(MemberVO member) {
      String password = member.getPassword();
      member.setPassword(password);
      sqlSession.update("newPassword", member);
   }

   @Override
   public MemberVO comparePassword(MemberVO memberVO) throws Exception {

      return sqlSession.selectOne("comparePassword", memberVO);
   }

   @Override
   public int checkGoogleLogin(MemberVO memberVO) throws Exception {
      return sqlSession.selectOne("checkJoinGoogle", memberVO);

   }

   //구글로그인,비밀번호 null 방지를 위해 가상 비밀번호 만들어주고 sociallogin 코드 넣어준다. 
      @Override
      public void joinGoogle(MemberVO memberVO) throws Exception {
         sqlSession.insert("joinGoogle", memberVO);
      }
      
   //구글 select 
      @Override
      public MemberVO googleSelect(String email) throws Exception {
         
         return sqlSession.selectOne("googleSelect",email);
      }

		@Override
		public void changePassword(MemberVO memberVO) throws Exception {
			sqlSession.update("changePassword", memberVO);
			
		}


}
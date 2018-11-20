package kr.co.bapsi.member.service;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Service;

import kr.co.bapsi.member.dao.MemberDAO;
import kr.co.bapsi.member.vo.FindCriteria;
import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.member.vo.PageCriteria;
import kr.co.bapsi.upload.vo.UploadVO;

@Service
public class MemberServiceImpl implements MemberService {

   @Inject
   private MemberDAO memberDAO;

//*******************회원가입 **************************   
   // 회원가입
   @Override
   public void join(MemberVO member) throws Exception {
      memberDAO.join(member);

   }

   // 이메일 중복 체크
   @Override
   public int checkEmail(String email) throws Exception {

      return memberDAO.checkEmail(email);
   }

   // 닉네임 중복 체크
   @Override
   public int checkNickname(String nickname) throws Exception {

      return memberDAO.checkNickname(nickname);
   }

//****************************************************

//****************회원 관련 메소드******************
   // 회원목록
   @Override
   public MemberVO myPage(int no) throws Exception {

      return memberDAO.myPage(no);
   }
   
   //로그인 마이페이지
   @Override
   public MemberVO loginMyPage(String email) throws Exception{
      return memberDAO.loginMyPage(email);
   }

   @Override
   public UploadVO myPagefile(int userNo) throws Exception {

      return memberDAO.myPagefile(userNo);
   }

   // 회원정보 상세보기
   @Override
   public void update(MemberVO member) throws Exception {

      memberDAO.update(member);

   }

   // 회원탈퇴
   @Override
   public void selfDelete(int no) throws Exception {

      memberDAO.selfDelete(no);
   }
   
   // 회원탈퇴시 프로필 삭제
   @Override
   public void profileDelete(int userNo) throws Exception {
      
      memberDAO.profileDelete(userNo);
   }
   
//*****************************************************   

//****************회원목록(관리자) 관련 메소드******************

   // 관리자: 회원정보 상세보기 오버라이드(DAO호출)
   @Override
   public MemberVO detailMember(int no) {
      return memberDAO.detailMember(no);
   }
   
   // 관리자 : 회원정보 프로필 보기
   @Override
   public UploadVO detailProfile(int no) {
      
      return memberDAO.detailProfile(no);
   }

   // 관리자: 회원정보 수정
   @Override
   public void memberUpdate(MemberVO member) throws Exception {
      
      memberDAO.memberUpdate(member);
   }
   
   // 관리자: 회원삭제
   @Override
   public void deleteMember(int no) {

      memberDAO.deleteMember(no);
   }
   
   // 관리자 : 회원삭제할때 프로필도 같이 삭제
   @Override
   public void deleteMemberProfile(int no) {
      
      memberDAO.deleteMemberProfile(no);
   }

   // 관리자 : 검색구현
   @Override
   public List<MemberVO> listFind(FindCriteria findCri) throws Exception {
      return memberDAO.listFind(findCri);
   }

   // 관리자: 검색구현
   @Override
   public int findCountData(FindCriteria findCri) throws Exception {
      return memberDAO.findCountData(findCri);
   }

//*****************************************************   

//*******************관리자 페이징 **************************   

   // 관리자 : 페이징
   public List<MemberVO> pagingCriteria(PageCriteria pCri) throws Exception {
      return memberDAO.pagingCriteria(pCri);
   }

   // 관리자 : 페이징 전체 수 가져오기
   public int pagingCountData(PageCriteria pCri) throws Exception {
      return memberDAO.pagingCountData(pCri);
   }

//*****************************************************   

//***************  로그인 *******************************   
   // 로그인 서비스 Implements
   @Override
   public MemberVO loginCheck(MemberVO member) throws Exception {

      return memberDAO.loginCheck(member);
   }
   @Override
   public MemberVO apiMemSelect(String email) throws Exception {
      return memberDAO.apiMemSelect(email);
   }

   // 네이버 회원목록 관련 메소드
   @Override
   public void naverInsert(MemberVO mvo) {
      memberDAO.naverInsert(mvo);
   }

//*****************************************************   
   @Override
   public void checkUp(MemberVO memberVO) throws Exception {
      memberDAO.checkUp(memberVO);
   }

   @Override
   public void checkDown(@Valid MemberVO memberVO) throws Exception {
      memberDAO.checkDown(memberVO);

   }

   @Override
   public void checkDelete(@Valid MemberVO memberVO) throws Exception {
      memberDAO.checkDelete(memberVO);
   }
   @Override
   public void newPassword(MemberVO memebrVO) throws Exception {

      memberDAO.newPassword(memebrVO);
   }

   @Override
   public MemberVO comparePassword(MemberVO memberVO) throws Exception {
      
      return memberDAO.comparePassword(memberVO);
   }

   @Override
   public int checkGoogleLogin(MemberVO memberVO) throws Exception {
      return memberDAO.checkGoogleLogin(memberVO);
   }

   @Override
   public void joinGoogle(MemberVO memberVO) throws Exception {
      memberDAO.joinGoogle(memberVO);
      
   }
   
   @Override
   public MemberVO googleSelect(String email) throws Exception {
      
      return memberDAO.googleSelect(email);
   }

@Override
public void changePassword(MemberVO memberVO) throws Exception {
	memberDAO.changePassword(memberVO);
	
}

}
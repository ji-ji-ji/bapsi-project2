package kr.co.bapsi.member.dao;

import java.util.List;

import javax.validation.Valid;

import kr.co.bapsi.member.vo.FindCriteria;
import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.member.vo.PageCriteria;
import kr.co.bapsi.upload.vo.UploadVO;

public interface MemberDAO {

//*******************회원가입 **************************
	// 회원가입
	public void join(MemberVO member) throws Exception;

	// 이메일 중복 체크
	public int checkEmail(String email) throws Exception;

	// 닉네임 중복 체크
	public int checkNickname(String nickname) throws Exception;

//****************************************************

//***************마이페이지*******************************
	// 마이페이지
	public MemberVO myPage(int no) throws Exception;

	// 마이페이지 파일
	public UploadVO myPagefile(int no) throws Exception;

	// 회원정보 수정
	public void update(MemberVO member) throws Exception;

	// 회원탈퇴
	public void selfDelete(int no) throws Exception;
	
	// 회원탈퇴때 프로필 삭제
	public void profileDelete(int no) throws Exception;

//*****************************************************

//****************회원목록(관리자) 관련 메소드******************

	// 회원정보 상세보기
	public MemberVO detailMember(int no);
	
	// 회원정보 프로필
	public UploadVO detailProfile(int no);
	
	// 회원정보 수정
	public void memberUpdate(MemberVO member) throws Exception;

	// 회원삭제
	public void deleteMember(int no);

	// 검색기능에서의 DAO
	public List<MemberVO> listFind(FindCriteria findCri) throws Exception;

	// 검색기능에서의 DAO 데이터를 카운트하는 부분
	public int findCountData(FindCriteria findCri) throws Exception;

//*********************************************************

//*******************관리자 페이징 **************************

	// 관리자 회원관리 목록 페이징
	public List<MemberVO> pagingList(int page) throws Exception;

	// 관리자 회원관리 목록 페이징2
	public List<MemberVO> pagingCriteria(PageCriteria cCri) throws Exception;

	// 페이징 전체 수 가져오기
	public int pagingCountData(PageCriteria pCri) throws Exception;

//*****************************************************		

//***************  로그인 *******************************
	// 로그인
	public MemberVO loginCheck(MemberVO member) throws Exception;

	// 네이버DB 저장 DAO
	public void naverInsert(MemberVO mvo);

//*****************************************************	
	// ************************체크박스******************************
	// public void checkUp(MemberVO memberVO)throws Exception;
	public void checkUp(@Valid MemberVO memberVO) throws Exception;

	public void checkDown(@Valid MemberVO memberVO) throws Exception;

	public void checkDelete(@Valid MemberVO memberVO) throws Exception;

	// ******************************************************

//	
//	//회원입력
//	public void insertMember(MemberVO member);
//	
//	//회원정보 상세보기
//	public MemberVO viewMember();
//	
//	//회원삭제
//	public void deleteMember(String email);
//	
//	//회원정보 수정
//	public void updateMember(MemberVO member);
	// *****************비밀번호 찾기*************************************
		public void newPassword(MemberVO memberVO) throws Exception;
		public MemberVO comparePassword(MemberVO memberVO) throws Exception;
		// *****************구글 로그인************************************
		public int  checkGoogleLogin(MemberVO memberVO) throws Exception;
		public void joinGoogle(MemberVO memberVO) throws Exception;
	
	
//
}

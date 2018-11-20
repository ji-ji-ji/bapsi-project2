package kr.co.bapsi.recipe.service;

import java.util.List;

import javax.validation.Valid;

import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.recipe.vo.FindCriteria;
import kr.co.bapsi.recipe.vo.FindTagCriteria;
import kr.co.bapsi.recipe.vo.IngVO;
import kr.co.bapsi.recipe.vo.RecipeVO;
import kr.co.bapsi.recipe.vo.TagVO;

public interface RecipeService {
	//********************************정은부분**********************************************
   RecipeVO selectRecipe(int no);
   void deleteRecipe(int no);
  // List<RecipeVO> listCriteria(PageCriteria pCria);
   // int listCountData(PageCriteria pCria);
   //List<RecipeVO> tagListCriteria(TagPageCriteria pCria);
  // int listCountData(TagPageCriteria pCria);
   
   void updateViewCnt(int no);
   public void delete(int no);
   
   // -------------------------검색기능-----------------------------------
   public List<RecipeVO> findList(FindCriteria findCri);
   public int findCountData(FindCriteria findCri);
   List<RecipeVO> tagListCriteria(FindTagCriteria pCria);
   int listCountData(FindTagCriteria pCria);
   
   // -------------------------포인트-----------------------------------
	public int checkBoard(int userNo, int receipeNo);
	public int checkBoardO(int userNo, int receipeNo);
	
	public void getRPoint(int receipeNo);
	public void getMPoint(int receipeUserNo);
	public void addLogUp(int userNo, int receipeNo, int receipeUserNo);
	
	public void loseRPoint(int receipeNo);
	public void loseMPoint(int receipeUserNo);
	public void addLogDown(int userNo, int receipeNo, int receipeUserNo);
	
	//좋아요 눌렀는지 안눌렀는지
	public int checkLike(int receipeNo, int userNo);
	public int checkDown(int receipeNo, int userNo);
	//좋아요취소
	public void deleteLog(int userNo,int receipeUserNo, int receipeNo);
	//싫어요취소
	public void deleteLogDown(int userNo,int receipeUserNo, int receipeNo);
	
	//랭킹페이지 관련
	public List<RecipeVO> selectBestRecipe();
	public List<MemberVO> selectBestMember();
	public List<MemberVO> selectBestMemberR();
	
	//회원 상세보기 관련
	public int pointCnt(int no);
	public int recipeCnt(int no);
	public List<RecipeVO> userPageRecipe(int no);
	public List<RecipeVO> likeRecipe(int no);
	public int followingCnt(int no);
	
	
	// -------------------------팔로우-----------------------------------
	public void getFollowCnt(int receipeUserNo);
	public void insertFollower(int userNo, int receipeUserNo);
	
	public void loseFollowCnt(int receipeUserNo);
	public void deleteFollower(int userNo, int receipeUserNo);
	//팔로우 했는지..
	public int followCheck(int userNo, int receipeUserNo);
	
//********************************지영부분**********************************************
	void updateRecipe(RecipeVO recipeVO);
	void newRecipe(RecipeVO recipeVO, @Valid IngVO rIngreVO, @Valid TagVO rTagVO);
	List<TagVO> selectAllTag();
	List<IngVO> selectAllIngre();
	RecipeVO selectByNo(int no);
	List<IngVO> selectIngByNo(int no);
	List<TagVO> selectTagByNo(int no);
	
//**********************************뷰카운트 조회 *****************************************
	int viewCnt();
//*********************************희승 체크박스 조회 *****************************************
	 public List<TagVO> getCategoryNames(String type);
   
}
package kr.co.bapsi.recipe.dao;

import java.util.List;

import kr.co.bapsi.recipe.vo.FindCriteria;
import kr.co.bapsi.recipe.vo.FindTagCriteria;
import kr.co.bapsi.recipe.vo.IngVO;
import kr.co.bapsi.recipe.vo.PageCriteria;
import kr.co.bapsi.recipe.vo.RecipeVO;
import kr.co.bapsi.recipe.vo.TagPageCriteria;
/**
 * Recipe에 관련된 DAO
 * @author Administrator
 *
 */
import kr.co.bapsi.recipe.vo.TagVO;
public interface RecipeDAO {
	//**************************************정은부분****************************************
   /**
    * 페이징 관련 -  레시피 게시글 조회
    * @param page
    * @Param pageCria
    */
   //List<RecipeVO> list();
   List<RecipeVO> listPage(int page);
   //List<RecipeVO> listCriteria(PageCriteria pageCria);//
  // int countData(PageCriteria pageCria);//
   //List<RecipeVO> tagListCriteria(TagPageCriteria pageCria);
  // int countData(TagPageCriteria pageCria);
   
   /*
    * 검색!
    */
   public List<RecipeVO> listFind(FindCriteria findCri);
   public int findCountData(FindCriteria findCri);
   
   List<RecipeVO> tagListCriteria(FindTagCriteria pageCria);
   int countData(FindTagCriteria pageCria);
   
   /**
    *  조회수
    *  @param no
    */
   void updateViewCnt(int no);
   /**
    * 게시글 상세조회
    * @param no
    */
   RecipeVO detail(int no);
   
   /**
    * 글번호에 해당하는 레시피 조회
    * @param no
    */
   	RecipeVO selectByNo(int no);
	List<IngVO> selectIngByNo(int no);
	List<TagVO> selectTagByNo(int no);
	
	   /**
	    * 태그,재료 조회
	    * @Param no
	    */
	   public List<TagVO> tagList(int no);
	   public List<IngVO> ingList(int no);
	/*
	 * 포인트(좋아요 싫어요)
	 */
	public int checkBoard(int userNo, int receipeNo);
	public int checkBoardO(int userNo, int receipeNo);
	public void getMPoint(int receipeUserNo);
	public void getRPoint(int receipeNo);
	public void addLogUp(int userNo, int receipeNo, int receipeUserNo);
	public void loseMPoint(int receipeUserNo);
	public void loseRPoint(int receipeNo);
	public void addLogDown(int userNo, int receipeNo, int receipeUserNo);
	
	public int checkLike(int receipeNo, int userNo);
	public int checkDown(int receipeNo, int userNo);
	public void deleteLog(int userNo,int receipeUserNo, int receipeNo);
	public void deleteLogDown(int userNo,int receipeUserNo, int receipeNo);
	
	// -------------------------팔로우-----------------------------------
	public void getFollowCnt(int receipeUserNo);
	public void insertFollower(int userNo, int receipeUserNo);
	
	public void loseFollowCnt(int receipeUserNo);
	public void deleteFollower(int userNo, int receipeUserNo);
	//팔로우 했는지..
	public int followCheck(int userNo, int receipeUserNo);
	//**************************************지영부분****************************************
	/**
	 * 새글 등록 서비스
	 * @param recipeVO
	 * @param rIngreVO
	 * @param rTagVO 
	 * @param amountVO 
	 */
	void newRecipe(RecipeVO recipeVO, IngVO rIngreVO, TagVO rTagVO);
   /**
    * 글번호에 해당하는 레시피 삭제
    * @param no
    */
   void deleteRecipe(int no);
   /**
    * 글번호에 해당하는 레시피 수정
    * @param recipeVO
    */
   void updateRecipe(RecipeVO recipeVO);
   
	/**
	 * 태그리스트 가져오기
	 * @return
	 */
	List<TagVO> selectAllTag();

	/**
	 * 재료리스트 가져오기
	 * @return
	 */
	List<IngVO> selectAllIngre();
	
   /**
    * 글 삭제 서비스
    * @param no
    */
   public void delete(int no);

   public List<RecipeVO> selectBestRecipe();
   
   
   //전체 뷰카운트DAO
   public int viewCnt();
   

   
   
   
}
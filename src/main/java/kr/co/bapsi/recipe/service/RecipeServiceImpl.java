package kr.co.bapsi.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bapsi.recipe.dao.RecipeDAO;
import kr.co.bapsi.recipe.vo.FindCriteria;
import kr.co.bapsi.recipe.vo.FindTagCriteria;
import kr.co.bapsi.recipe.vo.IngVO;
import kr.co.bapsi.recipe.vo.RecipeVO;
import kr.co.bapsi.recipe.vo.TagVO;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private RecipeDAO recipeDao;

	// ********************************정은부분**********************************************
	@Override
	public void deleteRecipe(int no) {
		recipeDao.deleteRecipe(no);
	}

	/*
	 * @Override public List<RecipeVO> listCriteria(PageCriteria pCria){ return
	 * recipeDao.listCriteria(pCria); }
	 * 
	 * @Override public int listCountData(PageCriteria pCria) { return
	 * recipeDao.countData(pCria); }
	 */
	@Override
	public List<RecipeVO> tagListCriteria(FindTagCriteria pCria) {
		return recipeDao.tagListCriteria(pCria);
	}

	@Override
	public int listCountData(FindTagCriteria pCria) {
		return recipeDao.countData(pCria);
	}

	@Override
	public void updateViewCnt(int no) {
		recipeDao.updateViewCnt(no);
	}

	@Override
	public void delete(int no) {
		recipeDao.delete(no);
	}

	// ----------------검색기능------------------------

	@Override
	public List<RecipeVO> findList(FindCriteria findCri) {
		return recipeDao.listFind(findCri);
	}

	@Override
	public int findCountData(FindCriteria findCri) {
		return recipeDao.findCountData(findCri);
	}

	// ----------------포인트------------------------
	@Override
	public int checkBoard(int userNo, int receipeNo) {
		return recipeDao.checkBoard(userNo, receipeNo);
	}

	@Override
	public int checkBoardO(int userNo, int receipeNo) {
		return recipeDao.checkBoardO(userNo, receipeNo);
	}

	@Override
	public void getRPoint(int receipeNo) {
		recipeDao.getRPoint(receipeNo);
	}

	@Override
	public void getMPoint(int receipeUserNo) {
		recipeDao.getMPoint(receipeUserNo);
	}

	@Override
	public void addLogUp(int userNo, int receipeNo, int receipeUserNo) {
		recipeDao.addLogUp(userNo, receipeNo, receipeUserNo);
	}

	@Override
	public void loseRPoint(int receipeNo) {
		recipeDao.loseRPoint(receipeNo);
	}

	@Override
	public void loseMPoint(int receipeUserNo) {
		recipeDao.loseMPoint(receipeUserNo);
	}

	@Override
	public void addLogDown(int userNo, int receipeNo, int receipeUserNo) {
		recipeDao.addLogDown(userNo, receipeNo, receipeUserNo);
	}

	@Override
	public int checkLike(int receipeNo, int userNo) {
		int checkLike = recipeDao.checkLike(receipeNo, userNo);
		return checkLike;
	}

	@Override
	public int checkDown(int receipeNo, int userNo) {
		int checkDown = recipeDao.checkDown(receipeNo, userNo);
		return checkDown;
	}

	@Override
	public void deleteLog(int userNo, int receipeUserNo, int receipeNo) {
		recipeDao.deleteLog(userNo, receipeUserNo, receipeNo);
	}

	@Override
	public void deleteLogDown(int userNo, int receipeUserNo, int receipeNo) {
		recipeDao.deleteLogDown(userNo, receipeUserNo, receipeNo);
	}
	
	@Override
	   public List<RecipeVO> selectBestRecipe() {
	      return recipeDao.selectBestRecipe();
	   }

	// ----------------팔로우------------------------
	@Override
	public void getFollowCnt(int receipeUserNo) {
		recipeDao.getFollowCnt(receipeUserNo);
	}

	@Override
	public void insertFollower(int userNo, int receipeUserNo) {
		recipeDao.insertFollower(userNo, receipeUserNo);
	}

	@Override
	public void loseFollowCnt(int receipeUserNo) {
		recipeDao.loseFollowCnt(receipeUserNo);
	}

	@Override
	public void deleteFollower(int userNo, int receipeUserNo) {
		recipeDao.deleteFollower(userNo, receipeUserNo);
	}


	@Override
	public int followCheck(int userNo, int receipeUserNo) {
		return recipeDao.followCheck(userNo, receipeUserNo);
	}

	// ********************************지영부분**********************************************
	@Override
	public void updateRecipe(RecipeVO recipeVO) {
		recipeDao.updateRecipe(recipeVO);
	}

	@Override
	public List<TagVO> selectAllTag() {
		List<TagVO> tagList = recipeDao.selectAllTag();
		return tagList;
	}

	@Override
	public List<IngVO> selectAllIngre() {
		List<IngVO> ingreList = recipeDao.selectAllIngre();
		return ingreList;
	}

	@Override
	public RecipeVO selectByNo(int no) {
		RecipeVO recipe = recipeDao.selectByNo(no);
		return recipe;
	}

	@Override
	public List<IngVO> selectIngByNo(int no) {
		List<IngVO> rIngList = recipeDao.selectIngByNo(no);
		return rIngList;
	}

	@Override
	public List<TagVO> selectTagByNo(int no) {
		List<TagVO> rTagList = recipeDao.selectTagByNo(no);
		return rTagList;
	}

	@Override
	public void newRecipe(RecipeVO recipeVO, IngVO rIngreVO, TagVO rTagVO) {
		recipeDao.newRecipe(recipeVO, rIngreVO, rTagVO);
	}

	@Override
	public RecipeVO selectRecipe(int no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//뷰카운트 전체조회
	@Override
	public int viewCnt() {
		
		return recipeDao.viewCnt();
	}

}
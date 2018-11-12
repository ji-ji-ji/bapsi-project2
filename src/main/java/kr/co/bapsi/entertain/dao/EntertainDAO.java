package kr.co.bapsi.entertain.dao;

import java.util.List;

import kr.co.bapsi.entertain.vo.FindCriteria;
import kr.co.bapsi.entertain.vo.MukbangVO;
import kr.co.bapsi.entertain.vo.RandomEatVO;
import kr.co.bapsi.recipe.vo.IngVO;

public interface EntertainDAO {

   public List<MukbangVO> findMukbang(FindCriteria findCri) throws Exception;
   
   public int findCountData(FindCriteria findCri) throws Exception;
   
   public RandomEatVO randomEat(int no) throws Exception;
   
   public List<IngVO> ingredients(String type) throws Exception;
   
   public List<String> selectTypeList() throws Exception;
   
}
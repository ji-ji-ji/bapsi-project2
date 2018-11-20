package kr.co.bapsi.entertain.service;

import java.util.List;

import kr.co.bapsi.entertain.vo.FindCriteria;
import kr.co.bapsi.entertain.vo.MukbangVO;
import kr.co.bapsi.entertain.vo.RandomEatVO;

public interface EntertainService {

   // 유튜브 먹방
   public List<MukbangVO> findMukbang(FindCriteria findCri) throws Exception;
   
   public int findCountData(FindCriteria findCri) throws Exception;
   
   
   // 랜덤 음식 추천
   public RandomEatVO randomEat(int no) throws Exception;
   
   // 있는재료 만들기
   
   // 타입 목록
   public List<String> ingredientTypeList() throws Exception;
   
   // 전체 재료 목록
   public List<String> ingredientsNameList() throws Exception;
   
   // 타입 클릭했을때 재료 목록
   public List<String> selectIngredientsType(String type) throws Exception;

   
   
}
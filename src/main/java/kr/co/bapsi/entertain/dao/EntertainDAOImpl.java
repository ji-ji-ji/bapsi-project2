package kr.co.bapsi.entertain.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bapsi.entertain.vo.FindCriteria;
import kr.co.bapsi.entertain.vo.MukbangVO;
import kr.co.bapsi.entertain.vo.RandomEatVO;

@Repository
public class EntertainDAOImpl implements EntertainDAO{

   @Inject
   private SqlSession sqlSession;
   
   @Override
   public List<MukbangVO> findMukbang(FindCriteria findCri) throws Exception{
      
      return sqlSession.selectList("findMukbang", findCri);
   }
   
   @Override
   public int findCountData(FindCriteria findCri) throws Exception{
      
      return sqlSession.selectOne("findCount",findCri);
   }
   
   @Override
   public RandomEatVO randomEat(int no) throws Exception {
	   
	   return sqlSession.selectOne("randomEat", no);
   }
   
}
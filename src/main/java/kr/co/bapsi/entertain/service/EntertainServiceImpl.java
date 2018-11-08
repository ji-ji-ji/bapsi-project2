package kr.co.bapsi.entertain.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.bapsi.entertain.dao.EntertainDAO;
import kr.co.bapsi.entertain.vo.FindCriteria;
import kr.co.bapsi.entertain.vo.MukbangVO;
import kr.co.bapsi.entertain.vo.RandomEatVO;

@Service
public class EntertainServiceImpl implements EntertainService{

   @Inject
   private EntertainDAO entertainDAO;
   
   @Override
   public List<MukbangVO> findMukbang(FindCriteria findCri) throws Exception {
      
      return entertainDAO.findMukbang(findCri);
   }
   
   @Override
   public int findCountData(FindCriteria findCri) throws Exception {
      
      return entertainDAO.findCountData(findCri);
   }
   
   @Override
   public RandomEatVO randomEat(int no) throws Exception {
	   
	   return entertainDAO.randomEat(no);
   }
   
}
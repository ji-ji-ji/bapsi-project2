package kr.co.bapsi.recipe.reply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bapsi.recipe.vo.PageCriteria;
import kr.co.bapsi.recipe.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

   @Autowired // 자동주입
   private SqlSessionTemplate SqlSessionTemplate;

   @Override
   public List<ReplyVO> list(int recipeNo) {
      
      List<ReplyVO> rlist = SqlSessionTemplate.selectList("kr.co.bapsi.recipe.reply.dao.ReplyDAO.list", recipeNo);
      
      System.out.println("DAOImpl rlist 닉네임 나와라 :  " + rlist.toString());
      return rlist;
   }

   @Override
   public void write(ReplyVO rvo) {
      SqlSessionTemplate.insert("kr.co.bapsi.recipe.reply.dao.ReplyDAO.write", rvo);
   }

   @Override
   public void modify(ReplyVO rvo) {
      SqlSessionTemplate.update("kr.co.bapsi.recipe.reply.dao.ReplyDAO.modify", rvo);
   }

   @Override
   public void reDelete(int no) {
      SqlSessionTemplate.update("kr.co.bapsi.recipe.reply.dao.ReplyDAO.reDelete", no);
   }

   //댓글페이징
   @Override
   public List<ReplyVO> reListPage(int recipeNo, PageCriteria pCri){
      Map<String, Object> reMap = new HashMap<>();
      
      reMap.put("recipeNo", recipeNo);
      reMap.put("pCri", pCri);
      
      return SqlSessionTemplate.selectList("kr.co.bapsi.recipe.reply.dao.ReplyDAO.reListPage", reMap);
   }
   
   @Override
   public int reCount(int no) {
      return SqlSessionTemplate.selectOne("kr.co.bapsi.recipe.reply.dao.ReplyDAO.reCount", no);
      
   }
}







package kr.co.bapsi.recipe.reply.dao;

import java.util.List;

import kr.co.bapsi.recipe.vo.PageCriteria;
import kr.co.bapsi.recipe.vo.ReplyVO;

public interface ReplyDAO {
   
   /**
    * 댓글
    */
   public List<ReplyVO> list(int recipeNo); // 리스트
   
   public void write(ReplyVO rvo); // 댓글 작성
   
   public void modify(ReplyVO rvo); // 댓글 수정
   
   public void reDelete(int no); // 댓글 삭제
   
   //댓글페이징
   public List<ReplyVO> reListPage(int recipeNo, PageCriteria pCri);
 
   //댓글 수가 몇개인지
   public int reCount(int no);
   
}
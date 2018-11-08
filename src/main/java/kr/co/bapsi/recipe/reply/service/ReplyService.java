package kr.co.bapsi.recipe.reply.service;

import java.util.List;

import kr.co.bapsi.recipe.vo.PageCriteria;
import kr.co.bapsi.recipe.vo.ReplyVO;

public interface ReplyService {
	
	public void inputReply(ReplyVO rvo);
	
	public List<ReplyVO> replyList(int recipeNo);
	
	public void modifyReply(ReplyVO rvo);
	
	public void deReply(int no);
	
	public List<ReplyVO> replyListPage(int recipeNo, PageCriteria pCri);
	
	public int reCount(int no);

}

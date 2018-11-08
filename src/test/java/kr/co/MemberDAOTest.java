package kr.co;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.bapsi.member.dao.MemberDAO;
import kr.co.bapsi.member.vo.FindCriteria;
import kr.co.bapsi.member.vo.MemberVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDAOTest {
	@Inject
	private MemberDAO mdao;
	
	private static Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);
	
/*	@Test
	public void listPageTest() throws Exception{
		int page =1;
		
		
		List<MemberVO> list = mdao.pagingList(page);
		for(MemberVO memberVO : list) {
			logger.info(memberVO.getEmail()+":" + memberVO.getNo() + ":" + memberVO.getName());
		}


	@Test
	public void pagingCriteria() throws Exception{
		PageCriteria pCri = new PageCriteria();
		pCri.setPage(2);
		pCri.setNumPerPage(10);
		
		List<MemberVO> list = mdao.pagingCriteria(pCri);
		
		for(MemberVO mvo : list) {
			logger.info(mvo.getNo() + ": " + mvo.getEmail());
		}
		
	}*/
	
	@Test
	public void testFind() throws Exception{
		FindCriteria fcri = new FindCriteria();
		fcri.setPage(1);
		fcri.setFindType("E");
		fcri.setKeyword("abadsfaf@naver.com");
		
		
		logger.info("*******************테스트 글목록 출력 *****************");
		
		List<MemberVO> list = mdao.listFind(fcri);
		
		//for문을 통해 가져오는 거다.
		for(MemberVO mvo : list) {
			logger.info(mvo.getEmail() +":" + mvo.getName());
		}
	
		logger.info("*******************테스트 Data 갯수 출력 *****************");
		logger.info("CountData: " + mdao.findCountData(fcri));
		
	}
	
	
	
}

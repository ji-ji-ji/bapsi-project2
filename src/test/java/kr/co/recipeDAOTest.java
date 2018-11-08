package kr.co;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.bapsi.recipe.dao.RecipeDAO;
import kr.co.bapsi.recipe.vo.FindCriteria;
import kr.co.bapsi.recipe.vo.IngVO;
import kr.co.bapsi.recipe.vo.RecipeVO;
import kr.co.bapsi.recipe.vo.TagVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class recipeDAOTest {
	
	
	@Inject
	private RecipeDAO rdao;
	
	private static Logger logger = LoggerFactory.getLogger(recipeDAOTest.class);
	
	
	//@Test
	public void newRecipeTest(RecipeVO recipeVO, IngVO rIngreVO, TagVO rTagVO) {	
	}
	
	@Test
	public void testFind() throws Exception{
		FindCriteria cri = new FindCriteria();
		cri.setPage(1);
		cri.setFindType("W");
		cri.setKeyword("a");
		
		List<RecipeVO> list = rdao.listFind(cri);
		
		for(RecipeVO vo : list) {
			System.out.println(vo.getNo() + ": " + vo.getTitle());
		}
		
		System.out.println("CountData : " + rdao.findCountData(cri));
		
	}
}

package kr.co.bapsi;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.bapsi.recipe.service.RecipeService;
import kr.co.bapsi.recipe.vo.FindCriteria;
import kr.co.bapsi.recipe.vo.PagingMaker;
import kr.co.bapsi.recipe.vo.RecipeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private RecipeService recipeService;
	int cnt = 0;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		cnt++;
		model.addAttribute("cnt", cnt);

		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		FindCriteria pCria = new FindCriteria();
		pCria.setNumPerPage(6);
		pCria.setPage(1);

		// 레시피 수
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(pCria);
		pagingMaker.setTotalData(recipeService.findCountData(pCria));

		model.addAttribute("pagingMaker", pagingMaker);

		List<RecipeVO> recipeList = recipeService.selectBestRecipe();

		model.addAttribute("recipeList", recipeList);

		return "home";
	}

}
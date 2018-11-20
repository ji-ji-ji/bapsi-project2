package kr.co.bapsi.recipe.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bapsi.member.service.MemberService;
import kr.co.bapsi.member.vo.MemberVO;
import kr.co.bapsi.recipe.service.RecipeService;
import kr.co.bapsi.recipe.vo.RecipeVO;
import kr.co.bapsi.upload.vo.UploadVO;

@Controller
@RequestMapping("/ranking/*")
public class RankingController {

	ModelAndView mav = new ModelAndView(); // 삭제

	@Autowired
	private RecipeService recipeService;
	@Autowired
	private MemberService memberService;

	// 랭킹
	@RequestMapping(value = "/ranking/rankingMain", method = RequestMethod.GET)
	public String newRecipe(Model model) {

		List<RecipeVO> recipeList = recipeService.selectBestRecipe();
		model.addAttribute("recipeList", recipeList);

		List<MemberVO> memberList = recipeService.selectBestMember();
		model.addAttribute("memberList", memberList);

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@ : " + memberList.toString());
//		int writerNo = memberList[0].getUserNo(); 
//		List<UploadVO> photoList = memberService.myPagefile(writerNo);
//	    model.addAttribute("writerPhoto", photoList.getFile_fakename());

		List<MemberVO> memberListR = recipeService.selectBestMemberR();
		model.addAttribute("memberListR", memberListR);

		return "jsp/ranking/rankingMain"; // jsp/recipe/writeRecipe
	}
	
	// 유저 상세 페이지
	@RequestMapping(value = "/ranking/userPage", method = RequestMethod.GET)
	public String userPage(@RequestParam("no") int no, @ModelAttribute("userNo") int userNo, Model model) throws Exception {

		MemberVO member = memberService.detailMember(no);
		int pointCnt = recipeService.pointCnt(no);
		int recipeCnt = recipeService.recipeCnt(no);
		UploadVO writerPhoto = memberService.myPagefile(no);
		int followingCnt = recipeService.followingCnt(no);
		
	      //팔로우
	      int followCheck = recipeService.followCheck(userNo, no);
	      model.addAttribute("followCheck", followCheck);
	      
		model.addAttribute("recipeList", recipeService.userPageRecipe(no));
		if(writerPhoto != null) {
			model.addAttribute("writerPhoto", writerPhoto.getFile_fakename());
		}
		List<RecipeVO> revo = recipeService.likeRecipe(no);
		
		model.addAttribute("likeRecipe", recipeService.likeRecipe(no));
		model.addAttribute("followingCnt",followingCnt);
		model.addAttribute("member", member);
		model.addAttribute("pointCnt", pointCnt);
		model.addAttribute("recipeCnt", recipeCnt);

		return "jsp/member/userPage"; // jsp/recipe/writeRecipe
	}

}
package kr.co.bapsi.recipe.control;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.bapsi.recipe.service.RecipeService;

@RestController
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	private RecipeService recipeService;
	
	// 좋아요
	@RequestMapping(value = "/recommand",method = RequestMethod.POST)
	public Map<String, Object> recommand(@RequestBody Map<String, Object> pointMap, Model model) throws Exception {
		
		int userNo = (int)pointMap.get("userNo");
		int receipeNo =(int)pointMap.get("receipeNo");
		int receipeUserNo = (int)pointMap.get("receipeUserNo");
		
		String msg = "";
		Map<String, Object> map = new HashMap<String, Object>();
			
	
		recipeService.getMPoint(receipeUserNo);
		recipeService.getRPoint(receipeNo);
		recipeService.addLogUp(userNo, receipeNo, receipeUserNo);
		msg = "게시글을 추천했습니다.";

		int checkDown = recipeService.checkDown(receipeNo, userNo);
		if(checkDown > 0) {
			recipeService.getMPoint(receipeUserNo);
			recipeService.getRPoint(receipeNo);
			recipeService.deleteLogDown(userNo, receipeUserNo,receipeNo);
		};

		int checkLike = recipeService.checkLike(receipeNo, userNo);
		if(checkLike < 0 || checkLike >1) {
			msg = "문제가 발생했습니다. 다시 시도해주세요.";
		}
		
		map.put("msg", msg);
		map.put("checkLike", checkLike);
		
		model.addAttribute("checkLike", checkLike);
		return map;
		
	}
	
	// 좋아요 취소
	@RequestMapping(value = "/recommand2",method = RequestMethod.POST)
	public Map<String, Object> recommand2(@RequestBody Map<String, Object> pointMap, Model model) throws Exception {
		
		int userNo = (int)pointMap.get("userNo");
		int receipeNo =(int)pointMap.get("receipeNo");
		int receipeUserNo = (int)pointMap.get("receipeUserNo");
		
		String msg = "";
		Map<String, Object> map = new HashMap<String, Object>();
		
		recipeService.loseMPoint(receipeUserNo);
		recipeService.loseRPoint(receipeNo);
		recipeService.deleteLog(userNo, receipeUserNo, receipeNo);
		
		msg = "게시글을 추천을 취소했습니다.";

		
		
		int checkLike = recipeService.checkLike(receipeNo, userNo);
		if(checkLike < 0 || checkLike >1) {
			msg = "문제가 발생했습니다. 다시 시도해주세요.";
		}
		map.put("msg", msg);
		map.put("checkLike", checkLike);
		
		model.addAttribute("checkLike", checkLike);
		return map;
		
	}
	
	// 싫어요
	@RequestMapping(value = "/oppose",method = RequestMethod.POST)
	public Map<String, Object> oppose(@RequestBody Map<String, Object> pointMap, Model model)  throws Exception {
	
		int userNo = (int)pointMap.get("userNo");
		int receipeNo =(int)pointMap.get("receipeNo");
		int receipeUserNo = (int)pointMap.get("receipeUserNo");
		
		String msg = "";
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		

		recipeService.loseMPoint(receipeUserNo);
		recipeService.loseRPoint(receipeNo);
		recipeService.addLogDown(userNo, receipeNo, receipeUserNo);
		
		int checkLike = recipeService.checkLike(receipeNo, userNo);
		if(checkLike > 0) {
			recipeService.loseMPoint(receipeUserNo);
			recipeService.loseRPoint(receipeNo);
			recipeService.deleteLog(userNo, receipeUserNo, receipeNo);
			
		};
		msg = "게시물을 싫어요했습니다.";
		
		int checkDown = recipeService.checkDown(receipeNo, userNo);
		if(checkDown < 0 || checkDown >1) {
			msg = "문제가 발생했습니다. 다시 시도해주세요.";
		}	
		map.put("msg", msg);
		map.put("checkDown", checkDown);
		model.addAttribute("checkDown", checkDown);
		
		
		return map;	
		
	}
	
	// 싫어요 취소
	@RequestMapping(value = "/oppose2",method = RequestMethod.POST)
	public Map<String, Object> oppose2(@RequestBody Map<String, Object> pointMap, Model model)  throws Exception {
		
		int userNo = (int)pointMap.get("userNo");
		int receipeNo =(int)pointMap.get("receipeNo");
		int receipeUserNo = (int)pointMap.get("receipeUserNo");
		
		String msg = "";
		
		Map<String, Object> map = new HashMap<String, Object>();
		

		recipeService.getMPoint(receipeUserNo);
		recipeService.getRPoint(receipeNo);
		recipeService.deleteLogDown(userNo, receipeUserNo,receipeNo);
		
		int checkDown = recipeService.checkDown(receipeNo, userNo);
		if(checkDown < 0 || checkDown >1) {
			msg = "문제가 발생했습니다. 다시 시도해주세요.";
		}	
		model.addAttribute("checkDown", checkDown);
		msg = "게시글을 싫어요 취소 했습니다.";

		map.put("msg", msg);	
		map.put("checkDown", checkDown);
		
		return map;	
		
	}
	
	
	// 팔로우
	@RequestMapping(value = "/follow",method = RequestMethod.POST)
	public Map<String, Object> follow(@RequestBody Map<String, Object> followMap, Model model) throws Exception {
		
		int userNo = (int)followMap.get("userNo");
		int receipeUserNo = (int)followMap.get("receipeUserNo");
		
		String msg = "";
		Map<String, Object> map = new HashMap<String, Object>();
			
	
		recipeService.getFollowCnt(receipeUserNo); //ruser_t에 팔로우 카운트업
		recipeService.insertFollower(userNo,receipeUserNo); //rfollow_t에 팔로우 로그업
		
		msg = "팔로우했습니다.";

		int followCheck = recipeService.followCheck(userNo, receipeUserNo); //팔로우를 이미 했는지 rfollow_t에서 확인 카운트
	
		map.put("msg", msg);
		map.put("followCheck", followCheck);
		model.addAttribute("followCheck", followCheck);
		return map;
		
	}
	
	// 팔로우 취소
	@RequestMapping(value = "/follow2",method = RequestMethod.POST)
	public Map<String, Object> follow2(@RequestBody Map<String, Object> pointMap, Model model) throws Exception {
		
		int userNo = (int)pointMap.get("userNo");
		int receipeUserNo = (int)pointMap.get("receipeUserNo");
		
		String msg = "";
		Map<String, Object> map = new HashMap<String, Object>();
		
		recipeService.loseFollowCnt(receipeUserNo); //ruser_t에 팔로우 카운트 다운
		recipeService.deleteFollower(userNo,receipeUserNo); //rfollow_t에 팔로우 로그 삭제
		
		msg = "팔로우를 취소했습니다.";

		int followCheck = recipeService.followCheck(userNo, receipeUserNo); //팔로우 취소했는데 1이상이면 에러 
		if(followCheck > 0) {
			msg = "문제가 발생했습니다. 다시 시도해주세요";
		};
		

		map.put("msg", msg);
		map.put("followCheck", followCheck);
		
		model.addAttribute("followCheck", followCheck);
		return map;
		
	}
	
	
}

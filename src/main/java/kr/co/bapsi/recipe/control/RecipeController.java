package kr.co.bapsi.recipe.control;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bapsi.member.service.MemberService;
import kr.co.bapsi.recipe.service.RecipeService;
import kr.co.bapsi.recipe.vo.FindCriteria;
import kr.co.bapsi.recipe.vo.FindTagCriteria;
import kr.co.bapsi.recipe.vo.IngVO;
import kr.co.bapsi.recipe.vo.PageCriteria;
import kr.co.bapsi.recipe.vo.PagingMaker;
import kr.co.bapsi.recipe.vo.RecipeVO;
import kr.co.bapsi.recipe.vo.TagPageCriteria;
import kr.co.bapsi.recipe.vo.TagPagingMaker;
import kr.co.bapsi.recipe.vo.TagVO;
import kr.co.bapsi.upload.vo.UploadVO;

@Controller
@RequestMapping("/recipe/*")
public class RecipeController {

   ModelAndView mav = new ModelAndView(); // 삭제

   @Autowired
   private RecipeService recipeService;

   @Inject
   private MemberService memberService;
   
   // *************************지영**************************
   // ********************레시피 등록*******************************
   // 로그인상태 추가
   @RequestMapping(value = "/recipe/new", method = RequestMethod.GET)
   public String newRecipe(Model model) {
      System.out.println("레시피 등록!!!");
      List<IngVO> ingList = recipeService.selectAllIngre();
      model.addAttribute("ingList", ingList);
      List<TagVO> tagList = recipeService.selectAllTag();
      model.addAttribute("tagList", tagList);

      model.addAttribute("recipeVO", new RecipeVO());
      model.addAttribute("rIngreVO", new IngVO());
      model.addAttribute("rTagVO", new TagVO());
      return "jsp/recipe/writeRecipe"; //jsp/recipe/writeRecipe
   }

   @RequestMapping(value = "/recipe/new", method = RequestMethod.POST)
   public String newRecipe(@Valid RecipeVO recipeVO, @Valid IngVO rIngreVO, @Valid TagVO rTagVO,
         BindingResult result, RedirectAttributes reAttr) {
      System.out.println("POST : " + recipeVO);

      if (result.hasErrors()) {
         System.out.println("오류발생");
         return "jsp/recipe/writeRecipe";
      }
      recipeService.newRecipe(recipeVO, rIngreVO, rTagVO);
      
      
      reAttr.addFlashAttribute("result", "Write");
      
      return "redirect:/recipe/recipeList"; // url주소: /
   }

   // **********************   //레시피 글 등록 사진*********************************   
      @RequestMapping(value="/recipe/insertImg", method=RequestMethod.POST)
      @ResponseBody
      public String insertImg(@RequestParam("recipeImg")MultipartFile recipeImg, HttpServletRequest request) {
//         System.out.println("test img");
         String dirPath = request.getServletContext().getRealPath("recipeImg"); //파일저장경로
         Random rand= new Random();
         String savedName = rand.nextInt(1000000000)+recipeImg.getOriginalFilename(); //파일저장이름
         File savedFile = new File(dirPath+"/"+savedName); //파일객체
         File savedDir = new File(dirPath);
//         System.out.println("savedFile" + savedName);
//         System.out.println("dir exists:"+savedDir.exists());
//         System.out.println("isDir:"+savedDir.isDirectory());
         
         try {
            recipeImg.transferTo(savedFile);
         } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         return "recipeImg/"+savedName;
      }
   
   // **********************************************************

   
   
   // **********************모달창불러오기*******************************

   @RequestMapping(value="/summernote", method=RequestMethod.GET)
   public String testForm(HttpServletRequest request, @RequestParam Map<String, Object> param, Model model) throws Exception {
       return "jsp/recipe/summernote";
   }
   // **********************************************************
   
   // *******************레시피수정*******************************
   // 아이디 매칭 추가
   @RequestMapping(value = "/recipe/update", method = RequestMethod.GET)
   public String updateRecipe(@RequestParam(value = "no") int no, Model model, PageCriteria pCri) {
      // @RequestMapping(value="/recipe/update", method=RequestMethod.GET)
      // public String updateRecipe(Model model) {
      System.out.println("레시피 수정!!!");
      List<IngVO> ingList = recipeService.selectAllIngre();
      model.addAttribute("ingList", ingList);
      List<TagVO> tagList = recipeService.selectAllTag();
      model.addAttribute("tagList", tagList);

      RecipeVO recipe = recipeService.selectByNo(no);
      List<IngVO> rIngList = recipeService.selectIngByNo(no);
      List<TagVO> rTagList = recipeService.selectTagByNo(no);
      TagVO max = rTagList.get(rTagList.size() - 1);

      model.addAttribute("recipeVO", recipe);
      model.addAttribute("rIngList", rIngList);
      model.addAttribute("rTagList", rTagList);
      model.addAttribute("max", max);
      model.addAttribute("page", pCri.getPage());
      model.addAttribute("numPerPage", pCri.getNumPerPage());

      return "jsp/recipe/updateRecipe";
   }

   @RequestMapping(value = "/recipe/update", method = RequestMethod.POST)
   public String updateRecipe(@RequestParam(value = "no") int no, @Valid RecipeVO recipeVO, BindingResult result,
         PageCriteria pCri, RedirectAttributes reAttr) {

      System.out.println(recipeVO);
      if (result.hasErrors()) {
         System.out.println("오류발생");
         return "jsp/recipe/updateRecipe";
      }
      recipeService.updateRecipe(recipeVO);
      reAttr.addAttribute("no", no);
      reAttr.addAttribute("page", pCri.getPage());
      reAttr.addAttribute("numPerPage", pCri.getNumPerPage());
      reAttr.addFlashAttribute("result", "Update");
      
      return "redirect:/recipe/recipeList";
   }

   // *****************************************************************

   // ***********************정은*****************************

   // *********************레시피 목록 - 전체 List***************************
   /*
    * @RequestMapping(value="/recipe/recipeList", method=RequestMethod.GET) //페이징필요
    * public String selectAllRecipe(PageCriteria pCria, Model model, TagVO tagVO) {
    * // System.out.println(pCria.toString()); model.addAttribute("recipeList",
    * recipeService.listCriteria(pCria));
    * 
    * List<RecipeVO> rList = recipeService.listCriteria(pCria);
    * //System.out.println("rList: " + rList.toString());
    * //System.out.println("rList size: " + rList.size());
    * 
    * PagingMaker pagingMaker = new PagingMaker(); pagingMaker.setCri(pCria);
    * pagingMaker.setTotalData(recipeService.listCountData(pCria));
    * 
    * model.addAttribute("pagingMaker", pagingMaker);
    * 
    * 
    * return "jsp/recipe/recipeList"; }
    */
   
   @RequestMapping(value = "/recipe/recipeList", method = RequestMethod.GET)
   public String list(@ModelAttribute("fCri") FindCriteria fCri, Model model) {

      // model.addAttribute("recipeList", rsvc.listCriteria(fCri));
      model.addAttribute("recipeList", recipeService.findList(fCri));

      PagingMaker pagingMaker = new PagingMaker();
      pagingMaker.setCri(fCri);

//         pagingMaker.setTotalData(rsvc.listCountData(fCri));
      pagingMaker.setTotalData(recipeService.findCountData(fCri));

      model.addAttribute("pagingMaker", pagingMaker);

      return "jsp/recipe/recipeList";

   }

   // *********************레시피 목록 - 태그별 List**************************
   @RequestMapping(value = "/recipe/recipeTagList", method = RequestMethod.GET)
   public String selectTagRecipe(@ModelAttribute("tCri") FindTagCriteria tCri, Model model, TagVO tagVO) {
//      System.out.println(pCria.toString());
      model.addAttribute("recipeList", recipeService.tagListCriteria(tCri));

      model.addAttribute("tagName", tCri.getTagName());

      List<RecipeVO> rList = recipeService.tagListCriteria(tCri);
      // System.out.println("rList: " + rList.toString());
      // System.out.println("rList size: " + rList.size());

      TagPagingMaker TpagingMaker = new TagPagingMaker();
      TpagingMaker.setCri(tCri);
      TpagingMaker.setTotalData(recipeService.listCountData(tCri));

      model.addAttribute("TpagingMaker", TpagingMaker);

      return "jsp/recipe/recipeTagList";
   }

   // *********************레시피 상세페이지 -detail*************************
   @RequestMapping(value = "/recipe/readPage", method = RequestMethod.GET)
   public String selectByNo(@RequestParam("no") int no, @RequestParam("userNo") int userNo, @ModelAttribute("fCri") FindCriteria fCri,
         @RequestParam("click") int click, Model model) throws Exception {
      //조회수
      if (click == 1) {
         recipeService.updateViewCnt(no);
      }

      //게시글 내용
      RecipeVO recipe = recipeService.selectByNo(no);
      model.addAttribute("recipe", recipe);
      List<TagVO> tagList = recipeService.selectTagByNo(no);
      model.addAttribute("tagList", tagList);
      List<IngVO> ingList = recipeService.selectIngByNo(no);
      model.addAttribute("ingList", ingList);

      //좋아요, 싫어요
      int checkLike = recipeService.checkLike(no, userNo);
      model.addAttribute("checkLike", checkLike);
      int checkDown = recipeService.checkDown(no, userNo);
      model.addAttribute("checkDown", checkDown);
      
      //팔로우
      int receipeUserNo = recipe.getUserNo();
      int followCheck = recipeService.followCheck(userNo, receipeUserNo);
      model.addAttribute("followCheck", followCheck);
      
      //작성자 사진
      //int writerNo = recipe.getUserNo(); 
      //UploadVO writerPhoto = memberService.myPagefile(writerNo);
      //model.addAttribute("writerPhoto", writerPhoto.getFile_fakename());
      
      return "jsp/recipe/readPage";
   }

   // *********************레시피 태그 상세페이지 -detail*************************
   @RequestMapping(value = "/recipe/readTagPage", method = RequestMethod.GET)
   public String selectNoByTag(@RequestParam("no") int no, @RequestParam("userNo") int userNo, @ModelAttribute("tCri") FindTagCriteria tCri,
         @RequestParam("click") int click, Model model) throws Exception {

      model.addAttribute("tag", tCri.getTagName());

      if (click == 1) {
         recipeService.updateViewCnt(no);
      } 

      //게시글 내용
      RecipeVO recipe = recipeService.selectByNo(no);
      model.addAttribute("recipe", recipe);
      //게시글 태그
      List<TagVO> tagList = recipeService.selectTagByNo(no);
      model.addAttribute("tagList", tagList);
      //게시글 재료
      List<IngVO> ingList = recipeService.selectIngByNo(no);
      model.addAttribute("ingList", ingList);

      //좋아요 싫어요
      int checkLike = recipeService.checkLike(no, userNo);
      model.addAttribute("checkLike", checkLike);
      int checkDown = recipeService.checkDown(no, userNo);
      model.addAttribute("checkDown", checkDown);
      
      //팔로우
      int receipeUserNo = recipe.getUserNo();
      int followCheck = recipeService.followCheck(userNo, receipeUserNo); 
      model.addAttribute("followCheck", followCheck);
      
      //작성자 사진
      //int writerNo = recipe.getUserNo(); 
      //UploadVO writerPhoto = memberService.myPagefile(writerNo);
      //model.addAttribute("writerPhoto", writerPhoto.getFile_fakename());

      return "jsp/recipe/readTagPage";
   }

// **********************   //레시피 글 삭제*********************************
   @RequestMapping(value = "/recipe/delPage", method = RequestMethod.GET)
   public String delPage(@RequestParam(value = "no") int no, FindCriteria fCri, RedirectAttributes reAttr) {
      recipeService.delete(no);
      reAttr.addAttribute("no", no);
      reAttr.addAttribute("page", fCri.getPage());
      reAttr.addAttribute("numPerPage", fCri.getNumPerPage());
      reAttr.addAttribute("findType", fCri.getFindType());
      reAttr.addAttribute("keyword", fCri.getKeyword());
      
      reAttr.addFlashAttribute("result", "Delete");
      return "redirect:/recipe/recipeList";
   }
   
// ********************** //희승 체크박스 불러오기*********************************
   @RequestMapping(value="/recipe/getCategoryNames", method=RequestMethod.POST)
   @ResponseBody
   public List<TagVO> categoryNames(String type) {
      System.out.println("카테고리 : " + type);
      
      List<TagVO> result = recipeService.getCategoryNames(type);
      
      System.out.println("받아옴 : " + result);
      
      return result;
   };

}
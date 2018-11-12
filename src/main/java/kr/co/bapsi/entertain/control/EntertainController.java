package kr.co.bapsi.entertain.control;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bapsi.entertain.service.EntertainService;
import kr.co.bapsi.entertain.vo.FindCriteria;
import kr.co.bapsi.entertain.vo.MukbangVO;
import kr.co.bapsi.entertain.vo.PagingMaker;
import kr.co.bapsi.entertain.vo.RandomEatVO;
import kr.co.bapsi.recipe.vo.IngVO;

@Controller
public class EntertainController {

   @Inject
   private EntertainService entertainService;
   
   @RequestMapping(value="/youtuber")
   public String mukbang(Model model, MukbangVO mukbang, FindCriteria fCri) throws Exception {
      
      model.addAttribute("mukbangList", entertainService.findMukbang(fCri));
      System.out.println("Controller youtuber : " + fCri.getPage());
      PagingMaker pagingMaker = new PagingMaker();
      pagingMaker.setCri(fCri);
      
      pagingMaker.setTotalData(entertainService.findCountData(fCri));
      model.addAttribute("findCountData", entertainService.findCountData(fCri));
      
      model.addAttribute("pagingMaker", pagingMaker);
      
      return "jsp/entertain/mukbang";
   }
   
   @RequestMapping(value="/WhatToEat")
   public String WhatToEat(Model model, RandomEatVO randomEat) throws Exception {
	  
	      // 랜덤꺼 참고해서 저 안에 넣으면 끝임
	     Random r = new Random();
	      
	     int num = r.nextInt(15) + 1;
	   
	     System.out.println(num);
	   
	     randomEat = entertainService.randomEat(num);
	      
	     model.addAttribute("randomEat", randomEat);
	      
	      
      return "jsp/entertain/randomEat";
   }
  
   // 있는 재료로 만들기
   @RequestMapping("/messiType")
   @ResponseBody
   public List<String> messiType() throws Exception{
      return entertainService.ingredientTypeList();
   }
   
   @RequestMapping(value="/messi")
   @ResponseBody
   public List<IngVO> ingredients(@RequestParam("Sort") String type) throws Exception {
      System.out.println(type);
      
      List<IngVO> ingVO = entertainService.ingredients(type);
      
//      model.addAttribute("ingVO", ingVO);
      
      return ingVO;
   }
   
}
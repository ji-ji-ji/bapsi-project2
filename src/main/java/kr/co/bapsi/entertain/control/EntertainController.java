package kr.co.bapsi.entertain.control;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bapsi.entertain.service.EntertainService;
import kr.co.bapsi.entertain.vo.FindCriteria;
import kr.co.bapsi.entertain.vo.MukbangVO;
import kr.co.bapsi.entertain.vo.PagingMaker;
import kr.co.bapsi.entertain.vo.RandomEatVO;

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
   /*
   @RequestMapping(value="/randomEat")
   public String randomEat(Model model) {
      
      Map<Object, Object> map = new HashMap<Object, Object>();
      
      map.put(1, "치킨");
      map.put(2, "족발");
      map.put(3, "냉면");
      map.put(4, "햄버거");
      map.put(5, "삼겹살");
      map.put(6, "돼지갈비");
      
      Map<Object, Object> map2 = new HashMap<Object, Object>();
      
      map2.put(1, "www.naver.com");
      map2.put(2, "www.google.com");
      map2.put(3, "www.daum.net");
      map2.put(4, "www.ruliweb.com");
      map2.put(5, "wwww.twitch.tv");
      map2.put(6, "kkk");
      
      Set<Object> keys = map.keySet();
      System.out.println(keys);
      Set<Object> keys2 = map.keySet();
      System.out.println(keys2);
      // 랜덤꺼 참고해서 저 안에 넣으면 끝임
      Random r = new Random();
      
      int num = r.nextInt(5) + 1;
      
      Object RandomMenu = map.get(num);
      System.out.println(RandomMenu);
      Object RandomURL = map2.get(num);
      System.out.println(RandomURL);
      
      model.addAttribute("menu", RandomMenu);
      model.addAttribute("URL", RandomURL);
      
      
      
      
      return "jsp/entertain/randomEat";
   }
   */
}
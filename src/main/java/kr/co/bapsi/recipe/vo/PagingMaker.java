package kr.co.bapsi.recipe.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PagingMaker {
   
   private int totalData;   //전체 데이터 갯수
   private int startPage;   //페이지 목록 시작
   private int endPage;   //페이지 목록 끝
   private boolean prev;   //이전버튼
   private boolean next;   //다음버튼
   
   private int displayPageNum = 10;     //페이지 목록에 나타낼 페이지 번호 수 (1~10, 11~20) 
   
   private PageCriteria cri;
   
   public void setCri(PageCriteria cri) {
      this.cri = cri;
   }
   
   public void setTotalData(int totalData) {
      this.totalData = totalData;
      
      getPagingData();
      
   }
   
   private void getPagingData() {
      endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum);
      
      startPage = (endPage - displayPageNum) + 1;
      
      int finalEndPage = (int)(Math.ceil(totalData/(double)cri.getNumPerPage()));
      
      if(endPage > finalEndPage) {
         endPage = finalEndPage;
      }

      prev = startPage == 1 ? false : true;
      
      next = endPage*cri.getNumPerPage() >= totalData ? false : true;
   
   } //getPagingData

   //numPerPage를 받기위한 URI만드는 코드 
   public String makeURI(int page) {
      UriComponents uriComponents =
            UriComponentsBuilder.newInstance()
            .queryParam("page", page)
            .queryParam("numPerPage", cri.getNumPerPage())
            .build();
      return uriComponents.toUriString();
   }
   
   //검색어 URI 만들기
   public String makeFind(int page) {
	      UriComponents uriComponents =
	            UriComponentsBuilder.newInstance()
	            .queryParam("page", page)
	            .queryParam("numPerPage", cri.getNumPerPage())
	            .queryParam("findType", ((FindCriteria)cri).getFindType())
	            .queryParam("keyword", ((FindCriteria)cri).getKeyword())
	            .build();
	      return uriComponents.toUriString();
	   }
	   
   
   //setter getter
   public int getStartPage() {
      return startPage;
   }

   public void setStartPage(int startPage) {
      this.startPage = startPage;
   }

   public int getEndPage() {
      return endPage;
   }

   public void setEndPage(int endPage) {
      this.endPage = endPage;
   }

   public boolean isPrev() {
      return prev;
   }

   public void setPrev(boolean prev) {
      this.prev = prev;
   }

   public boolean isNext() {
      return next;
   }

   public void setNext(boolean next) {
      this.next = next;
   }

   public int getDisplayPageNum() {
      return displayPageNum;
   }

   public void setDisplayPageNum(int displayPageNum) {
      this.displayPageNum = displayPageNum;
   }

   public int getTotalData() {
      return totalData;
   }

   public PageCriteria getCri() {
      return cri;
   }
   
   
   
   
   
   
   
   
   
   

}













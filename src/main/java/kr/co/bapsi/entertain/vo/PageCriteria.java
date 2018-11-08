package kr.co.bapsi.entertain.vo;

public class PageCriteria {
   
   private int page;  //시작페이지를 가르킨다.
   private int numPerPage; //페이지당 넘버를 말한다.
   
   public PageCriteria() {
      this.page =1;
      this.numPerPage=6;
      
      
   }
   
   public void setPage(int page) {
      if(page<=0) {
         this.page = 1;
         return;
      }
      this.page = page;
   }
   
   public void setNumPerPage(int numPerPage) {
      if(numPerPage<=0 || numPerPage>100) {
         this.numPerPage = 6;
         return;
      }
      this.numPerPage = numPerPage;
   }
   
   
   public int getPage() {
      return page;
   }
   
   //paginMaker의 startPage랑 pageCriteria의 startPage는 완전히 다른 개념이다.!!!
   //여기서의 startpage는 현재 페이지의 가장 첫번째  no oderby의 사람의 번호를 뜻함
   public int getStartPage() {
      return (this.page*numPerPage)-(numPerPage-1);
   }
   
   public int getNumPerPage() {
      return numPerPage;
   }
   
   @Override
   public String toString() {
      return "PageCriteria [page="+page+","+"numPerPage="+numPerPage+"]"; 
   }

}
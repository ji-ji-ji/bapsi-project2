package kr.co.bapsi.recipe.vo;

public class PageCriteria {
   
   //시작페이지
   private int page;
   //페이지 당 개수
   private int numPerPage;
   
   public PageCriteria() {
      this.page = 1;
      this.numPerPage = 6;
   }
   
   public void setPage(int page) {
      if(page<=0) {
         this.page = 1;
         return;
      }
      this.page = page;
   }
   
   public void setNumPerPage(int numPerPage) {
      if(numPerPage <= 0 || numPerPage > 100) {
         this.numPerPage = 6;
         return;
      }
      
      this.numPerPage = numPerPage;
      
   }
   
   public int getPage() {
      return page;
   }

   //시작페이지 
   public int getStartPage() {
      return (this.page*numPerPage)-(numPerPage-1);
   }
   
   public int getNumPerPage() {
      return numPerPage;
   }
   
   @Override
   public String toString() {
      return "PageCriteria [page="+page+", "+"numPerPage="+numPerPage+"]";
   }

}
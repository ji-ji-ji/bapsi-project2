package kr.co.bapsi.recipe.vo;

public class TagPageCriteria {
   
   //시작페이지
   private int page;
   //페이지 당 개수
   private int numPerPage;
   
   private String TagName;
   
   @Override
   public String toString() {
      return "TagPageCriteria [page=" + page + ", numPerPage=" + numPerPage + ", TagName=" + TagName + "]";
   }

   public TagPageCriteria(int page, int numPerPage, String TagName) {
      super();
      this.page = page;
      this.numPerPage = numPerPage;
      this.TagName = TagName;
   }

   public String getTagName() {
      return TagName;
   }

   public void setTagName(String TagName) {
      this.TagName = TagName;
   }

   public TagPageCriteria() {
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
   


}
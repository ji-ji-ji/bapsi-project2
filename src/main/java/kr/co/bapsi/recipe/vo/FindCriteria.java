package kr.co.bapsi.recipe.vo;

public class FindCriteria extends PageCriteria {

   private String findType;
   private String keyword;
   
   public FindCriteria() {
      super();
      // TODO Auto-generated constructor stub
   }
   public String getFindType() {
      return findType;
   }
   public void setFindType(String findType) {
      this.findType = findType;
   }
   public String getKeyword() {
      return keyword;
   }
   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }
   public FindCriteria(String findType, String keyword) {
      super();
      this.findType = findType;
      this.keyword = keyword;
   }
   @Override
   public String toString() {
      return "FindCriteria [findType=" + findType + ", keyword=" + keyword + "]";
   }

   
}
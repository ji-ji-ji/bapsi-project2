package kr.co.bapsi.recipe.vo;

public class TagVO {
   private int tagNo;
   private String tagName;
   private String tagType;
   public TagVO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public TagVO(int tagNo, String tagName, String tagType) {
      super();
      this.tagNo = tagNo;
      this.tagName = tagName;
      this.tagType = tagType;
   }
   public int getTagNo() {
      return tagNo;
   }
   public void setTagNo(int tagNo) {
      this.tagNo = tagNo;
   }
   public String getTagName() {
      return tagName;
   }
   public void setTagName(String tagName) {
      this.tagName = tagName;
   }
   public String getTagType() {
      return tagType;
   }
   public void setTagType(String tagType) {
      this.tagType = tagType;
   }
   @Override
   public String toString() {
      return "TagVO [tagNo=" + tagNo + ", tagName=" + tagName + ", tagType=" + tagType + "]";
   }
   
}
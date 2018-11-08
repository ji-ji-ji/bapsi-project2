package kr.co.bapsi.recipe.vo;


public class ReplyVO {
   
   private int no;
   private int recipeNo;
   private int loginUserNo;
   private String  comments;
   private String   regDate;
   private String updateDate;
   private String nickName;
   
   public ReplyVO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public int getRecipeNo() {
      return recipeNo;
   }
   public void setRecipeNo(int recipeNo) {
      this.recipeNo = recipeNo;
   }
   public int getLoginUserNo() {
      return loginUserNo;
   }
   public void setLoginUserNo(int loginUserNo) {
      this.loginUserNo = loginUserNo;
   }
   public String getComments() {
      return comments;
   }
   public void setComments(String comments) {
      this.comments = comments;
   }
   public String getRegDate() {
      return regDate;
   }
   public void setRegDate(String regDate) {
      this.regDate = regDate;
   }
   public String getUpdateDate() {
      return updateDate;
   }
   public void setUpdateDate(String updateDate) {
      this.updateDate = updateDate;
   }
   public String getNickName() {
      return nickName;
   }
   public void setNickName(String nickName) {
      this.nickName = nickName;
   }
   public ReplyVO(int no, int recipeNo, int loginUserNo, String comments, String regDate, String updateDate,
         String nickName) {
      super();
      this.no = no;
      this.recipeNo = recipeNo;
      this.loginUserNo = loginUserNo;
      this.comments = comments;
      this.regDate = regDate;
      this.updateDate = updateDate;
      this.nickName = nickName;
   }
   @Override
   public String toString() {
      return "ReplyVO [no=" + no + ", recipeNo=" + recipeNo + ", loginUserNo=" + loginUserNo + ", comments="
            + comments + ", regDate=" + regDate + ", updateDate=" + updateDate + ", nickName=" + nickName + "]";
   }
   
   
}
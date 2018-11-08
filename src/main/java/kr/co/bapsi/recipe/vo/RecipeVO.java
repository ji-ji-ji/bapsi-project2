package kr.co.bapsi.recipe.vo;

import java.util.List;

public class RecipeVO {
   
   private int no;//번호
   private int userNo; // 로그인아이디번호, 로그인코드 연결 후 수정!!!!
   private String title;
   private String subTitle; 
   private String time;//걸리는 시간
   private String cost;
   private String content;//레시피내용
   private String regDate;
   private int viewCnt;
   private int point;//좋아요 수
   private String userNickName; // 로그인아이디닉네임, 로그인코드 연결 후 수정!!!!
   private String recipeName;
   private int servings;//인분
   private List<Integer> rIngList; // 레시피 재료리스트
   private List<String> amountList; // 레시피 양리스트
   private List<Integer> rTagList; // 레시피 태그리스트
   public RecipeVO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public RecipeVO(int no, int userNo, String title, String subTitle, String time, String cost, String content,
         String regDate, int viewCnt, int point, String userNickName, String recipeName, int servings,
         List<Integer> rIngList, List<String> amountList, List<Integer> rTagList) {
      super();
      this.no = no;
      this.userNo = userNo;
      this.title = title;
      this.subTitle = subTitle;
      this.time = time;
      this.cost = cost;
      this.content = content;
      this.regDate = regDate;
      this.viewCnt = viewCnt;
      this.point = point;
      this.userNickName = userNickName;
      this.recipeName = recipeName;
      this.servings = servings;
      this.rIngList = rIngList;
      this.amountList = amountList;
      this.rTagList = rTagList;
   }
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public int getUserNo() {
      return userNo;
   }
   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getSubTitle() {
      return subTitle;
   }
   public void setSubTitle(String subTitle) {
      this.subTitle = subTitle;
   }
   public String getTime() {
      return time;
   }
   public void setTime(String time) {
      this.time = time;
   }
   public String getCost() {
      return cost;
   }
   public void setCost(String cost) {
      this.cost = cost;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getRegDate() {
      return regDate;
   }
   public void setRegDate(String regDate) {
      this.regDate = regDate;
   }
   public int getViewCnt() {
      return viewCnt;
   }
   public void setViewCnt(int viewCnt) {
      this.viewCnt = viewCnt;
   }
   public int getPoint() {
      return point;
   }
   public void setPoint(int point) {
      this.point = point;
   }
   public String getUserNickName() {
      return userNickName;
   }
   public void setUserNickName(String userNickName) {
      this.userNickName = userNickName;
   }
   public String getRecipeName() {
      return recipeName;
   }
   public void setRecipeName(String recipeName) {
      this.recipeName = recipeName;
   }
   public int getServings() {
      return servings;
   }
   public void setServings(int servings) {
      this.servings = servings;
   }
   public List<Integer> getrIngList() {
      return rIngList;
   }
   public void setrIngList(List<Integer> rIngList) {
      this.rIngList = rIngList;
   }
   public List<String> getAmountList() {
      return amountList;
   }
   public void setAmountList(List<String> amountList) {
      this.amountList = amountList;
   }
   public List<Integer> getrTagList() {
      return rTagList;
   }
   public void setrTagList(List<Integer> rTagList) {
      this.rTagList = rTagList;
   }
   @Override
   public String toString() {
      return "RecipeVO [no=" + no + ", userNo=" + userNo + ", title=" + title + ", subTitle=" + subTitle + ", time="
            + time + ", cost=" + cost + ", content=" + content + ", regDate=" + regDate + ", viewCnt=" + viewCnt
            + ", point=" + point + ", userNickName=" + userNickName + ", recipeName=" + recipeName + ", servings="
            + servings + ", rIngList=" + rIngList + ", amountList=" + amountList + ", rTagList=" + rTagList + "]";
   }

   
}
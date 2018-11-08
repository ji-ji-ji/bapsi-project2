package kr.co.bapsi.recipe.vo;

public class IngVO {
   
   private int ingNo;
   private String ingName;
   private String ingType;
   private String amount;
   public IngVO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public IngVO(int ingNo, String ingName, String ingType, String amount) {
      super();
      this.ingNo = ingNo;
      this.ingName = ingName;
      this.ingType = ingType;
      this.amount = amount;
   }
   public int getIngNo() {
      return ingNo;
   }
   public void setIngNo(int ingNo) {
      this.ingNo = ingNo;
   }
   public String getIngName() {
      return ingName;
   }
   public void setIngName(String ingName) {
      this.ingName = ingName;
   }
   public String getIngType() {
      return ingType;
   }
   public void setIngType(String ingType) {
      this.ingType = ingType;
   }
   public String getAmount() {
      return amount;
   }
   public void setAmount(String amount) {
      this.amount = amount;
   }
   @Override
   public String toString() {
      return "IngVO [ingNo=" + ingNo + ", ingName=" + ingName + ", ingType=" + ingType + ", amount=" + amount + "]";
   }
   
}
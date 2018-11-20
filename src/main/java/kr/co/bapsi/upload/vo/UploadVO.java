package kr.co.bapsi.upload.vo;

public class UploadVO {

   private int no;
   private int userNo;
   private String file_oriname;
   private String file_fakename;
   
   
   public UploadVO() {
      super();
      // TODO Auto-generated constructor stub
   }


   public UploadVO(int no, int userNo, String file_oriname, String file_fakename) {
      super();
      this.no = no;
      this.userNo = userNo;
      this.file_oriname = file_oriname;
      this.file_fakename = file_fakename;
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


   public String getFile_oriname() {
      return file_oriname;
   }


   public void setFile_oriname(String file_oriname) {
      this.file_oriname = file_oriname;
   }


   public String getFile_fakename() {
      return file_fakename;
   }


   public void setFile_fakename(String file_fakename) {
      this.file_fakename = file_fakename;
   }


   @Override
   public String toString() {
      return "UploadVO [no=" + no + ", userNo=" + userNo + ", file_oriname=" + file_oriname + ", file_fakename="
            + file_fakename + "]";
   }
   
   
   
}
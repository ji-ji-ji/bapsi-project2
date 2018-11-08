package kr.co.bapsi.entertain.vo;

public class MukbangVO {

   private int no;
   private String korea;
   private String china;
   private String japan;
   private String usa;
   private String night;
   private String dessert;
   private String youtuber;
   private String url;
   
   
   public MukbangVO() {
      super();
      // TODO Auto-generated constructor stub
   }


   public MukbangVO(int no, String korea, String china, String japan, String usa, String night, String dessert,
         String youtuber, String url) {
      super();
      this.no = no;
      this.korea = korea;
      this.china = china;
      this.japan = japan;
      this.usa = usa;
      this.night = night;
      this.dessert = dessert;
      this.youtuber = youtuber;
      this.url = url;
   }



   public int getNo() {
      return no;
   }


   public void setNo(int no) {
      this.no = no;
   }


   public String getKorea() {
      return korea;
   }


   public void setKorea(String korea) {
      this.korea = korea;
   }


   public String getChina() {
      return china;
   }


   public void setChina(String china) {
      this.china = china;
   }


   public String getJapan() {
      return japan;
   }


   public void setJapan(String japan) {
      this.japan = japan;
   }


   public String getUsa() {
      return usa;
   }


   public void setUsa(String usa) {
      this.usa = usa;
   }


   public String getNight() {
      return night;
   }


   public void setNight(String night) {
      this.night = night;
   }


   public String getDessert() {
      return dessert;
   }


   public void setDessert(String dessert) {
      this.dessert = dessert;
   }


   public String getYoutuber() {
      return youtuber;
   }


   public void setYoutuber(String youtuber) {
      this.youtuber = youtuber;
   }


   public String getUrl() {
      return url;
   }


   public void setUrl(String url) {
      this.url = url;
   }


   @Override
   public String toString() {
      return "MukbangVO [no=" + no + ", korea=" + korea + ", china=" + china + ", japan=" + japan + ", usa=" + usa
            + ", night=" + night + ", dessert=" + dessert + ", youtuber=" + youtuber + ", url=" + url + "]";
   }
   
   
   
   
   
}
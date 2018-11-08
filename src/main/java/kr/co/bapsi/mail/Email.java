package kr.co.bapsi.mail;

//email추가 주
public class Email {
//밥시커밋
	//다시커밋확인 !!!!!!!!!!!!!!!!!
	    private String subject;
	    private String content;
	    private String receiver;
	     
	    public String getReceiver() {
	        return receiver;
	    }
	    public void setReceiver(String receiver) {
	        this.receiver = receiver;
	    }
	 
	    public String getSubject() {
	        return subject;
	    }
	    public void setSubject(String subject) {
	        this.subject = subject;
	    }
	    public String getContent() {
	        return content;
	    }
	    public void setContent(String content) {
	        this.content = content;
	    }
}
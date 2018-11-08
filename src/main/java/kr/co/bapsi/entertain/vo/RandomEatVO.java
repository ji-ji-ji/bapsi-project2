package kr.co.bapsi.entertain.vo;

public class RandomEatVO {
	
	private int no;
	private String food;
	private String url;
	
	public RandomEatVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RandomEatVO(int no, String food, String url) {
		super();
		this.no = no;
		this.food = food;
		this.url = url;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "RandomEat [no=" + no + ", food=" + food + ", url=" + url + "]";
	}
	
	
	

}

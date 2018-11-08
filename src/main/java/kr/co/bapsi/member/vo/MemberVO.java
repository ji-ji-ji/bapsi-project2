package kr.co.bapsi.member.vo;

import java.util.List;

public class MemberVO {

	private int no;
	private String email;
	private String password;
	private String hintq;
	private String hinta;
	private String name;
	private String nickname;
	private String tel;
	private String age;
	private String gender;
	private String comments;
	private String type;
	private int point;
	private int followrCnt;
	private String reg_date;
	private List<Integer> noList;
	private String socialLogin;
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(int no, String email, String password, String hintq, String hinta, String name, String nickname,
			String tel, String age, String gender, String comments, String type, int point, int followrCnt,
			String reg_date, List<Integer> noList, String socialLogin) {
		super();
		this.no = no;
		this.email = email;
		this.password = password;
		this.hintq = hintq;
		this.hinta = hinta;
		this.name = name;
		this.nickname = nickname;
		this.tel = tel;
		this.age = age;
		this.gender = gender;
		this.comments = comments;
		this.type = type;
		this.point = point;
		this.followrCnt = followrCnt;
		this.reg_date = reg_date;
		this.noList = noList;
		this.socialLogin = socialLogin;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHintq() {
		return hintq;
	}

	public void setHintq(String hintq) {
		this.hintq = hintq;
	}

	public String getHinta() {
		return hinta;
	}

	public void setHinta(String hinta) {
		this.hinta = hinta;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getFollowrCnt() {
		return followrCnt;
	}

	public void setFollowrCnt(int followrCnt) {
		this.followrCnt = followrCnt;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public List<Integer> getNoList() {
		return noList;
	}

	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}

	public String getSocialLogin() {
		return socialLogin;
	}

	public void setSocialLogin(String socialLogin) {
		this.socialLogin = socialLogin;
	}

	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", email=" + email + ", password=" + password + ", hintq=" + hintq + ", hinta="
				+ hinta + ", name=" + name + ", nickname=" + nickname + ", tel=" + tel + ", age=" + age + ", gender="
				+ gender + ", comments=" + comments + ", type=" + type + ", point=" + point + ", followrCnt="
				+ followrCnt + ", reg_date=" + reg_date + ", noList=" + noList + ", socialLogin=" + socialLogin + "]";
	}
	
	
	
	}

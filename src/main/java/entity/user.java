package entity;

import jsonInfo.MD5;

public class user {
   public static String[] statuss= {"正常","封号"};
	int id;
	String email;
	String password;
	String tel;
	int level;
	double amount;
	int status;
	String comments;
	
	
	
	
	
	public String getPassword() {
		return password;
	}
	public String getMd5() {
		return MD5.MD5(password);
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus_name() {
		return statuss[status];
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public static String[] getStatuss() {
		return statuss;
	}
	public static void setStatuss(String[] statuss) {
		user.statuss = statuss;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
}

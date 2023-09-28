package com.exercise.myex.user.vo;

public class UserVO {
	private String userId;
	private String userPw;
	private String userNm;
	private String userNic;
	private String userSex;
	private String userAge;
	private String updateDt;
	
	public UserVO(String userId, String userPw, String userNm, String userNic, String userSex, String userAge
			) {
		
		this.userId = userId;
		this.userPw = userPw;
		this.userNm = userNm;
		this.userNic = userNic;
		this.userSex = userSex;
		this.userAge = userAge;
		
	}
	
	public UserVO() {
		
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserNic() {
		return userNic;
	}
	public void setUserNic(String userNic) {
		this.userNic = userNic;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserAge() {
		return userAge;
	}
	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}
	public String getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userNm=" + userNm + ", userNic=" + userNic
				+ ", userSex=" + userSex + ", userAge=" + userAge + ", updateDt=" + updateDt + "]";
	}
	

}

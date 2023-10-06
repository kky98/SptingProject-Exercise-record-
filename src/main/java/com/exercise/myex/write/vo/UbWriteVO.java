package com.exercise.myex.write.vo;

public class UbWriteVO {
	private String userId;
	private float uHeight;
	private float uWeight;
	private float uMus;
	private float uFat;
	private double uBmi;
	private String updateDt;
	
	

	public UbWriteVO() {
		
	}





	public UbWriteVO(float uHeight, float uWeight, float uMus, float uFat, double uBmi, String updateDt) {
		
		this.uHeight = uHeight;
		this.uWeight = uWeight;
		this.uMus = uMus;
		this.uFat = uFat;
		this.uBmi = uBmi;
		this.updateDt = updateDt;
	}





	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public float getuHeight() {
		return uHeight;
	}



	public void setuHeight(float uHeight) {
		this.uHeight = uHeight;
	}



	public float getuWeight() {
		return uWeight;
	}



	public void setuWeight(float uWeight) {
		this.uWeight = uWeight;
	}



	public float getuMus() {
		return uMus;
	}



	public void setuMus(float uMus) {
		this.uMus = uMus;
	}



	public float getuFat() {
		return uFat;
	}



	public void setuFat(float uFat) {
		this.uFat = uFat;
	}



	public double getuBmi() {
		return uBmi;
	}



	public void setuBmi(double uBmi) {
		this.uBmi = uBmi;
	}



	public String getUpdateDt() {
		return updateDt;
	}



	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}



	@Override
	public String toString() {
		return "UbWriteVO [userId=" + userId + ", uHeight=" + uHeight + ", uWeight=" + uWeight + ", uMus=" + uMus
				+ ", uFat=" + uFat + ", uBmi=" + uBmi + ", updateDt=" + updateDt + "]";
	}



	
	
}

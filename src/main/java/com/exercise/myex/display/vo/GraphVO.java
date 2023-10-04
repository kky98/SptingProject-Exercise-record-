package com.exercise.myex.display.vo;

public class GraphVO {
	private String userId;
	private int uWeight;
	private int uMus;
	private int uFat;
	private float uBmi;
	private String updateDt;
	private int squat;
	private int benchpress;
	private int deadlift;
	
	public GraphVO() {
	
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getuWeight() {
		return uWeight;
	}

	public void setuWeight(int uWeight) {
		this.uWeight = uWeight;
	}

	public int getuMus() {
		return uMus;
	}

	public void setuMus(int uMus) {
		this.uMus = uMus;
	}

	public int getuFat() {
		return uFat;
	}

	public void setuFat(int uFat) {
		this.uFat = uFat;
	}

	public float getuBmi() {
		return uBmi;
	}

	public void setuBmi(float uBmi) {
		this.uBmi = uBmi;
	}

	public String getUpdateDt() {
		return updateDt;
	}

	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}

	public int getSquat() {
		return squat;
	}

	public void setSquat(int squat) {
		this.squat = squat;
	}

	public int getBenchpress() {
		return benchpress;
	}

	public void setBenchpress(int benchpress) {
		this.benchpress = benchpress;
	}

	public int getDeadlift() {
		return deadlift;
	}

	public void setDeadlift(int deadlift) {
		this.deadlift = deadlift;
	}

	@Override
	public String toString() {
		return "GraphVO [userId=" + userId + ", uWeight=" + uWeight + ", uMus=" + uMus + ", uFat=" + uFat + ", uBmi="
				+ uBmi + ", updateDt=" + updateDt + ", squat=" + squat + ", benchpress=" + benchpress + ", deadlift="
				+ deadlift + "]";
	}
	
	
	
	
	
}

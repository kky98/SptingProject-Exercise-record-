package com.exercise.myex.write.vo;

public class WriteVO {
		private String exDate;	
		private String userId;	
		private String exCode;
		private String exTitle;
		private String exName;
		private int Weight;	
		private int rep;		
		private Float ceKm;	
		private int ceHour;	
		private int ceMint;
		private int squat;
		private int benchpress;
		private int deadlift;
		
		
		public WriteVO() {
		
		}

		public WriteVO(String exDate, String exCode, int weight, int rep) {
			
			this.exDate = exDate;
			this.exCode = exCode;
			Weight = weight;
			this.rep = rep;
		}

		public WriteVO(String exDate, String exCode, Float ceKm, int ceHour, int ceMint) {
			
			this.exDate = exDate;
			this.exCode = exCode;
			this.ceKm = ceKm;
			this.ceHour = ceHour;
			this.ceMint = ceMint;
		}

		public WriteVO( int squat, int benchpress, int deadlift) {
			
		
			this.squat = squat;
			this.benchpress = benchpress;
			this.deadlift = deadlift;
		}

		public String getExName() {
			return exName;
		}

		public void setExName(String exName) {
			this.exName = exName;
		}

		public String getExDate() {
			return exDate;
		}

		public void setExDate(String exDate) {
			this.exDate = exDate;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getExCode() {
			return exCode;
		}

		public void setExCode(String exCode) {
			this.exCode = exCode;
		}

		public String getExTitle() {
			return exTitle;
		}

		public void setExTitle(String exTitle) {
			this.exTitle = exTitle;
		}

		public int getWeight() {
			return Weight;
		}

		public void setWeight(int weight) {
			Weight = weight;
		}

		public int getRep() {
			return rep;
		}

		public void setRep(int rep) {
			this.rep = rep;
		}

		public Float getCeKm() {
			return ceKm;
		}

		public void setCeKm(Float ceKm) {
			this.ceKm = ceKm;
		}

		public int getCeHour() {
			return ceHour;
		}

		public void setCeHour(int ceHour) {
			this.ceHour = ceHour;
		}

		public int getCeMint() {
			return ceMint;
		}

		public void setCeMint(int ceMint) {
			this.ceMint = ceMint;
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
			return "WriteVO [exDate=" + exDate + ", userId=" + userId + ", exCode=" + exCode + ", exTitle=" + exTitle
					+ ", exName=" + exName + ", Weight=" + Weight + ", rep=" + rep + ", ceKm=" + ceKm + ", ceHour="
					+ ceHour + ", ceMint=" + ceMint + ", squat=" + squat + ", benchpress=" + benchpress + ", deadlift="
					+ deadlift + "]";
		}

		



}

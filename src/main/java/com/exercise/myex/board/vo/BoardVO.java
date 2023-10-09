package com.exercise.myex.board.vo;

public class BoardVO {
	private Integer boardNo;
	private String boardTitle;
	private String boardContent;
	private String userId;
	private String userNm;
	private String createDate;
	private String updateDate;
	
	public BoardVO() {
		
	}

	

	public Integer getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}



	public String getBoardTitle() {
		return boardTitle;
	}



	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}



	public String getBoardContent() {
		return boardContent;
	}



	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}





	public String getUserNm() {
		return userNm;
	}



	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}



	public String getCreateDate() {
		return createDate;
	}



	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}



	public String getUpdateDate() {
		return updateDate;
	}



	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}



	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", userId=" + userId + ", userNm=" + userNm + ", createDate=" + createDate + ", updateDate="
				+ updateDate + "]";
	}



	
}
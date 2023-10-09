package com.exercise.myex.board.vo;

public class ReplyVO {
	
	    private String replyNo;
	    private int boardNo;
	    private String userId;
	    private String userNm;
	    private String replyContent;
	    private String replyDate; 
	    private String delYn;
		public ReplyVO() {
			super();
		}
		public ReplyVO(String replyNo, int boardNo, String userId, String userNm, String replyContent, String replyDate,
				String delYn) {
			this.replyNo = replyNo;
			this.boardNo = boardNo;
			this.userId = userId;
			this.userNm = userNm;
			this.replyContent = replyContent;
			this.replyDate = replyDate;
			this.delYn = delYn;
		}
		public String getReplyNo() {
			return replyNo;
		}
		public void setReplyNo(String replyNo) {
			this.replyNo = replyNo;
		}
		public int getBoardNo() {
			return boardNo;
		}
		public void setBoardNo(int boardNo) {
			this.boardNo = boardNo;
		}
		public String getuserId() {
			return userId;
		}
		public void setuserId(String userId) {
			this.userId = userId;
		}
		public String getuserNm() {
			return userNm;
		}
		public void setuserNm(String userNm) {
			this.userNm = userNm;
		}
		public String getReplyContent() {
			return replyContent;
		}
		public void setReplyContent(String replyContent) {
			this.replyContent = replyContent;
		}
		public String getReplyDate() {
			return replyDate;
		}
		public void setReplyDate(String replyDate) {
			this.replyDate = replyDate;
		}
		public String getDelYn() {
			return delYn;
		}
		public void setDelYn(String delYn) {
			this.delYn = delYn;
		}
	    
		
	    
}

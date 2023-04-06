package data;

import java.sql.Date;

public class Board {
	int boardId;
	String boardPass;
	String title;
	String content;
	String writer;
	Date writed;
	int views;
	
	
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBoardPass() {
		return boardPass;
	}
	public void setBoardPass(String boardPass) {
		this.boardPass = boardPass;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWrited() {
		return writed;
	}
	public void setWrited(Date writed) {
		this.writed = writed;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
}

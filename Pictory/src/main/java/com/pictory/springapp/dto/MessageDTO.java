package com.pictory.springapp.dto;




public class MessageDTO {
	private String dmNo; 
	private int dmRoom;
	private String sendNick;
	private String recvNick;
	private String sendTime;
	private String readTime;
	private String dmContent;
	private String readCheck;
	
	// 현재 사용자의 메세지 상대 nick을 담는다.
	private String other_nick;
	
	// 현재 사용자의 메세지 상대 profile을 담는다.
	private String profile;
	
	// 현재 사용자 nick
	private String nick;
	
	// 안읽은 메세지 갯수 
	private int unread;
	
	
	
	public int getUnread() {
		return unread;
	}
	public void setUnread(int unread) {
		this.unread = unread;
	}
	public String getOther_nick() {
		return other_nick;
	}
	public void setOther_nick(String other_nick) {
		this.other_nick = other_nick;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getDmRoom() {
		return dmRoom;
	}
	public void setDmRoom(int room) {
		this.dmRoom = room;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getDmNo() {
		return dmNo;
	}
	public void setdmNo(String dmNo) {
		this.dmNo = dmNo;
	}
	public String getSendNick() {
		return sendNick;
	}
	public void setSendNick(String sendNick) {
		this.sendNick = sendNick;
	}
	public String getRecvNick() {
		return recvNick;
	}
	public void setRecvNick(String recvNick) {
		this.recvNick = recvNick;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public String getRead_time() {
		return readTime;
	}
	public void setReadTime(String readTime) {
		this.readTime = readTime;
	}
	public String getDmContent() {
		return dmContent;
	}
	public void setDmContent(String dmContent) {
		this.dmContent = dmContent;
	}
	public String getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(String readCheck) {
		this.readCheck = readCheck;
	}
	
	
}
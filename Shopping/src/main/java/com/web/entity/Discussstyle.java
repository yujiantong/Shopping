package com.web.entity;

public class Discussstyle {

	private Integer discussstyleId;
	private String discussstyleName;
	
	public Discussstyle() {
		super();
	}

	public Discussstyle(Integer discussstyleId, String discussstyleName) {
		super();
		this.discussstyleId = discussstyleId;
		this.discussstyleName = discussstyleName;
	}

	public Integer getDiscussstyleId() {
		return discussstyleId;
	}

	public void setDiscussstyleId(Integer discussstyleId) {
		this.discussstyleId = discussstyleId;
	}

	public String getDiscussstyleName() {
		return discussstyleName;
	}

	public void setDiscussstyleName(String discussstyleName) {
		this.discussstyleName = discussstyleName;
	}
	
}

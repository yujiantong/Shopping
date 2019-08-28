package com.web.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Discuss implements Serializable {
	
    private Integer discussId;

    private Users discussUser;

    private String discussComment;

    private Goods discussGood;

    private String discussImg;

    private Date discussDate;
    
    private Discussstyle discussStyle;
    
    private Integer discussService;
    
    private Integer discussLogistics;
    
    private Integer discussQuality;
    
    private List<DiscussImg> imgList;
    

    private static final long serialVersionUID = 1L;

    public Discussstyle getDiscussStyle() {
		return discussStyle;
	}

	public void setDiscussStyle(Discussstyle discussStyle) {
		this.discussStyle = discussStyle;
	}

	public Integer getDiscussId() {
        return discussId;
    }

    public void setDiscussId(Integer discussId) {
        this.discussId = discussId;
    }

    public String getDiscussComment() {
        return discussComment;
    }

    public void setDiscussComment(String discussComment) {
        this.discussComment = discussComment == null ? null : discussComment.trim();
    }

    public String getDiscussImg() {
        return discussImg;
    }

    public void setDiscussImg(String discussImg) {
        this.discussImg = discussImg == null ? null : discussImg.trim();
    }

    public Date getDiscussDate() {
        return discussDate;
    }

    public void setDiscussDate(Date discussDate) {
        this.discussDate = discussDate;
    }

	public Users getDiscussUser() {
		return discussUser;
	}

	public void setDiscussUser(Users discussUser) {
		this.discussUser = discussUser;
	}

	public Goods getDiscussGood() {
		return discussGood;
	}

	public void setDiscussGood(Goods discussGood) {
		this.discussGood = discussGood;
	}

	public Integer getDiscussService() {
		return discussService;
	}

	public void setDiscussService(Integer discussService) {
		this.discussService = discussService;
	}

	public Integer getDiscussLogistics() {
		return discussLogistics;
	}

	public void setDiscussLogistics(Integer discussLogistics) {
		this.discussLogistics = discussLogistics;
	}

	public Integer getDiscussQuality() {
		return discussQuality;
	}

	public void setDiscussQuality(Integer discussQuality) {
		this.discussQuality = discussQuality;
	}

	public List<DiscussImg> getImgList() {
		return imgList;
	}

	public void setImgList(List<DiscussImg> imgList) {
		this.imgList = imgList;
	}
    
}
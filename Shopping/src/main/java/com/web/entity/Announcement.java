package com.web.entity;

import java.io.Serializable;

public class Announcement implements Serializable {
    private Integer announcementId;

    private String announcementType;

    private String announcementName;

    private String announcementPath;

    private static final long serialVersionUID = 1L;

    public Integer getAnnouncementId() {
        return announcementId;
    }

    public void setAnnouncementId(Integer announcementId) {
        this.announcementId = announcementId;
    }

    public String getAnnouncementType() {
        return announcementType;
    }

    public void setAnnouncementType(String announcementType) {
        this.announcementType = announcementType == null ? null : announcementType.trim();
    }

    public String getAnnouncementName() {
        return announcementName;
    }

    public void setAnnouncementName(String announcementName) {
        this.announcementName = announcementName == null ? null : announcementName.trim();
    }

    public String getAnnouncementPath() {
        return announcementPath;
    }

    public void setAnnouncementPath(String announcementPath) {
        this.announcementPath = announcementPath == null ? null : announcementPath.trim();
    }
}
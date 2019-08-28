package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Announcement;

@Repository("AnnouncementMapper")
public interface AnnouncementMapper {
    List<Announcement> findAllAnnouncement();
}
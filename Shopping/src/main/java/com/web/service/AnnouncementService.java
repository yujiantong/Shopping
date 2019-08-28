package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Announcement;
import com.web.mapper.AnnouncementMapper;

@Service("AnnouncementService")
public class AnnouncementService {
	
	@Autowired
	@Qualifier("AnnouncementMapper")
	private AnnouncementMapper announcementMapper;

	/**
	 * 前台首页公告
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Announcement> findAllAnnouncement(){
		return announcementMapper.findAllAnnouncement();
	}
}

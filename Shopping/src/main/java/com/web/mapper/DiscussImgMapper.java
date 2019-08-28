package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.DiscussImg;

@Repository("DiscussImgMapper")
public interface DiscussImgMapper {
	public void saveDiscussImg(DiscussImg discussImg);
	public List<DiscussImg> findAll();
}

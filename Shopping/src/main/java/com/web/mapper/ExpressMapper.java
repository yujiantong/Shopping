package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Express;

@Repository("ExpressMapper")
public interface ExpressMapper {
	public List<Express> findAllExpress();

	public Express findById(Integer expressId);
}

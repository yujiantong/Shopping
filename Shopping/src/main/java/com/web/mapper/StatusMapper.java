package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.entity.Status;
@Repository("StatusMapper")
public interface StatusMapper {
    public List<Status> findAllStatus();
    public Integer updateStatus(Status status);
    public Integer delStatus(Integer statuId);
    public Integer saveStatus(Status status);
    public Status findById(Integer statuId);
}
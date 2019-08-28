package com.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.web.entity.Logistics;
import com.web.entity.Orders;
import com.web.vo.SearchOrderVO;

@Repository("LogisticsMapper")
public interface LogisticsMapper {
    public List<Logistics> findAllLogistics();
    public List<Logistics> findAllLogisticsJoinAll();
    public Integer delLogistics(Integer logisticsId);
    public Integer updateLogistics(Logistics logistics);
    public Integer saveLogistics(Logistics logistics);
    public Logistics findByOrderId(String orderId);
    public List<Logistics> findByVO(SearchOrderVO vo);
    public List<Logistics> findByIdOrDate(@Param("orderId")String orderId,@Param("orderDate")String orderDate);
}
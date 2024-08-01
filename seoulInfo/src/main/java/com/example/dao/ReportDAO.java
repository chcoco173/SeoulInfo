package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.ReportVO;

@Mapper
public interface ReportDAO {
	public void insertReport(ReportVO reportVO);
}

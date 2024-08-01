package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ReportDAO;
import com.example.domain.ReportVO;

@Service
public class ReportServiceImpl implements ReportService{
    @Autowired
    private ReportDAO reportDAO;

    @Override
    public void saveReport(ReportVO reportVO) {
    	reportDAO.insertReport(reportVO);
    }
}

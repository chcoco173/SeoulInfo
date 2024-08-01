package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.ReportVO;
import com.example.service.ReportService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/product/sale_report")
    public String showReportForm(@RequestParam("selectedUserId") String selectedUserId, Model model) {
    	System.out.println("판매자신고 아이디!!!!"+selectedUserId);
        model.addAttribute("selectedUserId", selectedUserId);
        return "/product/sale_report";
    }

    @PostMapping("/report")
    public String submitReport(@RequestParam("member_id") String memberId,
                               @RequestParam("report_reason") String reportReason,
                               @RequestParam("report_cate") String reportCate) {
        ReportVO reportVO = new ReportVO();
        reportVO.setMember_id(memberId);
        reportVO.setReport_reason(reportReason);
        reportVO.setReport_cate(reportCate);

        reportService.saveReport(reportVO);
        return "redirect:/reportSuccess";
    }
}

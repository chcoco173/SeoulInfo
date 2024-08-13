package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.FestRevCommentVO;
import com.example.domain.ReportVO;
import com.example.service.FestRevCommentService;
import com.example.service.ReportService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;
    
    @Autowired
    private FestRevCommentService festRevCommentService;

    @GetMapping("/product/sale_report")
    public String showReportForm(@RequestParam("selectedUserId") String selectedUserId, Model model) {
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
    
    // 축제 댓글 신고
    @GetMapping("/festival/reportComment")
    public void reportComment(@RequestParam("comment_id") Integer commentId, 
                                @RequestParam("report_reason") String reportReason,
                                @RequestParam("comment_author") String commentAuthor) {
        System.out.println("댓글 신고!! 댓글 ID: " + commentId + ", 신고 사유: " + reportReason);
        try {
            // 신고할 댓글을 가져옴
            FestRevCommentVO comment = festRevCommentService.getComment(commentId);
            if (comment != null) {
                // 신고 처리 로직 추가
                ReportVO reportVO = new ReportVO();
                reportVO.setMember_id(commentAuthor); // 신고 대상 작성자 ID 설정
                reportVO.setReport_reason(reportReason);
                reportVO.setReport_cate("축제댓글");
                reportVO.setFrc_id(commentId); // 신고 대상 댓글 ID 설정
                reportService.saveReport(reportVO);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

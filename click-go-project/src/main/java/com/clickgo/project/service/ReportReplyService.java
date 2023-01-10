package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.Report;
import com.clickgo.project.entity.ReportReply;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.repository.IReportReplyRepository;
import com.clickgo.project.repository.IReportRepository;

@Service
public class ReportReplyService {

	@Autowired
	private IReportRepository reportRepository;
	@Autowired
	private IReportReplyRepository reportReplyRepository;

	@Transactional
	public ReportReply findByReportId(int reportId) {
		return reportReplyRepository.findByReportId(reportId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 신고글을 찾을 수 없습니다.");
		});

	}

	@Transactional
	public void saveReply(Report report, ReportReply reportReply) {
		reportReply.setReport(report);
		reportReply.setContent(reportReply.getContent());
		reportRepository.findById(report.getId()).get().setApproveStatus(ApproveStatus.COMPLETED);
		reportReplyRepository.save(reportReply);
	}

	@Transactional
	public Page<Report> findAllReport(Pageable pageable) {
		return reportRepository.findAll(pageable);
	}
}

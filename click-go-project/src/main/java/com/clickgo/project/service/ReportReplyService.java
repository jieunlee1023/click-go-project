package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.dto.res.ReportReply;
import com.clickgo.project.repository.IReportReplyRepository;

@Service
public class ReportReplyService {

	@Autowired
	private IReportReplyRepository reportReplyRepository;

	@Transactional
	public ReportReply findByReportId(int reportId) {
		return reportReplyRepository.findByReportId(reportId).orElseGet(() -> {
			return null;
		});
	}
}

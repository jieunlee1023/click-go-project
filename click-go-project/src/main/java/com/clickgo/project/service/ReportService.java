package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.dto.res.Report;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.repository.IReportRepository;

@Service
public class ReportService {

	@Autowired
	private IReportRepository reportRepository;

	@Transactional
	public Page<Report> searchReport(Pageable pageable) {
		return reportRepository.findAll(pageable);
	}

	@Transactional
	public Page<Report> findByUserId(int userId, Pageable pageable) {
		return reportRepository.findByUserId(userId, pageable);
	}

	@Transactional
	public Report findByIdAndUserId(int id, User user) {
		return reportRepository.findByIdAndByUserId(id, user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("존재하지 않는 신고글이거나 권한이 없는 회원님입니다.");
		});
	}
}

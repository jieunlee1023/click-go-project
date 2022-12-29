package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.dto.res.Report;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.model.enums.ApproveStatus;
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
	public Page<Report> findByUserIdToSTORE(int userId, Pageable pageable) {
		System.out.println(reportRepository.findByUserIdToSTORE(userId, pageable).getTotalElements());
		return reportRepository.findByUserIdToSTORE(userId, pageable);
	}

	public Page<Report> findByUserIdToUSER(int id, Pageable pageable) {
		return reportRepository.findByUserIdToUSER(id, pageable);
	}

	@Transactional
	public Report findByIdAndUserId(int id, User user) {
		return reportRepository.findByIdAndByUserId(id, user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("존재하지 않는 신고글이거나 권한이 없는 회원님입니다.");
		});
	}

	@Transactional
	public Report findById(int id) {
		Report reportEntity = reportRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("존재하지 않는 신고글입니다.");
		});
		reportEntity.setApproveStatus(ApproveStatus.COMPLETED);
		return reportEntity;
	}
}

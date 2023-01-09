package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.Report;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.model.enums.ReportType;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.repository.IReportRepository;
import com.clickgo.project.repository.IStoreRepository;
import com.clickgo.project.repository.IUserRepository;

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
		return reportRepository.findByUserIdToSTORE(userId, pageable);
	}

	@Transactional
	public Page<Report> findByStoreIdToSTORE(int userId, Pageable pageable) {
		return reportRepository.findByStoreIdToSTORE(userId, pageable);
	}

	@Transactional
	public Page<Report> findByUserIdToUSER(int id, Pageable pageable) {
		return reportRepository.findByUserIdToUSER(id, pageable);
	}

	@Transactional
	public Report findByIdAndUserId(int id) {
		return reportRepository.findByIdAndByUserId(id).orElseThrow(() -> {
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

	public void saveToGEUST(Report report, Store store, User user) {
		report.setStore(store);
		report.setUser(user);
		report.setReportType(ReportType.USER);
		report.setApproveStatus(ApproveStatus.WATING);
		reportRepository.save(report);
	}

	public void saveToSTORE(Report report, Store store, User user) {
		report.setStore(store);
		report.setUser(user);
		report.setReportType(ReportType.STORE);
		report.setApproveStatus(ApproveStatus.WATING);
		reportRepository.save(report);
	}
}

package com.clickgo.project.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.dto.res.ReportReply;

public interface IReportReplyRepository extends JpaRepository<ReportReply, Integer> {

	@Query(value = "SELECT * FROM ReportReply WHERE reportId = ?1", nativeQuery = true)
	Optional<ReportReply> findByReportId(int storeId);
}

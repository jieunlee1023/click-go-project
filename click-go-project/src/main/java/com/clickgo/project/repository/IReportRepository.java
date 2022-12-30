package com.clickgo.project.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.Report;

public interface IReportRepository extends JpaRepository<Report, Integer> {

	@Query(value = " SELECT * FROM Report WHERE id = ?1 ", nativeQuery = true)
	Optional<Report> findByIdAndByUserId(int id);

	// GEUST가 받은 신고
	// 즉, STORE가 GEUST에게 한 신고 내역
	@Query(value = " SELECT * FROM Report WHERE userId = ?1 AND reportType = 'USER' ", nativeQuery = true)
	Page<Report> findByUserIdToUSER(int userId, Pageable pageable);

	// STORE가 받은 신고
	// 즉, GEUST가 STORE에게 한 신고 내역
	@Query(value = " SELECT r.* "
								+ " FROM report AS r "
								+ " JOIN store AS s "
								+ " ON r.storeId = s.id "
								+ " WHERE s.userId = ?1 "
								+ " AND r.reportType = 'STORE' "
								, nativeQuery = true)
	Page<Report> findByUserIdToSTORE(int id, Pageable pageable);
}

package com.clickgo.project.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.dto.res.Report;

public interface IReportRepository extends JpaRepository<Report, Integer> {

	@Query(value = " SELECT * FROM Report WHERE userId = ?1 ", nativeQuery = true)
	Page<Report> findByUserId(int userId, Pageable pageable);

	@Query(value = " SELECT * FROM Report WHERE id = ?1 AND userId = ?2", nativeQuery = true)
	Optional<Report> findByIdAndByUserId(int id, int userId);
}

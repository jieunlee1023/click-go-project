package com.clickgo.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.dto.res.CsBoard;

// sw
public interface IBoardRepository extends JpaRepository<CsBoard, Integer> {

	@Query(value = " SELECT  "
			+ "    * "
			+ " FROM "
			+ "    csboard "
			+ " WHERE "
			+ "    title LIKE '%?1%' ", nativeQuery = true)
	Page<CsBoard> findByTitleContaining1(String q, Pageable pageable);

}

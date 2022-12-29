package com.clickgo.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.CsBoard;

// sw
public interface IBoardRepository extends JpaRepository<CsBoard, Integer> {
	
	Page<CsBoard> findByTitleContaining(String q, Pageable pageable);

	
//	@Query(value = " SELECT * FROM CsBoard WHERE content LIKE '%?1%' ", nativeQuery = true)
//	CsBoard findByTitleContaining2(String q, Pageable pageable);
}

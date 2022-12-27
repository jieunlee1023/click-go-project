package com.clickgo.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.clickgo.project.dto.res.CsBoard;

// sw
public interface IBoardRepository extends JpaRepository<CsBoard, Integer>{

	
	Page<CsBoard> findByTitleContaining(String q, Pageable pageable);
}

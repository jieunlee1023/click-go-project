package com.clickgo.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.clickgo.project.entity.OneToOneAsk;

public interface IOneToOneAskRepository extends JpaRepository<OneToOneAsk, Integer> {

	Page<OneToOneAsk> findByTitleContaining(String q, Pageable pageable);

}

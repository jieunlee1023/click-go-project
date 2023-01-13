package com.clickgo.project.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.Store;

public interface IStoreRepository extends JpaRepository<Store, Integer>{

	@Query(value = 
			" SELECT * "
			+ " FROM Store "
			+ " WHERE userId = ?1 "
			, nativeQuery = true)
	List<Store> findAllByUserId(int id);

	@Query(value = " SELECT * "
			+ " FROM store "
			+ " WHERE categoryId = ?1 "
			+ " AND storename like %?2% "
			, nativeQuery = true)
	Page<Store> findAllByStoreCategory(String pageName, String q, Pageable pageable);

	@Query(value = " SELECT * "
								+ " FROM store "
								+ " WHERE storename LIKE %?1% "
								, nativeQuery = true)
	Page<Store> findByStoreNameContaining(String q, Pageable pageable);




}

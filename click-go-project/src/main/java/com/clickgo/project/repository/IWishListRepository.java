package com.clickgo.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.LikeStore;

public interface IWishListRepository extends JpaRepository<LikeStore, Integer> {

	@Query(value = 
			" SELECT  "
			+ "    l.* "
			+ " FROM "
			+ "    LikeStore AS l "
			+ "        JOIN "
			+ "    Store AS s "
			+ " ON l.storeId = s.id "
			+ " WHERE "
			+ "    l.userId = ?1 "
			, nativeQuery = true)
	Page<LikeStore> findByUserId(int userId, Pageable pageable);
	
	@Query(value = 
			 " SELECT  "
			+ "    l.* "
			+ " FROM "
			+ "    LikeStore AS l "
			+ "        JOIN "
			+ "    Store AS s "
			+ " ON l.storeId = s.id "
			+ " WHERE "
			+ "    l.userId = ?1 "
			+ " AND s.kategoryId = ?2 "
			, nativeQuery = true)
	Page<LikeStore> findByCategory(int userId, String kategory, Pageable pageable);
}

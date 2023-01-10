package com.clickgo.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.clickgo.project.entity.LikeStore;

public interface ILikeStoreRepository extends JpaRepository<LikeStore, Integer> {

	@Query(value = " SELECT * FROM likestore "
			+ " WHERE storeId = :storeId "
			+ " AND  userId = :userId " , nativeQuery = true)
	LikeStore findByUserIdAndStoreId(@Param("storeId") int storeId, @Param("userId") int userId);
	

}

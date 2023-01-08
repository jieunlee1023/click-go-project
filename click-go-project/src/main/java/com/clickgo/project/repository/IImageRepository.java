package com.clickgo.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.Image;

public interface IImageRepository extends JpaRepository<Image, Integer>{

	@Query(value = " SELECT * "
								+ " FROM image "
								+ " WHERE storeId = ?1 "
								, nativeQuery = true)
	List<Image> findByStoreId(int id);

	
	@Query(value = " SELECT *  "
			+ " FROM image "
			+ " GROUP BY storeId; ", nativeQuery = true)
	List<Image> findStoreImage();
}

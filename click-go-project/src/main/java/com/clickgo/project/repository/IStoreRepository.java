package com.clickgo.project.repository;

import java.util.List;

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

}

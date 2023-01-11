package com.clickgo.project.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.Admin;

public interface IAdminRepository extends JpaRepository<Admin, Integer> {

	@Query(value = " SELECT * FROM admin " 
						+ " WHERE userId = ?1 ", nativeQuery = true)
	Admin findbyUserId(int userId);

}

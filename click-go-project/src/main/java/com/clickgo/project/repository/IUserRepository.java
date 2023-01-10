package com.clickgo.project.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.User;

public interface IUserRepository extends JpaRepository<User, Integer> {

	@Query(value = " SELECT * FROM user WHERE username = ?1 ", nativeQuery = true)
	Optional<User> findByUsername(String username);

	@Query(value = " select * from User where email = ?1 ", nativeQuery = true)
	Optional<User> findByEmail(String email);

	@Query(value = " select * from user where username = ?1 and email = ?2 ", nativeQuery = true)
	Optional<User> findByPassword(String username, String email);

	Page<User> findByUsernameContaining(String q, Pageable pageable);

	
	
	

}

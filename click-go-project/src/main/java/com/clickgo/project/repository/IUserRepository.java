package com.clickgo.project.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.dto.res.User;

public interface IUserRepository extends JpaRepository<User, Integer> {

	@Query(value = " SELECT * FROM user WHERE username = ?1 ", nativeQuery = true)
	Optional<User> findByUsername(String username);

}

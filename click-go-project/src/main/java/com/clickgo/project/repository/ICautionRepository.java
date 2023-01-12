package com.clickgo.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.Caution;

public interface ICautionRepository extends JpaRepository<Caution, Integer> {

	@Query(value = " SELECT c.* "
								+ " FROM caution AS c "
								+ " WHERE c.id = ( SELECT MAX(id) FROM caution WHERE userId = ?1 ) "
								, nativeQuery = true)
	Caution findLastIdByUserId(int id);

}

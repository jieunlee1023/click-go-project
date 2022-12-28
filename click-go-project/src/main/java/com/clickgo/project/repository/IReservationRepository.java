package com.clickgo.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.dto.res.Reservation;

public interface IReservationRepository extends JpaRepository<Reservation, Integer> {

	@Query(value = " SELECT "
			+ " r.* "
			+ " FROM Reservation AS r "
			+ " JOIN store AS s "
			+ " ON r.storeId = s.id "
			+ " WHERE s.storeName LIKE %?1% "
			, nativeQuery = true)
	public Page<Reservation> findByTitleContaining(String q, Pageable pageable);
}

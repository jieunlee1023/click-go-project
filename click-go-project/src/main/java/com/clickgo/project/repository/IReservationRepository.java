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
			+ " WHERE r.userId = ?1 "
			+ " AND s.storeName LIKE %?2% "
			, nativeQuery = true)
	public Page<Reservation> findByTitleContaining(int id, String q, Pageable pageable);
}

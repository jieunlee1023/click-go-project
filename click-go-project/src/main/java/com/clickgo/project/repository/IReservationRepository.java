package com.clickgo.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.dto.res.Reservation;

public interface IReservationRepository extends JpaRepository<Reservation, Integer> {

	@Query(value = " SELECT "
								+ " * "
								+ " FROM Reservation "
								+ " WHERE userId = ?1 "
								, nativeQuery = true)
	public Page<Reservation> findByReservation(int id, Pageable pageable);
	 
	@Query(value = " SELECT r.* "
			+ " FROM Reservation as r "
			+ " JOIN store as s "
			+ " ON s.id = r.storeId "
			+ " JOIN user as u "
			+ " ON u.id = s.userId "
			+ " WHERE s.userId = ?1 "
			, nativeQuery = true)
	public Page<Reservation> findByHostReservation(int id, Pageable pageable);
	
}

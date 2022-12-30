package com.clickgo.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.clickgo.project.entity.Reservation;

public interface IReservationRepository extends JpaRepository<Reservation, Integer> {

	@Query(value = " SELECT "
								+ " * "
								+ " FROM reservation "
								+ " WHERE userId = ?1 "
								, nativeQuery = true)
	public Page<Reservation> findByReservation(int id, Pageable pageable);
	 
	@Query(value = " SELECT A.* "
			+ " FROM reservation AS A "
			+ " JOIN store AS S "
			+ " ON S.id = A.storeId "
			+ " JOIN user AS U "
			+ " ON U.id = S.userId "
			+ " WHERE S.userId = :id "
			, nativeQuery = true)
	public  Page<Reservation> findByHostReservation1(@Param("id") int id, Pageable pageable);
	
}


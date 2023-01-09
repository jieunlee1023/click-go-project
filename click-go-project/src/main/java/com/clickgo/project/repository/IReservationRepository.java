package com.clickgo.project.repository;

import java.util.List;

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
	 
	@Query(value = " SELECT * "
			+ "FROM reservation "
			+ "WHERE id IN (SELECT MAX(r.id) "
									+ " FROM reservation AS r "
									+ " JOIN store AS s "
									+ " ON r.storeId = s.id "
									+ " WHERE s.userId = ?1 "
									+ " GROUP BY r.userId "
														+ " , r.reservationTime "
														+ " , r.reservationDate "
														+ " , r.endTime "
														+ " , r.endDate) "
			, nativeQuery = true)
	public  Page<Reservation> findByHostReservation1(int id, Pageable pageable);

	@Query(value = " SELECT A.* "
			+ " FROM reservation AS A "
			+ " JOIN store AS S "
			+ " ON S.id = A.storeId "
			+ " WHERE S.id = :id "
			, nativeQuery = true)
	public List<Reservation> findByStoreId(@Param("id") int storeId);

	@Query(value = " SELECT MAX(id) "
								+ " FROM reservation "
									, nativeQuery = true)
	public int findLastPK();

	@Query(value = " SELECT A.* "
								+ " FROM reservation AS A "
								+ " JOIN store AS S "
								+ " ON S.id = A.storeId "
								+ " WHERE S.id = :id "
								+ " AND NOT approveStatus = 'REJECT' "
								, nativeQuery = true)
	public List<Reservation> findByStoreIdAndNotReject(int storeId);
	
}


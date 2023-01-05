package com.clickgo.project.repository;

import java.util.List;
import java.util.Optional;

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
	
	
	
	@Query(value = " SELECT s.storeName, SUM(r.price )FROM store AS s "
			+ " JOIN reservation AS r "
			+ " ON s.id = r.storeId "
			+ " GROUP BY storeName ")
	Page<Reservation> findBySales(Pageable pageable);
}


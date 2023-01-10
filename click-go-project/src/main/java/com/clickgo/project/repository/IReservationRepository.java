package com.clickgo.project.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.clickgo.project.entity.Reservation;

public interface IReservationRepository extends JpaRepository<Reservation, Integer> {
	

	@Query(value = " SELECT " + " * " + " FROM reservation " + " WHERE userId = ?1 ", nativeQuery = true)
	public Page<Reservation> findByReservation(int id, Pageable pageable);

	@Query(value = " SELECT * " + "FROM reservation " + "WHERE id IN (SELECT MAX(r.id) " + " FROM reservation AS r "
			+ " JOIN store AS s " + " ON r.storeId = s.id " + " WHERE s.userId = ?1 " + " GROUP BY r.userId "
			+ " , r.reservationTime " + " , r.reservationDate " + " , r.endTime "
			+ " , r.endDate) ", nativeQuery = true)
	public Page<Reservation> findByHostReservation1(int id, Pageable pageable);

	@Query(value = " SELECT A.* " + " FROM reservation AS A " + " JOIN store AS S " + " ON S.id = A.storeId "
			+ " WHERE S.id = :id ", nativeQuery = true)
	public List<Reservation> findByStoreId(@Param("id") int storeId);

	@Query(value = " SELECT MAX(id) " + " FROM reservation ", nativeQuery = true)
	public int findLastPK();

	@Query(value = " SELECT A.* " + " FROM reservation AS A " + " JOIN store AS S " + " ON S.id = A.storeId "
			+ " WHERE S.id = :id " + " AND NOT approveStatus = 'REJECT' ", nativeQuery = true)
	public List<Reservation> findByStoreIdAndNotReject(int storeId);
	
	@Query(value = " SELECT A.* "
			+ " FROM reservation AS A "
			+ " JOIN store AS S "
			+ " ON S.id = A.storeId "
			+ " WHERE S.id = :id "
			+ " AND approveStatus = 'APPROVED' "
			, nativeQuery = true)
	public List<Reservation> findByStoreIdAndApprove(@Param("id") int storeId);
	
	
	
	 


	@Query(value = " SELECT * "
								+ " FROM reservation "
								+ " WHERE storeId = ?1 "
								+ " AND endDate = ?2 "
								+ " AND reservationDate = ?2 "
								+ " AND approveStatus != 'REJECT' "
								, nativeQuery = true)
	public List<Reservation> findTodaySalesByStoreId(int storeId, String nowDate);

	@Query(value = " SELECT * "
								+ " FROM reservation "
								+ " WHERE storeId = ?1 "
								+ " AND endDate LIKE %?2% "
								+ " AND reservationDate LIKE %?2% "
								+ " AND approveStatus != 'REJECT' "
								, nativeQuery = true)
	public List<Reservation> findMonthSalesByStoreId(int storeId, String yearAndMonth);

	@Query(value = " SELECT * "
								+ " FROM reservation "
								+ " WHERE storeId = ?1 "
								+ " AND endDate LIKE %?2% "
								+ " AND reservationDate LIKE %?2% "
								+ " AND approveStatus != 'REJECT' "
								, nativeQuery = true)
	public List<Reservation> findYearSalesByStoreId(int storeId, int nowYear);

	@Query(value = " SELECT * "
								+ " FROM reservation "
								+ " WHERE approveStatus != 'REJECT' "
								+ " GROUP BY reservationDate "
								, nativeQuery = true) 
	public List<Reservation> findAllOfMonthNotReject();

	@Query(value = " SELECT * "
								+ " FROM reservation AS r "
								+ " JOIN store AS s "
								+ " ON r.storeId = s.id "
								+ " WHERE r.approveStatus != 'REJECT' "
								+ " AND reservationDate = ?1 "
								+ " AND endDate = ?1 "
								+ " GROUP BY s.categoryId "
								, nativeQuery = true) 
	public List<Reservation> findAllGroupByCategoryIdWhenToday(String today);

	@Query(value = " SELECT r.* "
								+ " FROM reservation AS r "
								+ " JOIN store AS s "
								+ " ON r.storeId = s.id "
								+ " WHERE r.approveStatus != 'REJECT' "
								+ " AND reservationDate LIKE %?1% "
								+ " AND endDate LIKE %?1% "
								+ " GROUP BY s.categoryId "
								, nativeQuery = true) 
	public List<Reservation> findAllGroupByCategoryIdWhenThisMonth(String yearAndMonth);

	@Query(value = " SELECT r.* "
								+ " FROM reservation AS r "
								+ " JOIN store AS s "
								+ " ON r.storeId = s.id "
								+ " WHERE r.approveStatus != 'REJECT' "
								+ " AND reservationDate LIKE %?1% "
								+ " AND endDate LIKE %?1% "
								+ " GROUP BY s.categoryId "
								, nativeQuery = true) 
	public List<Reservation> findAllGroupByCategoryIdWhenThisYear(int nowYear);
}

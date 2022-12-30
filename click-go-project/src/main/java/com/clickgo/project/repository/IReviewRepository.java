package com.clickgo.project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.Review;
import com.clickgo.project.entity.User;

public interface IReviewRepository extends JpaRepository<Review, Integer> {

	// return User가 가게에 작성한 리뷰
	@Query(value = " SELECT * "
								+ " FROM review "
								+ " WHERE userId = ?1 "
								, nativeQuery = true)
	Page<Review> findByUserId(int userId, Pageable pageable);

	@Query(value = " SELECT r.* "
								+ " FROM review as r "
								+ " JOIN store as s "
								+ " ON s.id = r.storeId "
								+ " WHERE s.userId = ?1 "
								, nativeQuery = true)
	Page<Review> findByStoreUserId(int userId, Pageable pageable);
}

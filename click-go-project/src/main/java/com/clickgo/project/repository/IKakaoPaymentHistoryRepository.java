package com.clickgo.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.dto.res.kakaoPay.KakaoPaymentHistory;

public interface IKakaoPaymentHistoryRepository extends JpaRepository<KakaoPaymentHistory, Integer> {

	@Query(value = " SELECT * "
								+ " FROM kakaopaymenthistory "
								+ " WHERE partnerOrderId = ?1 "
								, nativeQuery = true)
	KakaoPaymentHistory findByReservationId(int reservationId);
}

package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clickgo.project.dto.res.kakaoPay.KakaoPaymentHistory;
import com.clickgo.project.repository.IKakaoPaymentHistoryRepository;

@Service
public class KakaoPaymentHistoryService {

	@Autowired
	private IKakaoPaymentHistoryRepository kakaoPaymentHistoryRepository;

	public void save(KakaoPaymentHistory body) {
		kakaoPaymentHistoryRepository.save(body);
	}

	public KakaoPaymentHistory findByReservationId(int storeId) {
		return kakaoPaymentHistoryRepository.findByReservationId(storeId);
	}
}

package com.clickgo.project.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.clickgo.project.dto.res.Reservation;
import com.clickgo.project.repository.IReservationRepository;

@Service
public class ReservationService {

	@Autowired
	private IReservationRepository reservationRepository;

	@Transactional
	public Page<Reservation> searchBoard(String q, int id, Pageable pageable) {
		return reservationRepository.findByTitleContaining(id, q, pageable);
	}

	@Transactional
	public Page<Reservation> searchAllBoard(Pageable pageable) {
		return reservationRepository.findAll(pageable);
	}
}

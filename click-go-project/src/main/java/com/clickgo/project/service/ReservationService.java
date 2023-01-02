package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.repository.IReservationRepository;

@Service
public class ReservationService {

	@Autowired
	private IReservationRepository reservationRepository;

	@Transactional
	public Page<Reservation> searchBoard(User user, Pageable pageable) {
		if (user.getRole().equals(RoleType.GEUST)) {
			return reservationRepository.findByReservation(user.getId(), pageable);
		} else {
			return reservationRepository.findByHostReservation1(user.getId(), pageable);
		}
	}

	@Transactional
	public Page<Reservation> searchAllBoard(Pageable pageable) {
		return reservationRepository.findAll(pageable);
	}

	@Transactional
	public void save(Reservation reservation) {
		reservationRepository.save(reservation);
	}
}

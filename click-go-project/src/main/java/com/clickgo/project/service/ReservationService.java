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
			System.out.println("손님");
			return reservationRepository.findByReservation(user.getId(), pageable);
		} else {
			System.out.println("사장님");
			System.out.println(user.getId());
			return reservationRepository.findByHostReservation1(1, pageable);
		}
	}

	@Transactional
	public Page<Reservation> searchAllBoard(Pageable pageable) {
		return reservationRepository.findAll(pageable);
	}
}

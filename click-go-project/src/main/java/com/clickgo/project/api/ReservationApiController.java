package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.service.ReservationService;

@RestController
@RequestMapping("/api/reservation")
public class ReservationApiController {

	@Autowired
	private ReservationService reservationService;
	
	public ResponseDto<?> myReservationList() {
		
		return null;
	}
}

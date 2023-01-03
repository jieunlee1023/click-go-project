package com.clickgo.project.api;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.dto.res.ReservationTimeDto;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Store;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreService;

@RestController
@RequestMapping("/api/reservation")
public class ReservationApiController {

	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private StoreService storeService;

	@PostMapping("/time-check/{storeId}")
	public ResponseDto<?> timeCheck(@PathVariable int storeId, @RequestBody ReservationTimeDto timeDto, Model model) {
		Store storeEntity = storeService.findById(storeId);
		
		StringTokenizer startHourTokenizer = new StringTokenizer(timeDto.getStartTime(), ":");
		int startHour = Integer.parseInt(startHourTokenizer.nextToken());
		int startMinute = Integer.parseInt(startHourTokenizer.nextToken());

		List<Integer> seats = new ArrayList<>();
		List<Reservation> reservations = reservationService.findByStoreId(storeId);
		reservations.forEach(t -> {
			StringTokenizer findHourTokenizer = new StringTokenizer(t.getEndTime(), ":");
			int findHour = Integer.parseInt(findHourTokenizer.nextToken());
			int findMinute = Integer.parseInt(findHourTokenizer.nextToken());
			int findSeat = t.getReservationSeat();

			if (startHour == findHour) {
				if (startMinute < findMinute) {
					seats.add(findSeat);
				}
			} else if (startHour < findHour) {
				seats.add(findSeat);
			}
		});
		int seatLength = storeEntity.getStoreTotalRoomCount() - seats.size();
		model.addAttribute("seats", seats);
		return new ResponseDto<>(true, seatLength);
	}
}

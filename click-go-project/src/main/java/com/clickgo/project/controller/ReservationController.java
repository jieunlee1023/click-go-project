package com.clickgo.project.controller;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Store;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private StoreService storeService;

	@PostMapping("/{storeId}")
	public String reservation(@RequestParam(required = false) Integer[] seatNumber, @PathVariable int storeId,
			@RequestParam String startTime, @RequestParam String endTime, @RequestParam String startDate,
			@RequestParam String endDate, @AuthenticationPrincipal PrincipalDetails principalDetails)
			throws InterruptedException {
		int endHour = 0;
		int endMinute = 0;
		Reservation reservationEntity = null;

		StringTokenizer startDateTokenizer = new StringTokenizer(startDate, "-");
		int startYear = Integer.parseInt(startDateTokenizer.nextToken());
		int startMonth = Integer.parseInt(startDateTokenizer.nextToken());
		int startDay = Integer.parseInt(startDateTokenizer.nextToken());

		StringTokenizer endDateTokenizer = new StringTokenizer(endDate, "-");
		int endYear = Integer.parseInt(endDateTokenizer.nextToken());
		int endMonth = Integer.parseInt(endDateTokenizer.nextToken());
		int endDay = Integer.parseInt(endDateTokenizer.nextToken());

		Store storeEntity = storeService.findById(storeId);
		StringTokenizer startTimeTokenizer = new StringTokenizer(startTime, ":");
		int startHour = Integer.parseInt(startTimeTokenizer.nextToken());
		int startMinute = Integer.parseInt(startTimeTokenizer.nextToken());

		if (endTime != "" || endTime != null) {
			StringTokenizer endTimeTokenizer = new StringTokenizer(endTime, ":");
			endHour = Integer.parseInt(endTimeTokenizer.nextToken());
			endMinute = Integer.parseInt(endTimeTokenizer.nextToken());
		}

		for (int i = 0; i < seatNumber.length; i++) {
			reservationEntity = new Reservation();
			if (endHour == 0 || endMinute == 0) {
				reservationEntity.setPrice(storeEntity.getPrice());
			} else {
				if (startHour == endHour) {
					int minute = (endMinute - startMinute) / 10;
					reservationEntity.setPrice((storeEntity.getPrice() * minute));
				} else if (startHour < endHour) {
					int minuteToHour = ((endHour - startHour) * 60);
					if (startMinute > endMinute) {
						if (startMinute - endMinute == 10) {
							int minute = (50 + minuteToHour) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						} else if (startMinute - endMinute == 20) {
							int minute = (40 + minuteToHour) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						} else if (startMinute - endMinute == 30) {
							int minute = (30 + minuteToHour) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						} else if (startMinute - endMinute == 40) {
							int minute = (20 + minuteToHour) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						} else if (startMinute - endMinute == 50) {
							int minute = (10 + minuteToHour) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						}
					} else if (startMinute == endMinute) {
						int minute = minuteToHour;
						reservationEntity.setPrice((storeEntity.getPrice() * minute));
					} else {
						int minute = (endMinute - startMinute + minuteToHour) / 10;
						reservationEntity.setPrice((storeEntity.getPrice() * minute));
					}
				}
			}
			reservationEntity.setApproveStatus(ApproveStatus.WATING);
			reservationEntity.setReservationSeat(seatNumber[i]);
			reservationEntity.setUser(principalDetails.getUser());
			reservationEntity.setStore(storeEntity);
			reservationEntity.setReservationTime(startHour + ":" + startMinute);
			reservationEntity.setEndTime(endHour + ":" + endMinute);
			reservationEntity.setReservationDate(startYear + "-" + startMonth + "-" + startDay);
			reservationEntity.setEndDate(endYear + "-" + endMonth + "-" + endDay);
			reservationService.save(reservationEntity);
		}
		return "/store/reservation";
	}
}

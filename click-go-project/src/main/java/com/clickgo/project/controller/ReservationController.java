package com.clickgo.project.controller;

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
	public String reservation(@RequestParam(required = false) int seatNumber, @PathVariable int storeId, @RequestParam String startTime, @RequestParam String endTime, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		Reservation reservationEntity = new Reservation();
		Store storeEntity = storeService.findById(storeId);
		System.out.println(startTime);
		System.out.println(endTime);
		StringTokenizer startTimeTokenizer = new StringTokenizer(startTime, ":");
		int startHour = Integer.parseInt(startTimeTokenizer.nextToken());
		int startMinute = Integer.parseInt(startTimeTokenizer.nextToken());
		StringTokenizer endTimeTokenizer = new StringTokenizer(endTime, ":");
		int endHour = Integer.parseInt(endTimeTokenizer.nextToken());
		int endMinute = Integer.parseInt(endTimeTokenizer.nextToken());
		System.out.println("예약 시간 : " + startHour + "시 ");
		System.out.println(startMinute + "분");
		System.out.println("종료 시간 : " + endHour + "시 ");
		System.out.println(endMinute + "분");

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
						System.out.println(minute);
						reservationEntity.setPrice((storeEntity.getPrice() * minute));
					} else if (startMinute - endMinute == 20) {
						int minute = (40 + minuteToHour) / 10;
						System.out.println(minute);
						reservationEntity.setPrice((storeEntity.getPrice() * minute));
					} else if (startMinute - endMinute == 30) {
						int minute = (30 + minuteToHour) / 10;
						System.out.println(minute);
						reservationEntity.setPrice((storeEntity.getPrice() * minute));
					} else if (startMinute - endMinute == 40) {
						int minute = (20 + minuteToHour) / 10;
						System.out.println(minute);
						reservationEntity.setPrice((storeEntity.getPrice() * minute));
					} else if (startMinute - endMinute == 50) {
						int minute = (10 + minuteToHour) / 10;
						System.out.println(minute);
						reservationEntity.setPrice((storeEntity.getPrice() * minute));
					}
				} else if (startMinute == endMinute) {
					int minute = minuteToHour;
					System.out.println(minute);
					reservationEntity.setPrice((storeEntity.getPrice() * minute));
				} else {
					int minute = (endMinute - startMinute + minuteToHour) / 10;
					System.out.println(minute);
					reservationEntity.setPrice((storeEntity.getPrice() * minute));
				}
			}
		}
		reservationEntity.setApproveStatus(ApproveStatus.WATING);
		reservationEntity.setReservationSeat(seatNumber);
		reservationEntity.setUser(principalDetails.getUser());
		reservationEntity.setStore(storeEntity);
		reservationEntity.setReservationTime(startHour + ":" + startMinute + "");
		reservationEntity.setEndTime(endHour + ":" + endMinute + ":");
		reservationService.save(reservationEntity);
		return "/store/reservation";
	}
}

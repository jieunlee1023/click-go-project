package com.clickgo.project.api;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.dto.res.ReservationDateDto;
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
	public ResponseDto<?> timeCheck(@PathVariable int storeId, @RequestBody ReservationDateDto timeDto) {
		Store storeEntity = storeService.findById(storeId);
		int totalRoomCount = storeEntity.getStoreTotalRoomCount();
		List<Integer> totalRoomCounts = new ArrayList<>();
		totalRoomCounts.add(totalRoomCount);
		StringTokenizer reservationTimeTokenizer = new StringTokenizer(timeDto.getStartTime(), ":");
		int startHour = Integer.parseInt(reservationTimeTokenizer.nextToken());
		int startMinute = Integer.parseInt(reservationTimeTokenizer.nextToken());

		StringTokenizer reservationDateTokenizer = new StringTokenizer(timeDto.getStartDate(), "-");
		int startYear = Integer.parseInt(reservationDateTokenizer.nextToken());
		int startMonth = Integer.parseInt(reservationDateTokenizer.nextToken());
		int startDay = Integer.parseInt(reservationDateTokenizer.nextToken());

		Date date = new Date();

		int nowYear = (date.getYear() + 1900);
		int nowMonth = (date.getMonth() + 1);
		int nowDay = date.getDate();
		int nowHour = date.getHours();
		int nowMinutes = date.getMinutes();

		if (startYear >= nowYear && startMonth >= nowMonth && startDay >= nowDay) {
			if (startHour >= nowHour) {

				List<Integer> seats = new ArrayList<>();
				List<Reservation> reservations = reservationService.findByStoreId(storeId);
				reservations.forEach(t -> {
					StringTokenizer findReservationTimeTokenizer = new StringTokenizer(t.getEndTime(), ":");
					int findHour = Integer.parseInt(findReservationTimeTokenizer.nextToken());
					int findMinute = Integer.parseInt(findReservationTimeTokenizer.nextToken());
					int findSeat = t.getReservationSeat();

					StringTokenizer findReservationDateTokenizer = new StringTokenizer(t.getEndDate(), "-");
					int findYear = Integer.parseInt(findReservationDateTokenizer.nextToken());
					int findMonth = Integer.parseInt(findReservationDateTokenizer.nextToken());
					int findDay = Integer.parseInt(findReservationDateTokenizer.nextToken());

					// 같은 달
					if (startMonth == findMonth) {
						// 같은 날
						if (startDay == findDay) {
							// 같은 시간
							if (startHour == findHour) {
								// 찾는 분 < 예약된 분
								if (startMinute < findMinute) {
									seats.add(findSeat);
								}
								// 찾는 시간 < 예약된 시간
							} else if (startHour < findHour) {
								seats.add(findSeat);
							}
							// 찾는 날 < 예약된 날
						} else if (startDay < findDay) {
							seats.add(findSeat);
						}
						// 찾는 달 < 예약된 달
					} else if (startMonth < findMonth) {
						seats.add(findSeat);
					}
				});
				Map<String, List<Integer>> seatDisabled = new HashMap<>();
				seatDisabled.put("seats", seats);
				seatDisabled.put("totalRoomCount", totalRoomCounts);
				return new ResponseDto<>(true, seatDisabled);
			}
		}
		return new ResponseDto<>(false, "장난치면 못 써요 ~");
	}

	@GetMapping("/approve/{id}")
	public ResponseDto<?> approve(@PathVariable int id) {
		try {
			reservationService.approve(id);
			return new ResponseDto<>(true, "예약 성공 !");
		} catch (Exception e) {
			return new ResponseDto<>(false, "예약 실패 !");
		}
	}
}

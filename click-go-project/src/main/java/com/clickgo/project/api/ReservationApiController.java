package com.clickgo.project.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.clickgo.project.dto.res.ReservationDateDto;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.dto.res.kakaoPay.KakaoPaymentHistory;
import com.clickgo.project.dto.res.kakaoPay.reject.KakaoPaymentRejectDto;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Store;
import com.clickgo.project.model.mydate.MyDate;
import com.clickgo.project.service.KakaoPaymentHistoryService;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreService;

@RestController
@RequestMapping("/api/reservation")
public class ReservationApiController {

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private KakaoPaymentHistoryService kakaoPaymentHistoryService;

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

		MyDate myDate = new MyDate();

		int nowYear = myDate.getNowYear();
		int nowMonth = myDate.getNowMonth();
		int nowDay = myDate.getNowDay();
		int nowHour = myDate.getNowHour();
		int nowMinutes = myDate.getNowMinutes();

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

	@GetMapping("/approve/{reservationId}")
	public ResponseDto<?> approve(@PathVariable int reservationId) {
		try {
			reservationService.approve(reservationId);
			return new ResponseDto<>(true, "승인 성공 !");
		} catch (Exception e) {
			return new ResponseDto<>(false, "승인 실패 !");
		}
	}

	@GetMapping("/reject/{reservationId}")
	public ResponseDto<?> reject(@PathVariable int reservationId) {
		try {
			KakaoPaymentHistory kakaoPaymentHistoryEntity = kakaoPaymentHistoryService
					.findByReservationId(reservationId);
			String tid = kakaoPaymentHistoryEntity.getTid();

			Object objCancelAmount = kakaoPaymentHistoryEntity.getAmount().getTotal();
			String cancelAmount = objCancelAmount.toString();

			Object objTaxFree = kakaoPaymentHistoryEntity.getAmount().getTaxFree();
			String taxFree = objTaxFree.toString();

			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders httpHeaders = new HttpHeaders();
			httpHeaders.add("Authorization", "KakaoAK 1c9e66dbc0a2e55b9b2e3016e90a8b17");
			httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
			params.add("cid", "TC0ONETIME");
			params.add("tid", tid);
			params.add("cancel_amount", cancelAmount);
			params.add("cancel_tax_free_amount", taxFree);

			HttpEntity<MultiValueMap<String, String>> requestReject = new HttpEntity<>(params, httpHeaders);
			ResponseEntity<KakaoPaymentRejectDto> responseReject = restTemplate.exchange(
					"https://kapi.kakao.com/v1/payment/cancel", HttpMethod.POST, requestReject,
					KakaoPaymentRejectDto.class);

			int reservationCount = kakaoPaymentHistoryEntity.getQuantity();
			for (int i = 0; i < reservationCount; i++) {
				reservationService.reject(reservationId - i);
			}
			return new ResponseDto<>(true, "거절 성공 !");
		} catch (Exception e) {
			return new ResponseDto<>(false, "거절 실패 !");
		}
	}
}

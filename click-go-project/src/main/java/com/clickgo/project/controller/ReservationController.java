package com.clickgo.project.controller;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.kakaoPay.KakaoPaymentDto;
import com.clickgo.project.dto.res.kakaoPay.KakaoPaymentHistory;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Store;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.model.enums.PaymentType;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	private static String partnerOrderId;
	private static String partnerUserId;
	private static String tId;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private StoreService storeService;

	@PostMapping("/{storeId}")
	public String reservation(@RequestParam(required = false) String paymentType,
			@RequestParam(required = false) Integer[] seatNumber, @PathVariable int storeId,
			@RequestParam String startTime, @RequestParam String endTime, @RequestParam String startDate,
			@RequestParam String endDate, @AuthenticationPrincipal PrincipalDetails principalDetails)
			throws InterruptedException {
		Store storeEntity = storeService.findById(storeId);
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

		StringTokenizer startTimeTokenizer = new StringTokenizer(startTime, ":");
		int startHour = Integer.parseInt(startTimeTokenizer.nextToken());
		int startMinute = Integer.parseInt(startTimeTokenizer.nextToken());

		if (endTime != "" || endTime != null) {
			StringTokenizer endTimeTokenizer = new StringTokenizer(endTime, ":");
			endHour = Integer.parseInt(endTimeTokenizer.nextToken());
			endMinute = Integer.parseInt(endTimeTokenizer.nextToken());
		}

		if (seatNumber != null) {
			try {
				for (int i = 0; i < seatNumber.length; i++) {
					reservationEntity = new Reservation();
					if (endHour == 0 || endMinute == 0) {
						reservationEntity.setPrice(storeEntity.getPrice());
					} else {
						if (startHour == endHour) {
							int minute = (endMinute - startMinute) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						} else if (startHour < endHour) {
							int minuteToHour = ((endHour - startHour) * 6);
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
					// 카카오 페이 결제
					reservationService.save(reservationEntity);
					System.out.println("디비 저장");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (paymentType.equals(PaymentType.KAKAO.toString())) {
				reservationEntity.setPaymentType(PaymentType.KAKAO);
				return kakaoPayReady(reservationEntity, storeEntity, seatNumber);
			}
			return "redirect:/store/detail/" + storeId;
		}
		return "redirect:/store/detail/" + storeId;
	}

	public static String kakaoPayReady(Reservation reservation, Store storeEntity, Integer[] seatNumber) {
		System.out.println("결제 준비");
		Object objOrderId = reservation.getId();
		partnerOrderId = objOrderId.toString();

		Object objUserId = storeEntity.getId();
		partnerUserId = objUserId.toString();

		String itemName = storeEntity.getCategory().getId().toString();

		Object objQuantity = seatNumber.length;
		String quantity = objQuantity.toString();

		Object objTotalPrice = (reservation.getPrice() * seatNumber.length);
		String totalPrice = objTotalPrice.toString();
		System.out.println(reservation.getPrice());
		System.out.println(seatNumber.length);
		System.out.println(totalPrice);

		Object test = storeEntity.getId();
		String storeId = test.toString();

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", "KakaoAK 1c9e66dbc0a2e55b9b2e3016e90a8b17");
		httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", partnerOrderId);
		params.add("partner_user_id", partnerUserId);
		params.add("item_name", itemName);
		params.add("quantity", quantity);
		params.add("total_amount", totalPrice);
		params.add("tax_free_amount", "50");
		params.add("approval_url", "http://localhost:7777/reservation/approve/kakao");
		params.add("cancel_url", "http://localhost:7777/store/detail/" + storeId);
		params.add("fail_url", "http://localhost:7777/store/detail/" + storeId);

		HttpEntity<MultiValueMap<String, String>> requestKakao = new HttpEntity<>(params, httpHeaders);

		ResponseEntity<KakaoPaymentDto> responseKakao = restTemplate.exchange("https://kapi.kakao.com/v1/payment/ready",
				HttpMethod.POST, requestKakao, KakaoPaymentDto.class);
		KakaoPaymentDto kakaoPaymentDto = responseKakao.getBody();

		tId = kakaoPaymentDto.tid;
		return "redirect:" + kakaoPaymentDto.nextRedirectPcUrl;
	}

	@GetMapping("/approve/kakao")
	@ResponseBody
	private static String kakaoPayApprove(@RequestParam(name = "pg_token") String pgToken) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", "KakaoAK 1c9e66dbc0a2e55b9b2e3016e90a8b17");
		httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", tId);
		params.add("partner_order_id", partnerOrderId);
		params.add("partner_user_id", partnerUserId);
		params.add("pg_token", pgToken);

		HttpEntity<MultiValueMap<String, String>> requestKakao = new HttpEntity<>(params, httpHeaders);

		ResponseEntity<KakaoPaymentHistory> responseKakao = restTemplate.exchange(
				"https://kapi.kakao.com/v1/payment/approve", HttpMethod.POST, requestKakao, KakaoPaymentHistory.class);

		KakaoPaymentHistory approveDto = responseKakao.getBody();

		System.out.println(approveDto.toString());
		return "redirect:/user/my/reservations";
	}
}

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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ReservationDateDto;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.dto.res.kakaoPay.KakaoPaymentDto;
import com.clickgo.project.dto.res.kakaoPay.KakaoPaymentHistory;
import com.clickgo.project.dto.res.kakaoPay.reject.KakaoPaymentRejectDto;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Store;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.model.enums.PaymentType;
import com.clickgo.project.model.mydate.MyDate;
import com.clickgo.project.service.AmountService;
import com.clickgo.project.service.KakaoPaymentHistoryService;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreService;

@RestController
@RequestMapping("/api/reservation")
public class ReservationApiController {

	private String tId;
	private String partnerOrderId;
	private String partnerUserId;
	private Reservation lastReservation;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private KakaoPaymentHistoryService kakaoPaymentHistoryService;

	@Autowired
	private AmountService amountService;

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

		if (startYear >= nowYear && startMonth >= nowMonth) {
			if (startDay >= nowDay) {
				if (startHour >= nowHour) {

					List<Integer> seats = new ArrayList<>();
					List<Reservation> reservations = reservationService.findSeatByStoreId(storeId);
					reservations.forEach(t -> {
						StringTokenizer findReservationTimeTokenizer = new StringTokenizer(t.getEndTime(), ":");
						int findHour = Integer.parseInt(findReservationTimeTokenizer.nextToken());
						int findMinute = Integer.parseInt(findReservationTimeTokenizer.nextToken().trim());
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
		}
		return new ResponseDto<>(false, "잘못된 선택입니다.");
	}

	@PostMapping("/kakaopay/ready/{storeId}/{seats}")
	public ResponseDto<?> kakaopayReady(@PathVariable List<Integer> seats, @PathVariable int storeId,
			@RequestParam Map<String, String> reservationDate, @RequestBody Reservation reservation,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Store storeEntity = storeService.findById(storeId);
		Object objOrderId = reservation.getId();
		partnerOrderId = objOrderId.toString();

		Object objUserId = storeEntity.getId();
		partnerUserId = objUserId.toString();

		String itemName = storeEntity.getCategory().getId().toString();

		Object objQuantity = seats.size();
		String quantity = objQuantity.toString();

		Object objTotalPrice = reservation.getPrice();
		String totalPrice = objTotalPrice.toString();

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
		params.add("approval_url", "http://localhost:7777/api/reservation/kakaopay/approve");
		params.add("cancel_url", "http://localhost:7777/reservation/cancel/" + seats.size());
		params.add("fail_url", "http://localhost:7777/reservation/cancel/" + seats.size());

		HttpEntity<MultiValueMap<String, String>> requestKakao = new HttpEntity<>(params, httpHeaders);

		ResponseEntity<KakaoPaymentDto> responseKakao = restTemplate.exchange("https://kapi.kakao.com/v1/payment/ready",
				HttpMethod.POST, requestKakao, KakaoPaymentDto.class);
		KakaoPaymentDto kakaoPaymentDto = responseKakao.getBody();

		tId = kakaoPaymentDto.tid;
		int price = reservation.getPrice();
		seats.forEach(seatNumber -> {
			Reservation reservationEntity = new Reservation();
			reservationEntity.setApproveStatus(ApproveStatus.WATING);
			reservationEntity.setPaymentType(PaymentType.KAKAO);
			reservationEntity.setStore(storeEntity);
			reservationEntity.setUser(principalDetails.getUser());
			reservationEntity.setPrice(price / seats.size());
			reservationEntity.setReservationSeat(seatNumber);
			reservationEntity.setReservationDate(reservation.getReservationDate());
			reservationEntity.setEndDate(reservation.getEndDate());
			reservationEntity.setReservationTime(reservation.getReservationTime());
			reservationEntity.setEndTime(reservation.getEndTime());
			reservationService.save(reservationEntity);
			lastReservation = reservationEntity;
		});
		return new ResponseDto<>(true, kakaoPaymentDto.nextRedirectPcUrl);
	}

	@GetMapping("/kakaopay/approve")
	public ModelAndView kakaopayApprove(@RequestParam(name = "pg_token") String pgToken) {
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

		KakaoPaymentHistory kakaoPaymentHistory = responseKakao.getBody();
		kakaoPaymentHistory.setReservation(lastReservation);

		amountService.save(responseKakao.getBody().getAmount());
		kakaoPaymentHistoryService.save(kakaoPaymentHistory);

		ModelAndView view = new ModelAndView("redirect:/reservation/list");
		return view;
	}

	@GetMapping("/approve/{reservationId}")
	public ResponseDto<?> approve(@PathVariable int reservationId) {
		try {
			reservationService.approve(reservationId);
			KakaoPaymentHistory kakaoPaymentHistoryEntity = kakaoPaymentHistoryService
					.findByReservationId(reservationId);
			int reservationCount = kakaoPaymentHistoryEntity.getQuantity();
			for (int i = 0; i < reservationCount; i++) {
				reservationService.reject(reservationId - i);
			}
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

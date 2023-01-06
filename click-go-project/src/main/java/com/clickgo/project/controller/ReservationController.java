package com.clickgo.project.controller;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.model.enums.PaymentType;
import com.clickgo.project.service.AmountService;
import com.clickgo.project.service.KakaoPaymentHistoryService;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	private String partnerOrderId;
	private String partnerUserId;
	private String tId;
	private Reservation reservation;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private KakaoPaymentHistoryService kakaoPaymentHistoryService;

	@Autowired
	private AmountService amountService;

	@Autowired
	private StoreFranchiseService franchiseService;

	@PostMapping("/{storeId}")
	public String reservation(@RequestParam(required = false) String paymentType,
			@RequestParam(required = false) Integer[] seatNumber, @PathVariable int storeId,
			@RequestParam String startTime, @RequestParam String endTime, @RequestParam String startDate,
			@RequestParam String endDate, @AuthenticationPrincipal PrincipalDetails principalDetails)
			throws InterruptedException {
		Store storeEntity = storeService.findById(storeId);
		int endHour = 0;
		int endMinute = 0;
		int startYear = 0;
		int startMonth = 0;
		int startDay = 0;
		int endYear = 0;
		int endMonth = 0;
		int endDay = 0;
		int startHour = 0;
		int startMinute = 0;
		Reservation reservationEntity = null;

		StringTokenizer startDateTokenizer = new StringTokenizer(startDate, "-");
		startYear = Integer.parseInt(startDateTokenizer.nextToken());
		startMonth = Integer.parseInt(startDateTokenizer.nextToken());
		startDay = Integer.parseInt(startDateTokenizer.nextToken());

		StringTokenizer endDateTokenizer = new StringTokenizer(endDate, "-");
		endYear = Integer.parseInt(endDateTokenizer.nextToken());
		endMonth = Integer.parseInt(endDateTokenizer.nextToken());
		endDay = Integer.parseInt(endDateTokenizer.nextToken());

		StringTokenizer startTimeTokenizer = new StringTokenizer(startTime, ":");
		try {
			startHour = Integer.parseInt(startTimeTokenizer.nextToken());
			startMinute = Integer.parseInt(startTimeTokenizer.nextToken());
		} catch (Exception e) {
			System.err.println("중복 제거");
			StringTokenizer deduplication = new StringTokenizer(startTimeTokenizer.nextToken(), ",");
			startMinute = Integer.parseInt(deduplication.nextToken());
		}

		if (endTime != "" || endTime != null) {
			StringTokenizer endTimeTokenizer = new StringTokenizer(endTime, ":");
			try {
				endHour = Integer.parseInt(endTimeTokenizer.nextToken());
				endMinute = Integer.parseInt(endTimeTokenizer.nextToken());
			} catch (Exception e) {
				System.err.println("중복 제거");
				StringTokenizer deduplication = new StringTokenizer(endTimeTokenizer.nextToken(), ",");
				endMinute = Integer.parseInt(deduplication.nextToken());
			}
		}

		if (seatNumber != null) {
			for (int i = 0; i < seatNumber.length; i++) {
				reservationEntity = new Reservation();
				if (startHour == endHour) {
					int minute = (endMinute - startMinute) / 10;
					reservationEntity.setPrice((storeEntity.getPrice() * minute));
				} else if (startHour < endHour) {
					int minuteToHour = ((endHour - startHour) * 60);
					if (startMinute > endMinute) {
						if (startMinute - endMinute == 10) {
							int minute = (minuteToHour - 10) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						} else if (startMinute - endMinute == 20) {
							int minute = (minuteToHour - 20) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						} else if (startMinute - endMinute == 30) {
							int minute = (minuteToHour - 30) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						} else if (startMinute - endMinute == 40) {
							int minute = (minuteToHour - 40) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						} else if (startMinute - endMinute == 50) {
							int minute = (minuteToHour - 50) / 10;
							reservationEntity.setPrice((storeEntity.getPrice() * minute));
						}
					} else if (startMinute == endMinute) {
						int minute = minuteToHour;
						reservationEntity.setPrice((storeEntity.getPrice() * minute) / 10);
					} else {
						int minute = ((endMinute - startMinute) + minuteToHour) / 10;
						reservationEntity.setPrice((storeEntity.getPrice() * minute));
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
				if (paymentType.equals(PaymentType.KAKAO.toString())) {
					reservationEntity.setPaymentType(PaymentType.KAKAO);
				}
				reservation = reservationEntity;
				reservationService.save(reservationEntity);
			}
			if (paymentType.equals(PaymentType.KAKAO.toString())) {
				return kakaoPayReady(reservationEntity, storeEntity, seatNumber);
			} else if (paymentType.equals(PaymentType.NAVER.toString())) {

			}
			return "redirect:/store/detail/" + storeId;
		}
		return "redirect:/store/detail/" + storeId;
	}

	@GetMapping("/list")
	public String reservationList(Model model,
			@PageableDefault(size = 100, sort = "id", direction = Direction.DESC) Pageable pageable,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Page<Reservation> reservations = reservationService.searchBoard(principalDetails.getUser(), pageable);
		model.addAttribute("lastId", reservations.getContent().get(0).getId());
		franchiseMassageCount(model);
		model.addAttribute("reservations", reservations);
		return "/user/my/reservation/list";
	}

	public String kakaoPayReady(Reservation reservation, Store storeEntity, Integer[] seatNumber) {
		Object objOrderId = reservation.getId();
		partnerOrderId = objOrderId.toString();

		Object objUserId = storeEntity.getId();
		partnerUserId = objUserId.toString();

		String itemName = storeEntity.getCategory().getId().toString();

		Object objQuantity = seatNumber.length;
		String quantity = objQuantity.toString();

		Object objTotalPrice = (reservation.getPrice() * seatNumber.length);
		String totalPrice = objTotalPrice.toString();

		Object objStoreId = storeEntity.getId();
		String storeId = objStoreId.toString();

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
		params.add("cancel_url", "http://localhost:7777/reservation/cancel/" + seatNumber.length);
		params.add("fail_url", "http://localhost:7777/reservation/cancel/" + seatNumber.length);

		HttpEntity<MultiValueMap<String, String>> requestKakao = new HttpEntity<>(params, httpHeaders);

		ResponseEntity<KakaoPaymentDto> responseKakao = restTemplate.exchange("https://kapi.kakao.com/v1/payment/ready",
				HttpMethod.POST, requestKakao, KakaoPaymentDto.class);
		KakaoPaymentDto kakaoPaymentDto = responseKakao.getBody();

		tId = kakaoPaymentDto.tid;
		return "redirect:" + kakaoPaymentDto.nextRedirectPcUrl;
	}

	@GetMapping("/approve/kakao")
	private String kakaoPayApprove(@RequestParam(name = "pg_token") String pgToken) {
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
		kakaoPaymentHistory.setReservation(reservation);
		
		amountService.save(responseKakao.getBody().getAmount());
		kakaoPaymentHistoryService.save(kakaoPaymentHistory);
		return "redirect:/reservation/list";
	}

	@GetMapping("/cancel/{seatNumber}")
	public String cancel(@PathVariable int seatNumber) {
		int lastPK = reservationService.findLastPK();
		for (int i = 0; i < seatNumber; i++) {
			int cancelReservation = lastPK - i;
			reservationService.delete(cancelReservation);
		}
		return "redirect:/store/main";
	}

	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);

		List<StoreFranchise> allMsg = franchiseService.getMessageList();
		franchiseMessages.forEach(t -> {
			if (t.getState().toString().equals("WAIT")) {
				allMsg.add(t);
			}
		});
		int waitMsg = allMsg.size() - franchiseMessages.size();
		model.addAttribute("waitMsg", waitMsg);
	}
}

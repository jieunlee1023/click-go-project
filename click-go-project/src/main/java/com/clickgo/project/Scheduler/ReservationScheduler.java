package com.clickgo.project.Scheduler;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.clickgo.project.dto.res.kakaoPay.KakaoPaymentHistory;
import com.clickgo.project.dto.res.kakaoPay.reject.KakaoPaymentRejectDto;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.model.mydate.MyDate;
import com.clickgo.project.service.KakaoPaymentHistoryService;
import com.clickgo.project.service.ReservationService;

@EnableScheduling
@SpringBootApplication
public class ReservationScheduler {

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private KakaoPaymentHistoryService kakaoPaymentHistoryService;

	@Scheduled(cron = "10 * * * * ?", zone = "Asia/Seoul")
	@Scheduled(cron = "20 * * * * ?", zone = "Asia/Seoul")
	@Scheduled(cron = "30 * * * * ?", zone = "Asia/Seoul")
	@Scheduled(cron = "40 * * * * ?", zone = "Asia/Seoul")
	@Scheduled(cron = "50 * * * * ?", zone = "Asia/Seoul")
	@Scheduled(cron = "0 * * * * ?", zone = "Asia/Seoul")
	public void test() {
		MyDate myDate = new MyDate();
		List<Reservation> reservations = reservationService.findAll();
		reservations.forEach(reservation -> {
			if (reservation.getApproveStatus() == ApproveStatus.WATING) {
				StringTokenizer dateTokenizer = new StringTokenizer(reservation.getReservationDate(), "-");
				String year = dateTokenizer.nextToken();
				String month = dateTokenizer.nextToken();
				String day = dateTokenizer.nextToken();
				if (Integer.parseInt(month) <= myDate.getNowMonth()) {
					if (Integer.parseInt(day) <= myDate.getNowDay()) {
						StringTokenizer stringTokenizer = new StringTokenizer(reservation.getReservationTime(), ":");
						String hour = stringTokenizer.nextToken();
						String minutes = stringTokenizer.nextToken();
						if (Integer.parseInt(hour) <= myDate.getNowHour()) {
							if (Integer.parseInt(minutes) <= myDate.getNowMinutes()) {
								KakaoPaymentHistory kakaoPaymentHistoryEntity = kakaoPaymentHistoryService
										.findByReservationId(reservation.getId());
								if (kakaoPaymentHistoryEntity != null) {

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

									HttpEntity<MultiValueMap<String, String>> requestReject = new HttpEntity<>(params,
											httpHeaders);
									ResponseEntity<KakaoPaymentRejectDto> responseReject = restTemplate.exchange(
											"https://kapi.kakao.com/v1/payment/cancel", HttpMethod.POST, requestReject,
											KakaoPaymentRejectDto.class);

									int reservationCount = kakaoPaymentHistoryEntity.getQuantity();
									for (int i = 0; i < reservationCount; i++) {
										reservationService.reject(reservation.getId() - i);
									}
								}
							}
						}
					}
				}
			}
		});
	}
}

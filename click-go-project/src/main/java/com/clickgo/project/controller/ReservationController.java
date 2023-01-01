package com.clickgo.project.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clickgo.project.auth.PrincipalDetails;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@GetMapping("/{storeId}")
	public String reservation(@PathVariable int storeId, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		// Security에게 /reservation의 맵핑을 막아달라 요청.. 비로그인 회원의 예약 시도 시 로그인화면으로 리턴
		
		// start-select-time
		// end-select-time은 지정하지 않을 수도 있고 지정할 수도 있음
		// end-select-time을 지정하지 않았을 시 start시간부터 기본 30분은 무조건이라는 전제를 깐다.
		// 시간대는 10분 간격으로 예약 가능
		// 30분당 금액은 가게에게 받아오는 데이터 삽입
		// 예약은 1일전 부터 당일 예약만 받는다.
		// 예약은 현 시간부로 최소 30분 후만 가능하다.
		// 예약 취소는 최소 3시간 전 까지만 가능하다. 
		// 예약 취소 사유도 받아야한다. 
		// 취소 수수료 30퍼센트
		return "/store/reservation";
	}
}

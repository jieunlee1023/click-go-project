package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private StoreFranchiseService franchiseService;

	@PostMapping("/{storeId}")
	public String reservation(@RequestParam(required = false) String paymentType,
			@RequestParam(required = false) Integer[] seatNumber, @PathVariable int storeId,
			@RequestParam String startTime, @RequestParam String endTime, @RequestParam String startDate,
			@RequestParam String endDate, @AuthenticationPrincipal PrincipalDetails principalDetails, Model model)
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

		List<Reservation> reservations = new ArrayList<>();
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
				reservations.add(reservationEntity);
				model.addAttribute("reservationEntity", reservationEntity);
			}
			model.addAttribute("reservations", reservations);
			model.addAttribute("store", storeEntity);
			return "/store/payment";
		}
		return "redirect:/store/detail/" + storeId;
	}

	@GetMapping("/list")
	public String reservationList(Model model,
			@PageableDefault(size = 100, sort = "id", direction = Direction.DESC) Pageable pageable,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		List<Reservation> allReservations = reservationService.findAll();
		Page<Reservation> reservations = reservationService.searchBoard(principalDetails.getUser(), pageable);
		if (!reservations.getContent().isEmpty()) {
			franchiseMassageCount(model);
			model.addAttribute("lastId", reservations.getContent().get(0).getId());
			model.addAttribute("reservations", reservations);
			model.addAttribute("allReservations", allReservations.size());
		}
		return "/user/my/reservation/list";
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

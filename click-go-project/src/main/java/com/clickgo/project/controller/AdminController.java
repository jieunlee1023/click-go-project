package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.OneOnOne;
import com.clickgo.project.entity.OneOnOneAnswer;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.chart.CategorySales;
import com.clickgo.project.model.chart.MySales;
import com.clickgo.project.model.chart.Sales;
import com.clickgo.project.service.OneOnOneAnswerService;
import com.clickgo.project.service.OneOnOneService;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;
import com.clickgo.project.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private OneOnOneService oneOnOneService;

	@Autowired
	private OneOnOneAnswerService oneOnOneAnswerService;

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private ReservationService reservationService;

	@GetMapping("/main")
	public String adminPage(Model model) {
		franchiseMassageCount(model);
		return "admin/main";
	}

	@GetMapping("/chart")
	public String adminChart(Model model) {
		List<Reservation> mySalesOfMonths = reservationService.findAllOfMonthNotReject();
		List<MySales> yearSales = new ArrayList<>();
		mySalesOfMonths.forEach(mySalesOfMonth -> {
			MySales mySales = new MySales(mySalesOfMonth.getReservationDate(), (mySalesOfMonth.getPrice() / 90));
			yearSales.add(mySales);
		});

		ObjectMapper mapper = new ObjectMapper();
		try {
			String mySalesOfMonth = mapper.writeValueAsString(yearSales);
			model.addAttribute("mySalesOfMonth", mySalesOfMonth);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "admin/chart/chart";
	}

	@GetMapping("/reservation")
	public String adminreservation() {
		return "admin/reservation";
	}

	@GetMapping("/report")
	public String adminReport() {
		return "admin/report";
	}

	@GetMapping({ "/user", "/user-search" })
	public String adminUserInfo(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 10, sort = "id", direction = Direction.ASC) Pageable pageable) {

		String searchUserInfo = q == null ? "" : q;
		Page<User> users = userService.searchUserInfo(searchUserInfo, pageable);

		int PAGENATION_BLOCK_COUNT = 10;

		int nowPage = users.getPageable().getPageNumber() + 1;

		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + startPageNumber, users.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("users", users);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchUserInfo);

		franchiseMassageCount(model);
		return "admin/user";
	}

	@GetMapping({ "/store", "/store-search" })
	public String adminStoreInfo(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 3, sort = "id", direction = Direction.ASC) Pageable pageable) {
		String searchStoreName = q == null ? "" : q;

		Page<Store> stores = storeService.searchStoreList(searchStoreName, pageable);

		int PAGENATION_BLOCK_COUNT = 3;

		int nowPage = stores.getPageable().getPageNumber() + 1;

		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + startPageNumber, stores.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("stores", stores);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchStoreName);

		franchiseMassageCount(model);

		return "admin/store";

	}

	@GetMapping("/answer-list")
	public String oneOnOneAsk(Model model) {
		List<OneOnOne> ooos = oneOnOneService.getOooList();
		model.addAttribute("ooos", ooos);
		return "admin/answer-list";
	}

	// s w
	@GetMapping("/one-on-one-answer/{id}")
	public String showAnswer(@PathVariable int id, Model model) {

		List<OneOnOne> oooList = oneOnOneService.getOooList();
		List<OneOnOneAnswer> oooaList = oneOnOneAnswerService.getAnswerList();
		OneOnOne oneOnOneEntity = oneOnOneService.findById(id);
		model.addAttribute("ooo", oneOnOneEntity);
		model.addAttribute("oooList", oooList);
		model.addAttribute("oooaList", oooaList);

		return "admin/one-on-one-answer";
	}

	//
	@PostMapping("/one-on-one-answer")
	public String saveAnswer(@RequestParam int oooId, OneOnOneAnswer oooAnswer,
			@AuthenticationPrincipal PrincipalDetails details, Model model) {
		OneOnOne oneOnOneEntity = oneOnOneService.findById(oooId);
		oneOnOneAnswerService.writeAnswer(oneOnOneEntity, oooAnswer, details.getUser());

		int adminId = oooAnswer.getUser().getId();
		String adminContent = oooAnswer.getContent();

		List<OneOnOneAnswer> answerList = oneOnOneAnswerService.getAnswerList();
		model.addAttribute("adminId", adminId);
		model.addAttribute("adminContent", adminContent);
		model.addAttribute("answerList", answerList);

		return "redirect:/admin/answer-list";
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

	@GetMapping("/chart/store/sales/today")
	public String todayStoreSalesChart(Model model) {
		List<Store> stores = storeService.findAll();
		List<Sales> todaySales = new ArrayList<>();

		stores.forEach(store -> {
			int todayTotalSales = reservationService.findTodaySalesByStoreId(store.getId());
			if (todayTotalSales != 0) {
				Sales todayTotalSalesWithStoreName = new Sales(store.getStoreName(), todayTotalSales);
				todaySales.add(todayTotalSalesWithStoreName);
			}
		});
		ObjectMapper mapper = new ObjectMapper();
		try {
			String strTodaySales = mapper.writeValueAsString(todaySales);
			model.addAttribute("todaySales", strTodaySales);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/chart/store/sales/today";
	}

	@GetMapping("/chart/store/sales/this-month")
	public String thisMonthStoreSalesChart(Model model) {
		List<Store> stores = storeService.findAll();
		List<Sales> monthSales = new ArrayList<>();
		stores.forEach(store -> {
			int monthTotalSales = reservationService.findMonthSalesByStoreId(store.getId());
			if (monthTotalSales != 0) {
				Sales monthTotalSalesWithStoreName = new Sales(store.getStoreName(), monthTotalSales);
				monthSales.add(monthTotalSalesWithStoreName);
			}
		});
		ObjectMapper mapper = new ObjectMapper();
		try {
			String strThisMonthSales = mapper.writeValueAsString(monthSales);
			model.addAttribute("thisMonthSales", strThisMonthSales);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "/admin/chart/store/sales/this-month";
	}

	@GetMapping("/chart/store/sales/this-year")
	public String thisYearStoreSalesChart(Model model) {
		List<Store> stores = storeService.findAll();
		List<Sales> yearSales = new ArrayList<>();
		stores.forEach(store -> {
			int yearTotalSales = reservationService.findYearSalesByStoreId(store.getId());
			if (yearTotalSales != 0) {
				Sales yearTotalSalesWithStoreName = new Sales(store.getStoreName(), yearTotalSales);
				yearSales.add(yearTotalSalesWithStoreName);
			}
		});
		ObjectMapper mapper = new ObjectMapper();
		try {
			String strThisYearSales = mapper.writeValueAsString(yearSales);
			model.addAttribute("thisYearSales", strThisYearSales);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "/admin/chart/store/sales/this-year";
	}

	@GetMapping("/chart/category/sales/today")
	public String todayCategorySalesChart(Model model) {
		List<Reservation> reservations = reservationService.findAllGroupByCategoryIdWhenToday();
		List<CategorySales> categorySales = new ArrayList<>();
		reservations.forEach(reservation -> {
			CategorySales categorySaleDto = new CategorySales(reservation.getStore().getCategory(),
					reservation.getPrice());
			categorySales.add(categorySaleDto);
		});
		ObjectMapper mapper = new ObjectMapper();
		try {
			String strCategorySales = mapper.writeValueAsString(categorySales);
			model.addAttribute("categorySales", strCategorySales);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "/admin/chart/category/sales/today";
	}

	@GetMapping("/chart/category/sales/this-month")
	public String thisMonthCategorySalesChart(Model model) {
		List<Reservation> reservations = reservationService.findAllGroupByCategoryIdWhenThisMonth();
		List<CategorySales> categorySales = new ArrayList<>();
		reservations.forEach(reservation -> {
			CategorySales categorySaleDto = new CategorySales(reservation.getStore().getCategory(),
					reservation.getPrice());
			categorySales.add(categorySaleDto);
		});
		ObjectMapper mapper = new ObjectMapper();
		try {
			String strCategorySales = mapper.writeValueAsString(categorySales);
			model.addAttribute("categorySales", strCategorySales);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "/admin/chart/category/sales/this-month";
	}

	@GetMapping("/chart/category/sales/this-year")
	public String thisYearCategorySalesChart(Model model) {
		List<Reservation> reservations = reservationService.findAllGroupByCategoryIdWhenThisYear();
		List<CategorySales> categorySales = new ArrayList<>();
		reservations.forEach(reservation -> {
			CategorySales categorySaleDto = new CategorySales(reservation.getStore().getCategory(),
					reservation.getPrice());
			categorySales.add(categorySaleDto);
		});
		ObjectMapper mapper = new ObjectMapper();
		try {
			String strCategorySales = mapper.writeValueAsString(categorySales);
			model.addAttribute("categorySales", strCategorySales);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "/admin/chart/category/sales/this-year";
	}
}

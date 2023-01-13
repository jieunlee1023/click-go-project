package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.clickgo.project.entity.Admin;
import com.clickgo.project.entity.OneToOneAnswer;
import com.clickgo.project.entity.OneToOneAsk;
import com.clickgo.project.entity.Report;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.chart.CategorySales;
import com.clickgo.project.model.chart.MySales;
import com.clickgo.project.model.chart.Sales;
import com.clickgo.project.service.AdminService;
import com.clickgo.project.service.OneToOneAnswerService;
import com.clickgo.project.service.OneToOneAskService;
import com.clickgo.project.service.ReportReplyService;
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
	private OneToOneAskService oneToOneAskService;

	@Autowired
	private OneToOneAnswerService oneToOneAnswerService;

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private ReportReplyService replyService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private AdminService adminService;

	@GetMapping("/main")
	public String adminPage(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {

		Admin adminEntity = adminService.findByUserId(principalDetails.getUser().getId());
		model.addAttribute("adminEntity", adminEntity);
		franchiseMassageCount(model);
		return "admin/main";
	}

	@GetMapping("/sales")
	public String adminSales(Model model) {
		franchiseMassageCount(model);
		return "admin/sales";
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
	public String adminreservation(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 5, sort = "id", direction = Direction.DESC) Pageable pageable) {
		String searchName = q == null ? "" : q;
		
//		List<Reservation> reservations = reservationService.findAll();
		Page<Reservation> reservations = reservationService.findAllPage(pageable);
		
		int pageBlock = 5;
		int PAGENATION_BLOCK_COUNT = 1;
		int nowPage = reservations.getPageable().getPageNumber() + 1;
		int startPageNumber = Math.max((nowPage - PAGENATION_BLOCK_COUNT), + 1)  ;
		int endPageNumber = Math.min(nowPage + PAGENATION_BLOCK_COUNT, reservations.getTotalPages());
		
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}
		List<Reservation> pageToListReservation = new ArrayList<>();
		if(pageToListReservation != null && reservations.hasContent()) {
			pageToListReservation = reservations.getContent();
		}
		
		model.addAttribute("reservations", reservations);
		model.addAttribute("reservation", pageToListReservation);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
//		model.addAttribute("q", searchName);
		franchiseMassageCount(model);
		return "admin/reservation";
	}

	@GetMapping("/report")
	public String adminReport(Model model,
			@PageableDefault(size = 50, sort = "id", direction = Direction.DESC) Pageable pageable) {
		Page<Report> reports = replyService.findAllReport(pageable);
		if (reports != null) {

			int PAGENATION_BLOCK_COUNT = 3;
			int nowPage = reports.getNumber() + 1;
			int startPage = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
			int endPage = Math.min(nowPage + PAGENATION_BLOCK_COUNT, reports.getTotalPages());
			List<Integer> pageNumbers = new ArrayList<>();

			for (int i = startPage; i <= endPage; i++) {
				pageNumbers.add(i);
			}
			model.addAttribute("reports", reports);
			model.addAttribute("pageNumbers", pageNumbers);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
		}
		franchiseMassageCount(model);
		return "admin/report";
	}

	@GetMapping({ "/user", "/user-search" })
	public String adminUserInfo(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 20, sort = "id", direction = Direction.ASC) Pageable pageable) {

		String searchUserInfo = q == null ? "" : q;
		Page<User> users = userService.searchUserInfo(searchUserInfo, pageable);

		int PAGENATION_BLOCK_COUNT = 10;
		int nowPage = users.getPageable().getPageNumber() + 1;
		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + PAGENATION_BLOCK_COUNT, users.getTotalPages());
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
		int endPageNumber = Math.min(nowPage + PAGENATION_BLOCK_COUNT, stores.getTotalPages());

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

	@GetMapping({ "/one-to-one-list", "/one-to-one-search" })
	public String oneToOneList(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 10, sort = "id", direction = Direction.DESC) Pageable pageable) {
		String searchTitle = q == null ? "" : q;

		Page<OneToOneAsk> askPage = oneToOneAskService.searchAsk(searchTitle, pageable);
		List<OneToOneAnswer> answerList = oneToOneAnswerService.getAnswerList();

		int PAGENATION_BLOCK_COUNT = 10;
		int nowPage = askPage.getPageable().getPageNumber() + 1;
		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + PAGENATION_BLOCK_COUNT, askPage.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("askPage", askPage);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchTitle);
		model.addAttribute("answerList", answerList);

		return "admin/one-to-one-list";
	}

	@GetMapping("/one-to-one-answer/{id}")
	public String showOnToOneAnswer(@PathVariable int id, Model model) {

		List<OneToOneAsk> askList = oneToOneAskService.getOneToOneAskList();
		List<OneToOneAnswer> answerList = oneToOneAnswerService.getAnswerList();
		OneToOneAsk askEntity = oneToOneAskService.findByOneToOneAskId(id);

		model.addAttribute("askEntity", askEntity);
		model.addAttribute("askList", askList);
		model.addAttribute("answerList", answerList);
		return "admin/one-to-one-answer";
	}

	@PostMapping("/one-to-one-answer")
	public String saveAnswer(@RequestParam int askId, OneToOneAnswer AnswerEntity,
			@AuthenticationPrincipal PrincipalDetails details, Model model) {
		OneToOneAsk askEntity = oneToOneAskService.findByOneToOneAskId(askId);
		oneToOneAnswerService.writeAnswer(askId, askEntity, AnswerEntity, details.getUser());
		List<OneToOneAnswer> answerList = oneToOneAnswerService.getAnswerList();

		int answerAdminId = AnswerEntity.getUser().getId();
		String answerContent = AnswerEntity.getContent();

		model.addAttribute("answerAdminId", answerAdminId);
		model.addAttribute("answerContent", answerContent);
		model.addAttribute("answerList", answerList);

		return "redirect:/admin/one-to-one-list";
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

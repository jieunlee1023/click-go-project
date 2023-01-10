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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.Image;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Review;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.chart.AWeekStoreSales;
import com.clickgo.project.model.chart.TodayStoreSales;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.model.enums.StoreCategory;
import com.clickgo.project.model.mydate.MyDate;
import com.clickgo.project.repository.IImageRepository;
import com.clickgo.project.repository.IStoreRepository;
import com.clickgo.project.service.CategoryService;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.ReviewService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/store")
public class StoreController {

	String imageUrl;

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private IImageRepository iImageRepository;

	@Autowired
	private IStoreRepository iStoreRepository;

	private Page<Store> stores;

	@GetMapping("/main")
	public String store(@RequestParam(required = false) String pageName, Model model,
			@PageableDefault(size = 100, sort = "id", direction = Direction.DESC) Pageable pageable) {
		Map<Integer, Integer> starScoreMap = new HashMap<>();
		List<StoreCategory> categories = new ArrayList<>();
		List<Review> reviews = new ArrayList<>();
		List<Category> categoryEntitys = categoryService.findAll();
		categoryEntitys.forEach(t -> {
			categories.add(t.getId());
		});
		if (pageName == null) {
			stores = storeService.getStoreAllList(pageable);
		} else {
			stores = storeService.findAllByStoreCategory(pageName, pageable);
		}
		stores.forEach(store -> {
			reviews.add(reviewService.findAvgStarScoreByStoreId(store.getId()));
		});
		reviews.forEach(review -> {
			if (review != null) {
				starScoreMap.put(review.getStore().getId(), review.getStarScore());
			}
		});
		List<Image> images = iImageRepository.findStoreImage();
		model.addAttribute("starScoreMap", starScoreMap);
		model.addAttribute("images", images);
		model.addAttribute("nowPage", pageName);
		model.addAttribute("categories", categories);
		model.addAttribute("stores", stores);
		franchiseMassageCount(model);
		return "store/store-main";
	}

	@GetMapping("/detail/{storeId}")
	public String detail(@PathVariable int storeId, Model model,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Store storeEntity = storeService.findById(storeId);
		List<Review> reviewList = reviewService.findByStoreId(storeEntity.getId());
		// 비로그인 회원 접속 시 임시 RoleType을 GEUST로 지정
		if (principalDetails == null) {
			principalDetails = new PrincipalDetails(new User().builder().role(RoleType.GEUST).build());
		}
		int totalRoomCount = storeEntity.getStoreTotalRoomCount();
		originLayout(totalRoomCount, model);
		getNowDateAndTime(model);
		RoleType role = principalDetails.getUser().getRole();

		model.addAttribute("store", storeEntity);
		model.addAttribute("role", role);
		List<Store> storeList = iStoreRepository.findAll();
		List<Image> image = iImageRepository.findAll();
		for (int i = 0; i < image.size(); i++) {
			if (storeEntity.getId() == image.get(i).getStore().getId() && image.size() > 5) {
				break;
			}
			model.addAttribute("images", image);
		}
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("storeList", storeList);
		return "/store/detail";
	}

	private void getNowDateAndTime(Model model) {
		MyDate myDate = new MyDate();

		String maxDate = myDate.getYearAndMonth() + "-" + myDate.getNowDay() + 7;

		String today = myDate.getNowYear() + "-" + (myDate.getNowMonth() < 10 ? "0" : "") + myDate.getNowMonth() + "-"
				+ myDate.getNowDay();

		model.addAttribute("nowDate", today);
		model.addAttribute("nowTime", myDate.getTime());
		model.addAttribute("maxDate", maxDate);
	}

	public void originLayout(int roomCount, Model model) {
		int onlyOneSpace = ((roomCount / 2) + 1);
		int standard = 6;
		int space = 6;

		model.addAttribute("onlyOneSpace", onlyOneSpace);
		model.addAttribute("totalRoomCount", roomCount);

		model.addAttribute("standard", standard);
		model.addAttribute("space", space);

		model.addAttribute("firstSpace", space);
		model.addAttribute("secondSpace", (space * 3));
		model.addAttribute("thirdSpace", (space * 5));
		model.addAttribute("foursSpace", (space * 7));

		model.addAttribute("firstStandard", (standard * 2));
		model.addAttribute("secondStandard", (standard * 4));
		model.addAttribute("thirdStandard", (standard * 6));
		model.addAttribute("foursStandard", (standard * 8));
	}

	public void otherLayout(int roomCount, Model model) {
		model.addAttribute("totalRoomCount", roomCount);
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

	@GetMapping("/chart/week")
	public String salesWeekChart(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		List<Store> stores = storeService.findAllByUserId(principalDetails.getUser().getId());
		List<AWeekStoreSales> storeSalesList = new ArrayList<>();
		List<Reservation> reservations = reservationService.findWeekSalesByStoreId(stores.get(0).getId());
		reservations.forEach(reservation -> {
			AWeekStoreSales storeSales = new AWeekStoreSales(reservation.getReservationDate(), reservation.getPrice());
			storeSalesList.add(storeSales);
		});
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String strStoreSales = objectMapper.writeValueAsString(storeSalesList);
			model.addAttribute("strStoreSales", strStoreSales);
			return "/user/my/chart/week";
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "/";
	}

	@GetMapping("/chart/today")
	public String salesTodayChart(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		List<Store> stores = storeService.findAllByUserId(principalDetails.getUser().getId());
		List<TodayStoreSales> storeSalesList = reservationService.findHourSalesByStoreId(stores.get(0).getId());
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String strStoreSales = objectMapper.writeValueAsString(storeSalesList);
			model.addAttribute("strStoreSales", strStoreSales);
			return "/user/my/chart/today";
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "/";
	}
}

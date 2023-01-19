package com.clickgo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.clickgo.project.dto.res.chart.UserStats;
import com.clickgo.project.repository.StatsRepository;

@Controller
public class ChartController {

	private final StatsRepository statsRepository;

	public ChartController(StatsRepository statsRepository) {
		this.statsRepository = statsRepository;
	}

	@GetMapping("/admin/chart/signup-stats/this-month")
	public String userMonthStats(Model model) {

		UserStats resultMonthGuestDto = statsRepository.getMonthGuestStats();
		UserStats resultMonthHostDto = statsRepository.getMonthHostStats();
		UserStats resultYearGuestDto = statsRepository.getYearGuestStats();
		UserStats resultYearHostDto = statsRepository.getYearHostStats();
		

		
		model.addAttribute("guestYearStatsCount", resultYearGuestDto.getCount());
		model.addAttribute("hostYearStatsCount", resultYearHostDto.getCount());
		
		model.addAttribute("guestMonthStatsDate", resultMonthGuestDto.getCreateDate());
		model.addAttribute("guestMonthStatsCount", resultMonthGuestDto.getCount());
		model.addAttribute("hostMonthStatsDate", resultMonthHostDto.getCreateDate());
		model.addAttribute("hostMonthStatsCount", resultMonthHostDto.getCount());
		
		
		
		return "admin/chart/signup-stats/this-month";
	}
	
	@GetMapping("/admin/chart/signup-stats/this-year")
	public String userYearStats(Model model) {


		
		
		UserStats resultYearGuestDto = statsRepository.getYearGuestStats();
		UserStats resultYearHostDto = statsRepository.getYearHostStats();
		

		
		model.addAttribute("guestYearStatsDate", resultYearGuestDto.getCreateDate());
		model.addAttribute("guestYearStatsCount", resultYearGuestDto.getCount());
		model.addAttribute("hostYearStatsDate", resultYearHostDto.getCreateDate());
		model.addAttribute("hostYearStatsCount", resultYearHostDto.getCount());
		
		
		return "admin/chart/signup-stats/this-year";
	}

}

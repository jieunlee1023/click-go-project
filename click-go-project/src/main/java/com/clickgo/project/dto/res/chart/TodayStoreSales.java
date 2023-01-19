package com.clickgo.project.dto.res.chart;

import lombok.Data;

@Data
public class TodayStoreSales {

	private String hour;
	private int price;

	public TodayStoreSales(String hour, int price) {
		this.hour = hour;
		this.price = price;
	}
}

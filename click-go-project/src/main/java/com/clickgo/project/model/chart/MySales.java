package com.clickgo.project.model.chart;

import lombok.Data;

@Data
public class MySales {

	private String month;
	private int price;

	public MySales(String month, int price) {
		this.month = month;
		this.price = price;
	}
}

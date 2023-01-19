package com.clickgo.project.dto.res.chart;

import lombok.Data;

@Data
public class AWeekStoreSales {

	private String reservationDate;
	private int price;

	public AWeekStoreSales(String reservationDate, int price) {
		this.reservationDate = reservationDate;
		this.price = price;
	}
}

package com.clickgo.project.dto.res.chart;

import java.math.BigDecimal;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Sales {

	private String storeName;
	private int price;

	public Sales(String storeName, int price) {
		this.storeName = storeName;
		this.price = price;
	}
}

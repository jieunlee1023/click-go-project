package com.clickgo.project.model.chart;

import com.clickgo.project.entity.Category;

import lombok.Data;

@Data
public class CategorySales {

	private Category category;
	private int price;

	public CategorySales(Category category, int price) {
		this.category = category;
		this.price = price;
	}
}

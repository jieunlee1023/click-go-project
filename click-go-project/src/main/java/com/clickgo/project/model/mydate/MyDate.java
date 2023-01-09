package com.clickgo.project.model.mydate;

import java.util.Date;

import lombok.Data;

@Data
public class MyDate {

	private Date date;
	private int nowYear;
	private int nowMonth;
	private int nowDay;
	private int nowHour;
	private int nowMinutes;

	public MyDate() {
		init();
	}

	private void init() {
		this.date = new Date();
		this.nowYear = (date.getYear() + 1900);
		this.nowMonth = (date.getMonth() + 1);
		this.nowDay = date.getDate();
		this.nowHour = date.getHours();
		this.nowMinutes = date.getMinutes();
	}

	public String getToday() {
		return nowYear + "-" + nowMonth + "-" + nowDay;
	}

	public String getTime() {
		return nowHour + ":" + nowMinutes;
	}

	public String getYearAndMonth() {
		return nowYear + "-" + nowMonth;
	}
}

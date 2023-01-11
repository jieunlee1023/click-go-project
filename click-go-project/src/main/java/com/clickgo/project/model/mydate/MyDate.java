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
		if (nowDay < 10) {
			return nowYear + "-0" + nowMonth + "-0" + nowDay;
		} else {
			return nowYear + "-0" + nowMonth + "-" + nowDay;
		}
	}

	public String getTime() {
		return nowHour + ":" + nowMinutes;
	}

	public String getYearAndMonth() {
		if (nowMonth < 10) {
			return nowYear + "-0" + nowMonth;
		}
		return nowYear + "-" + nowMonth;
	}

	public String getAWeekAgo() {
		if (nowDay < 10) {
			if (nowDay < 7) {
				return nowYear + "-0" + nowMonth + "-" + nowDay;
			}
			return nowYear + "-0" + nowMonth + "-0" + (nowDay - 7);
		} else {
			return nowYear + "-0" + nowMonth + "-0" + (nowDay - 7);
		}
	}
}

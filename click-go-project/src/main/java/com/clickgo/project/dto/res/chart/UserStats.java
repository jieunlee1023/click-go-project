package com.clickgo.project.dto.res.chart;

import java.math.BigInteger;

import lombok.Data;

@Data
public class UserStats {

	private String createDate;
	private int count;

	public UserStats(Object[] objs) {

		for (int i = 0; i < objs.length; i++) {
		}
		this.createDate = ((String) objs[0]);
		this.count = ((BigInteger) objs[1]).intValue();
	}

}

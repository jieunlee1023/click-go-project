package com.clickgo.project.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.clickgo.project.dto.res.chart.UserStats;

@Repository
public class StatsRepository {

	private final EntityManager entityManager;

	public StatsRepository(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public UserStats getMonthGuestStats() {

		String strQurey = " SELECT " + "  DATE_FORMAT(u.createDate, '%m') as createDate, COUNT(*) as count " + " FROM "
				+ "    user as u " + " WHERE " + "    u.role = 'geust'  "
				+ " GROUP BY DATE_FORMAT(u.createDate, '%m') ";

		Query nativeQuery = entityManager.createNativeQuery(strQurey);


		List<Object[]> resultList = nativeQuery.getResultList();

		Object[] objects = resultList.get(0);

		UserStats userStats = new UserStats(objects);

		return userStats;
	}

	public UserStats getMonthHostStats() {

		String strQurey = " SELECT " + "  DATE_FORMAT(u.createDate, '%m') as createDate, COUNT(*) as count " + " FROM "
				+ "    user as u " + " WHERE " + "    u.role = 'host'  " + " GROUP BY DATE_FORMAT(u.createDate, '%m') ";

		Query nativeQuery = entityManager.createNativeQuery(strQurey);


		List<Object[]> resultList = nativeQuery.getResultList();

		Object[] objects = resultList.get(0);

		UserStats userStats = new UserStats(objects);

		return userStats;
	}

	public UserStats getYearGuestStats() {

		String strQurey = " SELECT " + "  DATE_FORMAT(u.createDate, '%Y') as createDate, COUNT(*) as count " + " FROM "
				+ "    user as u " + " WHERE " + "    u.role = 'geust'  "
				+ " GROUP BY DATE_FORMAT(u.createDate, '%Y') ";

		Query nativeQuery = entityManager.createNativeQuery(strQurey);


		List<Object[]> resultList = nativeQuery.getResultList();

		Object[] objects = resultList.get(0);

		UserStats userStats = new UserStats(objects);

		return userStats;
	}

	public UserStats getYearHostStats() {

		String strQurey = " SELECT " + "  DATE_FORMAT(u.createDate, '%Y') as createDate, COUNT(*) as count " + " FROM "
				+ "    user as u " + " WHERE " + "    u.role = 'host'  "
				+ " GROUP BY DATE_FORMAT(u.createDate, '%Y') ";

		Query nativeQuery = entityManager.createNativeQuery(strQurey);


		List<Object[]> resultList = nativeQuery.getResultList();

		Object[] objects = resultList.get(0);

		UserStats userStats = new UserStats(objects);

		return userStats;
	}

}

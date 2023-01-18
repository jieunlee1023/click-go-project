package com.clickgo.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.dto.res.chart.AWeekStoreSales;
import com.clickgo.project.dto.res.chart.TodayStoreSales;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.model.mydate.MyDate;
import com.clickgo.project.repository.IReservationRepository;

@Service
public class ReservationService {

	private int sales;

	@Autowired
	private IReservationRepository ireservationRepository;

	@Transactional
	public Page<Reservation> searchBoard(User user, Pageable pageable) {
		if (user.getRole().equals(RoleType.GEUST)) {
			return ireservationRepository.findByReservation(user.getId(), pageable);
		} else {
			return ireservationRepository.findByHostReservation1(user.getId(), pageable);
		}
	}

	@Transactional
	public Page<Reservation> searchAllBoard(Pageable pageable) {
		return ireservationRepository.findAll(pageable);
	}

	@Transactional
	public void save(Reservation reservation) {
		ireservationRepository.save(reservation);
	}

	@Transactional
	public List<Reservation> findByStoreId(int storeId) {
		return ireservationRepository.findByStoreId(storeId);
	}
	
	public List<Reservation> findSeatByStoreId(int storeId) {
		return ireservationRepository.findSeatByStoreId(storeId);
	}

	@Transactional
	public List<Reservation> findByStoreIdAndApprove(int storeId) {
		return ireservationRepository.findByStoreIdAndApprove(storeId);
	}

	@Transactional
	public void approve(int id) {
		Reservation reservationEntity = ireservationRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("시도하시려는 예약이 존재하지 않습니다.");
		});
		reservationEntity.setApproveStatus(ApproveStatus.APPROVED);
	}

	@Transactional
	public int findLastPK() {
		return ireservationRepository.findLastPK();
	}

	@Transactional
	public void delete(int cancelReservation) {
		ireservationRepository.deleteById(cancelReservation);
	}

	@Transactional
	public Reservation findById(int reservationId) {
		return ireservationRepository.findById(reservationId).orElseThrow(() -> {
			return new IllegalArgumentException("예약 번호를 찾을 수 없습니다.");
		});
	}

	@Transactional
	public void reject(int id) {
		Reservation reservation = ireservationRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("시도하시려는 예약이 존재하지 않습니다.");
		});
		reservation.setApproveStatus(ApproveStatus.REJECT);
	}

	@Transactional
	public List<Reservation> findByStoreIdAndNotReject(int storeId) {
		return ireservationRepository.findByStoreIdAndNotReject(storeId);
	}

	@Transactional
	public int findTodaySalesByStoreId(int storeId) {
		MyDate myDate = new MyDate();
		sales = 0;
		List<Reservation> reservations = ireservationRepository.findTodaySalesByStoreId(storeId, myDate.getToday());
		reservations.forEach(reservation -> {
			sales += reservation.getPrice();
		});
		return sales;
	}

	@Transactional
	public int findMonthSalesByStoreId(int storeId) {
		MyDate myDate = new MyDate();
		sales = 0;
		List<Reservation> reservations = ireservationRepository.findMonthSalesByStoreId(storeId,
				myDate.getYearAndMonth());
		reservations.forEach(reservation -> {
			sales += reservation.getPrice();
		});
		return sales;
	}

	@Transactional
	public int findYearSalesByStoreId(int storeId) {
		MyDate myDate = new MyDate();
		sales = 0;
		List<Reservation> reservations = ireservationRepository.findYearSalesByStoreId(storeId, myDate.getNowYear());
		reservations.forEach(reservation -> {
			sales += reservation.getPrice();
		});
		return sales;
	}

	@Transactional
	public List<Reservation> findAllOfMonthNotReject() {
		return ireservationRepository.findAllOfMonthNotReject();
	}

	@Transactional
	public List<Reservation> findAllGroupByCategoryIdWhenToday() {
		MyDate myDate = new MyDate();
		return ireservationRepository.findAllGroupByCategoryIdWhenToday(myDate.getToday());
	}

	@Transactional
	public List<Reservation> findAllGroupByCategoryIdWhenThisMonth() {
		MyDate myDate = new MyDate();
		return ireservationRepository.findAllGroupByCategoryIdWhenThisMonth(myDate.getYearAndMonth());
	}

	@Transactional
	public List<Reservation> findAllGroupByCategoryIdWhenThisYear() {
		MyDate myDate = new MyDate();
		return ireservationRepository.findAllGroupByCategoryIdWhenThisYear(myDate.getNowYear());
	}

	@Transactional
	public Page<Reservation> findAllPage(Pageable pageable) {
		return ireservationRepository.findAll(pageable);
	}
	
	@Transactional
	public List<Reservation> findAll() {
		return ireservationRepository.findAll();
	}

	@Transactional
	public List<Reservation> findWeekSalesByStoreId(int storeId) {
		MyDate myDate = new MyDate();
		String aWeekAgo = myDate.getAWeekAgo();
		return ireservationRepository.findWeekSalesByStoreId(storeId, aWeekAgo);
	}

	@Transactional
	public List<TodayStoreSales> findHourSalesByStoreId(int storeId) {
		List<TodayStoreSales> storeSales = new ArrayList<>();
		MyDate myDate = new MyDate();
		String today = myDate.getToday();
		TodayStoreSales sales = null;
		Object objHour = null;
		String strHour = null;
		for (int hour = 1; hour <= myDate.getNowHour(); hour++) {
			Reservation reservationEntity = ireservationRepository.findHourSalesByStoreId(storeId, hour + ":", today);
			if (reservationEntity != null) {
				objHour = hour;
				strHour = objHour.toString();
				sales = new TodayStoreSales(strHour, reservationEntity.getPrice());
				storeSales.add(sales);
			} else {
				objHour = hour;
				strHour = objHour.toString();
				sales = new TodayStoreSales(strHour, 0);
				storeSales.add(sales);
			}
		}
		return storeSales;
	}
//	@Transactional
//	public Page<Reservation> searchReservation(String q, Pageable pageable) {
//		return ireservationRepository.findByStoreNameContaining(q, pageable);
//	}

	
}

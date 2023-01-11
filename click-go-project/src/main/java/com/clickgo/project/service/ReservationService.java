package com.clickgo.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.chart.AWeekStoreSales;
import com.clickgo.project.model.chart.TodayStoreSales;
import com.clickgo.project.model.enums.ApproveStatus;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.model.mydate.MyDate;
import com.clickgo.project.repository.IReservationRepository;

@Service
public class ReservationService {

	private int sales;

	@Autowired
	private IReservationRepository reservationRepository;

	@Transactional
	public Page<Reservation> searchBoard(User user, Pageable pageable) {
		if (user.getRole().equals(RoleType.GEUST)) {
			return reservationRepository.findByReservation(user.getId(), pageable);
		} else {
			return reservationRepository.findByHostReservation1(user.getId(), pageable);
		}
	}

	@Transactional
	public Page<Reservation> searchAllBoard(Pageable pageable) {
		return reservationRepository.findAll(pageable);
	}

	@Transactional
	public void save(Reservation reservation) {
		reservationRepository.save(reservation);
	}

	@Transactional
	public List<Reservation> findByStoreId(int storeId) {
		return reservationRepository.findByStoreId(storeId);
	}
	
	public List<Reservation> findSeatByStoreId(int storeId) {
		return reservationRepository.findSeatByStoreId(storeId);
	}

	@Transactional
	public List<Reservation> findByStoreIdAndApprove(int storeId) {
		return reservationRepository.findByStoreIdAndApprove(storeId);
	}

	@Transactional
	public void approve(int id) {
		Reservation reservationEntity = reservationRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("시도하시려는 예약이 존재하지 않습니다.");
		});
		reservationEntity.setApproveStatus(ApproveStatus.APPROVED);
	}

	@Transactional
	public int findLastPK() {
		return reservationRepository.findLastPK();
	}

	@Transactional
	public void delete(int cancelReservation) {
		reservationRepository.deleteById(cancelReservation);
	}

	@Transactional
	public Reservation findById(int reservationId) {
		return reservationRepository.findById(reservationId).orElseThrow(() -> {
			return new IllegalArgumentException("예약 번호를 찾을 수 없습니다.");
		});
	}

	@Transactional
	public void reject(int id) {
		Reservation reservation = reservationRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("시도하시려는 예약이 존재하지 않습니다.");
		});
		reservation.setApproveStatus(ApproveStatus.REJECT);
	}

	@Transactional
	public List<Reservation> findByStoreIdAndNotReject(int storeId) {
		return reservationRepository.findByStoreIdAndNotReject(storeId);
	}

	@Transactional
	public int findTodaySalesByStoreId(int storeId) {
		MyDate myDate = new MyDate();
		sales = 0;
		List<Reservation> reservations = reservationRepository.findTodaySalesByStoreId(storeId, myDate.getToday());
		reservations.forEach(reservation -> {
			sales += reservation.getPrice();
		});
		return sales;
	}

	@Transactional
	public int findMonthSalesByStoreId(int storeId) {
		MyDate myDate = new MyDate();
		sales = 0;
		List<Reservation> reservations = reservationRepository.findMonthSalesByStoreId(storeId,
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
		List<Reservation> reservations = reservationRepository.findYearSalesByStoreId(storeId, myDate.getNowYear());
		reservations.forEach(reservation -> {
			sales += reservation.getPrice();
		});
		return sales;
	}

	@Transactional
	public List<Reservation> findAllOfMonthNotReject() {
		return reservationRepository.findAllOfMonthNotReject();
	}

	@Transactional
	public List<Reservation> findAllGroupByCategoryIdWhenToday() {
		MyDate myDate = new MyDate();
		return reservationRepository.findAllGroupByCategoryIdWhenToday(myDate.getToday());
	}

	@Transactional
	public List<Reservation> findAllGroupByCategoryIdWhenThisMonth() {
		MyDate myDate = new MyDate();
		return reservationRepository.findAllGroupByCategoryIdWhenThisMonth(myDate.getYearAndMonth());
	}

	@Transactional
	public List<Reservation> findAllGroupByCategoryIdWhenThisYear() {
		MyDate myDate = new MyDate();
		return reservationRepository.findAllGroupByCategoryIdWhenThisYear(myDate.getNowYear());
	}

	@Transactional
	public List<Reservation> findAll() {
		return reservationRepository.findAll();
	}

	@Transactional
	public List<Reservation> findWeekSalesByStoreId(int storeId) {
		MyDate myDate = new MyDate();
		String aWeekAgo = myDate.getAWeekAgo();
		System.out.println(aWeekAgo);
		return reservationRepository.findWeekSalesByStoreId(storeId, aWeekAgo);
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
			Reservation reservationEntity = reservationRepository.findHourSalesByStoreId(storeId, hour + ":", today);
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
}

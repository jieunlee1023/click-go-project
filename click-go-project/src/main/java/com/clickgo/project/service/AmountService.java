package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clickgo.project.dto.res.kakaoPay.Amount;
import com.clickgo.project.repository.IAmountRepository;

@Service
public class AmountService {

	@Autowired
	private IAmountRepository amountRepository;

	public void save(Amount amount) {
		amountRepository.save(amount);
	}
}

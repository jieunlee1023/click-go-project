package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.Caution;
import com.clickgo.project.repository.ICautionRepository;

@Service
public class CautionService {

	@Autowired
	private ICautionRepository cautionRepository;

	@Transactional
	public void save(Caution caution) {
		cautionRepository.save(caution);
	}

	public Caution findLastIdByUserId(int id) {
		return cautionRepository.findLastIdByUserId(id);
	}
}

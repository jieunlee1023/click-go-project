package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.dto.res.Kategory;
import com.clickgo.project.repository.IKategoryRepository;

@Service
public class KategoryService {

	@Autowired
	private IKategoryRepository kategoryRepository;

	@Transactional
	public List<Kategory> findAll() {
		return kategoryRepository.findAll();
	}
}

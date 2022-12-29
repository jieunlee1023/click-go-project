package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.dto.res.Category;
import com.clickgo.project.repository.ICategoryRepository;

@Service
public class KategoryService {

	@Autowired
	private ICategoryRepository kategoryRepository;

	@Transactional
	public List<Category> findAll() {
		return kategoryRepository.findAll();
	}
}

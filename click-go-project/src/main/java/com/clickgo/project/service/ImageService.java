package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clickgo.project.entity.Image;
import com.clickgo.project.repository.IImageRepository;

@Service
public class ImageService {

	@Autowired
	private IImageRepository imageRepository;

	public void save(Image image) {
		imageRepository.save(image);
	}

	public List<Image> findByStoreId(int id) {
		return imageRepository.findByStoreId(id);
	}
}

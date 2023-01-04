package com.clickgo.project.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.clickgo.project.dto.res.RequestUpdateFileDto;
import com.clickgo.project.entity.Image;
import com.clickgo.project.entity.Store;
import com.clickgo.project.repository.IImageRepository;
import com.clickgo.project.repository.IStoreRepository;

@Service
public class StoreService {

	@Autowired
	private IStoreRepository storeRepository;

	@Autowired
	private IImageRepository imageRepository;

	@Value("${licenceFile.path}")
	private String licenceFile;

	@Value("${phoneNumber.key}")
	private String phoneNumber;
	
	@Value("${storeImageFile.path}")
	private String storeImageFile;

	@Transactional
	public Store findById(int id) {
		return storeRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("찾으시는 가맹점이 존재하지 않습니다.");
		});
	}

	@Transactional
	public Page<Store> getStoreAllList(Pageable pageable) {
		return storeRepository.findAll(pageable);
	}

	@Transactional
	public List<Store> findAllByUserId(int id) {
		return storeRepository.findAllByUserId(id);
	}

	@Transactional
	public Store update(MultipartHttpServletRequest files, RequestUpdateFileDto fileDto, Store store, int userId) {
		Store storeEntity = storeRepository.findById(store.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("수정하시려는 가맹점을 찾을 수 없습니다.");
		});

		//File updateFile = new File(storeImageFile);
		Iterator<String> iterator = files.getFileNames(); 
		MultipartFile multipartFile = null;
		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
			multipartFile= files.getFile(uploadFileName);
			String originalFilename = multipartFile.getOriginalFilename();
			System.out.println("originalFilename>>>"+originalFilename);
			UUID uuid = UUID.randomUUID();
			
			String StoreImageFilename = uuid + "_" + originalFilename;
			Path StoreImageLicenseFilePath = Paths.get(storeImageFile + StoreImageFilename);
			
			try {
				Files.write(StoreImageLicenseFilePath, originalFilename.getBytes());
				Image image = fileDto.toEntitiy(StoreImageFilename, storeEntity);
				imageRepository.save(image);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		

		if (storeEntity.getUser().getId() == userId) {
			storeEntity.setStoreTEL(store.getStoreTEL());
			storeEntity.setStoreTotalRoomCount(store.getStoreTotalRoomCount());
			storeEntity.setPrice(store.getPrice());

			if (store.getStoreTEL() == null) {
				storeEntity.setStoreTEL(phoneNumber);
			}
		}
		return storeEntity;
	}

	public Page<Store> findAllByStoreCategory(String pageName, Pageable pageable) {
		return storeRepository.findAllByStoreCategory(pageName, pageable);
	}

	// 검색
	@Transactional
	public Page<Store> searchStoreList(String q, Pageable pageable) {
		return storeRepository.findByStoreNameContaining(q, pageable);
	}

}

package com.clickgo.project.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public Page<Store> getStoreAllList(String q, Pageable pageable) {
		return storeRepository.findByStoreNameContaining(q, pageable);
	}

	@Transactional
	public List<Store> findAllByUserId(int id) {
		return storeRepository.findAllByUserId(id);
	}

	@Transactional
	public boolean update( RequestUpdateFileDto fileDto, Store store, int userId)
			throws UnsupportedEncodingException {
		Store storeEntity = storeRepository.findById(store.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("수정하시려는 가맹점을 찾을 수 없습니다.");
		});
		
		
		UUID uuid = UUID.randomUUID();
		
		for (int i = 0; i < fileDto.getFiles().length; i++) {
			
			String StoreImageFilename = uuid + "_" +fileDto.getFiles()[i].getOriginalFilename() ;
			Path StoreImageLicenseFilePath = Paths.get(storeImageFile + StoreImageFilename);
			try {
				Files.write(StoreImageLicenseFilePath, fileDto.getFiles()[i].getBytes());
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
		return true;
	}

	public Page<Store> findAllByStoreCategory(String pageName, String q, Pageable pageable) {
		return storeRepository.findAllByStoreCategory(pageName, q, pageable);
	}

	@Transactional
	public Page<Store> searchStoreList(String q, Pageable pageable) {
		return storeRepository.findByStoreNameContaining(q, pageable);
	}


	public List<Store> findAll() {
		return storeRepository.findAll();
	}

}

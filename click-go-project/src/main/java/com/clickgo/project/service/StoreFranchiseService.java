package com.clickgo.project.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.RequestFileDto;
import com.clickgo.project.dto.res.Store;
import com.clickgo.project.dto.res.StoreFranchise;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.repository.IStoreFranchiseRepository;
import com.clickgo.project.repository.IStoreRepository;
import com.clickgo.project.repository.IUserRepository;

@Service
public class StoreFranchiseService {
	@Autowired
	private IStoreFranchiseRepository franchiseRepository;
	@Autowired
	private IUserRepository userRepository;
	@Autowired
	private IStoreRepository storeRepository;
	
	@Value("${licenceFile.path}")
	private String licenceFile;

	@Transactional
	public void apply(RequestFileDto fileDto, PrincipalDetails principalDetails) {
		UUID uuid = UUID.randomUUID();
		System.out.println("uuid:" + uuid);
		
		String imageFilename = uuid+"_"+fileDto.getFile().getOriginalFilename();
		System.out.println("imageFileName:"+imageFilename);

		Path imageFilePath = Paths.get(licenceFile+imageFilename);
		System.out.println("파일패스:"+imageFilePath);
		
		try {
			Files.write(imageFilePath, fileDto.getFile().getBytes());
			StoreFranchise franchise = fileDto.toEntitiy(imageFilename, principalDetails.getUser());
			franchiseRepository.save(franchise);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Transactional
	public List<StoreFranchise> getMessageList() {
		return franchiseRepository.findAll();
	}

	@Transactional
	public boolean deleteByIdAndUserApprove(int id,int userId,StoreFranchise storeFranchise, Store store) {

		franchiseRepository.deleteById(storeFranchise.getId());
		userRepository.findById(userId).get().setRole(RoleType.HOST);
		
//		store.setKategory(storeFranchise.getCategory());
		store.setStoreName(storeFranchise.getStoreName());
		store.setStoreTEL(storeFranchise.getStoreTEL());
		store.setStoreAddress(storeFranchise.getStoreAddress());
		store.setStoreTotalRoomCount(0);
		store.setUser(userRepository.findById(userId).get());
		
		storeRepository.save(store);

		return true;
	}
}

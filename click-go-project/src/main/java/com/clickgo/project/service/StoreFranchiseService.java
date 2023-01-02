package com.clickgo.project.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.RequestFileDto;
import com.clickgo.project.entity.Image;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.model.enums.StoreFranchiseState;
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

	@Value("${layoutFile.path}")
	private String layoutFile;
	
	@Transactional
	public void apply(RequestFileDto fileDto, PrincipalDetails principalDetails) {
		UUID uuid = UUID.randomUUID();

		// TODO
		String businessLicenseFilename = uuid + "_" + fileDto.getFile().get(0).getOriginalFilename();
		String seatLayoutFilename = uuid + "_" + fileDto.getFile().get(1).getOriginalFilename();

		Path businessLicenseFilePath = Paths.get(licenceFile + businessLicenseFilename);
		Path seatLayoutFilePath = Paths.get(layoutFile + seatLayoutFilename);

		try {
			System.out.println(businessLicenseFilename);
			System.out.println(seatLayoutFilename);

			Files.write(businessLicenseFilePath, fileDto.getFile().get(0).getBytes());
			Files.write(seatLayoutFilePath, fileDto.getFile().get(1).getBytes());

			StoreFranchise franchise = fileDto.toEntitiy(businessLicenseFilename, seatLayoutFilename,
					principalDetails.getUser());

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
	public Store changeStateApproveAndAddStore(int id, int userId, StoreFranchise storeFranchise, Store store) {

		userRepository.findById(userId).get().setRole(RoleType.HOST);
		franchiseRepository.findById(id).get().setState(StoreFranchiseState.APPROVE);

		store.setCategory(storeFranchise.getCategory());
		store.setStoreName(storeFranchise.getStoreName());
		store.setStoreTEL(storeFranchise.getStoreTEL());
		store.setStoreAddress(storeFranchise.getStoreAddress());
		store.setStoreTotalRoomCount(storeFranchise.getStoreTotalRoomCount());
		store.setPrice(storeFranchise.getPrice());
		store.setUser(userRepository.findById(userId).get());

		storeRepository.save(store);
		return store;
	}

	@Transactional
	public boolean changeStateReject(int id, int userId, StoreFranchise storeFranchise, Store store) {

		franchiseRepository.findById(id).get().setState(StoreFranchiseState.REJECT);
		franchiseRepository.findById(id).get().setRejectReason(storeFranchise.getRejectReason());

		return true;
	}
}

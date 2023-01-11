package com.clickgo.project.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.RequestAdminFileDto;
import com.clickgo.project.entity.Admin;
import com.clickgo.project.repository.IAdminRepository;
import com.clickgo.project.repository.IUserRepository;

@Service
public class AdminService {

	@Autowired
	private IAdminRepository adminRepository;

	@Autowired
	private IUserRepository userRepository;

	@Value("${AdminImageFile.path}")
	private String profileFile;

	@Transactional
	public Admin saveProfile(int userId, RequestAdminFileDto adminFileDto, PrincipalDetails principalDetails) {

		Admin adminEntity = adminRepository.findbyUserId(userId);
		UUID uuid = UUID.randomUUID();
		String profileFilename = uuid + "_" + adminFileDto.getFile().getOriginalFilename();
		Path profileFilePath = Paths.get(profileFile + profileFilename);
		try {
			Files.write(profileFilePath, adminFileDto.getFile().getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (adminEntity == null) {
			adminEntity = adminFileDto.toEntitiy(profileFilename, principalDetails.getUser());
			adminRepository.save(adminEntity);

		} else {
			adminEntity.setNickName(adminFileDto.getNickName());
			adminEntity.setBlogLink(adminFileDto.getBlogLink());
			adminEntity.setMyInfo(adminFileDto.getMyInfo());
			adminEntity.setProfileUrl(profileFilename);
		}
		return adminEntity;

	}

	public Admin findByUserId(int id) {
		return adminRepository.findbyUserId(id);
	}

}

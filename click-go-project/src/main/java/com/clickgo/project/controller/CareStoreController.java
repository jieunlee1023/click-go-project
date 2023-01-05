package com.clickgo.project.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.RequestUpdateFileDto;
import com.clickgo.project.entity.Image;
import com.clickgo.project.entity.Store;
import com.clickgo.project.repository.IImageRepository;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/care-store")
@CrossOrigin
public class CareStoreController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private IImageRepository imageRepository;

	@GetMapping({ "", "/" })
	public String careStroeList(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		List<Store> stores = storeService.findAllByUserId(principalDetails.getUser().getId());
		model.addAttribute("stores", stores);
		return "/user/my/care-store/list";
	}

	@GetMapping("/update/{id}")
	public String careStoreUpdate(@PathVariable int id, Model model,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Store storeEntity = storeService.findById(id);
		if (storeEntity.getUser().getId() == principalDetails.getUser().getId()) {
			model.addAttribute("store", storeEntity);
		}
		List<Image> image = imageRepository.findAll();
		model.addAttribute("images", image);

		return "/user/my/care-store/update";
	}


	@PostMapping("/detail/update")
	public String updateCareStoreDetail(RequestUpdateFileDto fileDto, Store store,
			@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {

		try {
			storeService.update(fileDto, store, principalDetails.getUser().getId());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Image> image = imageRepository.findAll();
		model.addAttribute("images", image);

		return "/user/my/care-store/update";
	}

}

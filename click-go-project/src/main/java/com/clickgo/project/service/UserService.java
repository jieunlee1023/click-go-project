package com.clickgo.project.service;

import org.springframework.transaction.annotation.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.clickgo.project.dto.res.User;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.repository.IUserRepository;

@Service
public class UserService {

	@Autowired
	private IUserRepository userRepository;
	@Autowired
	private BCryptPasswordEncoder encoder;

	@Transactional
	public User findByUsername(String username) {
		User userEntity = userRepository.findByUsername(username).orElseThrow(() -> {
			return new IllegalArgumentException("존재하지 않는 회원입니다.");
		});
		return userEntity;
	}

	@Transactional
	public boolean signUp(User user) {
		try {
			String rawPw = encoder.encode(user.getPassword());
			user.setPassword(rawPw);
			user.setRole(RoleType.GEUST);
			userRepository.save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Transactional
	public User searchUserName(String username) {
		return userRepository.findByUsername(username).orElseGet(() -> {
			return new User();
		});
	}

	@Transactional
	public boolean saveUser(User user) {
		try {
			// 비밀번호를 넣을 때 여기서 암호화 처리 하고 DB 저장 하기 !
			String rawPassword = user.getPassword();
			String encPassword = encoder.encode(rawPassword);
			user.setPassword(encPassword);
			user.setRole(RoleType.GEUST);
			userRepository.save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Transactional
	public User updateUser(User user) {
		User userEntity = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("찾을 수 없는 회원입니다.");
		});

		if (userEntity.getLoginType() == null || userEntity.getLoginType().equals("")) {

			String rawPassword = user.getPassword();
			String encPassword = encoder.encode(rawPassword);

			userEntity.setPassword(encPassword);
			userEntity.setEmail(user.getEmail());
			userEntity.setPhoneNumber(user.getPhoneNumber());
		}
		return userEntity;
	}
}

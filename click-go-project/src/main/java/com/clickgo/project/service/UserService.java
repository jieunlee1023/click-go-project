package com.clickgo.project.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.clickgo.project.dto.res.User;
import com.clickgo.project.repository.IUserRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserService {

	private final IUserRepository repository;
	private final BCryptPasswordEncoder encoder;

	public User findByUsername(String username) {
		User userEntity = repository.findByUsername(username).orElseThrow(() -> {
			return new IllegalArgumentException("존재하지 않는 회원입니다.");
		});
		return userEntity;
	}

	public boolean signUp(User user) {
		try {
			String rawPw = encoder.encode(user.getPassword());
			user.setPassword(rawPw);
			repository.save(user);
			System.out.println("1");
			return true;
		} catch (Exception e) {
			System.out.println("2");
			e.printStackTrace();
			return false;
		}
	}
}

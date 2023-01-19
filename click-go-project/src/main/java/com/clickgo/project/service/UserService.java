package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.Caution;
import com.clickgo.project.entity.DeleteUser;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.LoginType;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.model.mydate.MyDate;
import com.clickgo.project.repository.IDeleteUserRepository;
import com.clickgo.project.repository.IUserRepository;

@Service
public class UserService {

	@Autowired
	private IUserRepository userRepository;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private IDeleteUserRepository deleteUserRepository;
	@Autowired
	private StoreService storeService;
	@Autowired
	private CautionService cautionService;
	boolean flag;

	@Transactional
	public int findByUsername(String username) {
		User userEntity = userRepository.findByUsername(username).orElseThrow(() -> {
			return new IllegalArgumentException("존재하지 않는 회원입니다.");
		});
		return 1;
	}

	@Transactional
	public boolean signUp(User user) {
		try {
			if (user.getLoginType() == null) {
				user.setLoginType(LoginType.CLICKGO);
			}
			String rawPw = encoder.encode(user.getPassword());
			user.setRole(RoleType.GEUST);
			user.setPassword(rawPw);
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

	@Transactional
	public void deleteUser(int userId, int requestUserId) {
		User userEntity = userRepository.findById(userId).orElseThrow(() -> {
			return new IllegalArgumentException("찾을 수 없는 회원입니다.");
		});
		new DeleteUser();
		deleteUserRepository.save(DeleteUser.builder().username(userEntity.getUsername())
				.password(userEntity.getPassword()).deleteDate(userEntity.getCreateDate()).email(userEntity.getEmail())
				.loginType(userEntity.getLoginType()).phoneNumber(userEntity.getPhoneNumber())
				.role(userEntity.getRole()).build());
		try {
			userRepository.deleteById(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Transactional
	public User searchUserEmail(String email) {
		return userRepository.findByEmail(email).orElseThrow(() -> {
			return new IllegalArgumentException();
		});
	}

	@Transactional
	public User searchPassword(String username, String email) {
		return userRepository.findByPassword(username, email).orElseThrow(() -> {
			return new IllegalArgumentException("아이디와 이메일이 일치하지 않습니다. 다시 확인해주세요");
		});
	}

	// 임시비밀번호로 DB저장
	@Transactional
	public String searchPasswordChange(String email) {
		User userEntity = userRepository.findByEmail(email).orElseThrow(() -> {
			return new IllegalArgumentException("찾을 수 없는 회원입니다.");
		});
		String rawPassword = "";
		if (userEntity.getLoginType().equals(LoginType.CLICKGO)) {

			rawPassword = getTempPassword();
			String encPassword = encoder.encode(rawPassword);

			userEntity.setPassword(encPassword);

		}
		return rawPassword;
	}

	// 임시비밀번호 생성
	public String getTempPassword() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String str = "";

		// 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			str += charSet[idx];
		}
		return str;
	}

	// 아이디 중복 검사
	public User checkID(String username) {
		User userEntity = userRepository.findByUsername(username).orElseThrow(() -> {
			return new IllegalArgumentException("테스트");
		});
		return userEntity;
	}

	@Transactional
	public Page<User> searchUserInfo(String q, Pageable pageable) {
		// TODO Auto-generated method stub
		return userRepository.findByUsernameContaining(q, pageable);
	}

	@Transactional
	public User findById(int id) {
		return userRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("찾으시는 유저가 존재하지 않습니다.");
		});
	}

	@Transactional
	public boolean updateReportCountPlus(User user) {
		User userEntity = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("해당 유저를 찾을 수 없습니다.");
		});
		userEntity.setReportCount(user.getReportCount() + 1);
		return true;
	}

	@Transactional
	public boolean updateReportCountMinus(User user) {
		User userEntity = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("해당 유저를 찾을 수 없습니다.");
		});
		if (user.getReportCount() > 0) {
			userEntity.setReportCount(user.getReportCount() - 1);
			return true;
		} else {
			return false;
		}
	}

	@Transactional
	public boolean sendCaution(int userId, Caution caution) {
		User userEntity = userRepository.findById(userId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 유저를 찾을 수 없습니다.");
		});
		userEntity.setCautionStatus(true);
		caution.setUser(userEntity);
		cautionService.save(caution);
		return true;
	}

	@Transactional
	public boolean cancelCaution(int userId) {
		User userEntity = userRepository.findById(userId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 유저를 찾을 수 없습니다.");
		});
		userEntity.setCautionStatus(false);
		return true;
	}

	@Transactional
	public boolean blacklist(User user) {
		User userEntity = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("해당 유저를 찾을 수 없습니다.");
		});
		MyDate myDate = new MyDate();
		userEntity.setRole(RoleType.BLACKLIST);
		return true;
	}

	@Transactional
	public boolean cancelBlacklist(User user) {
		User userEntity = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("해당 유저를 찾을 수 없습니다.");
		});
		List<Store> stores = storeService.findAll();
		flag = true;
		stores.forEach(store -> {
			if (flag) {
				if (store.getUser().getId() == userEntity.getId()) {
					userEntity.setRole(RoleType.HOST);
					flag = false;
				} else {
					userEntity.setRole(RoleType.GEUST);
				}
			}
		});
		return true;
	}

	@Transactional
	public void deductionPoint(User user, int point) {
		User userEntity = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("해당 유저를 찾을 수 없습니다.");
		});

		userEntity.setPoint(point);
	}
}

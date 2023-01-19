package com.clickgo.project.api;

import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.Note;
import com.clickgo.project.entity.Reservation;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.LoginType;
import com.clickgo.project.model.enums.NoteType;
import com.clickgo.project.repository.IReservationRepository;
import com.clickgo.project.service.NoteService;
import com.clickgo.project.service.ReservationService;
import com.clickgo.project.service.StoreService;
import com.clickgo.project.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/user")
@RequiredArgsConstructor
public class UserApiController {

	@Value("${mail.pw}")
	private String password;

	@Value("${mail.id}")
	private String id;

	private final NoteService noteService;
	private final UserService userService;
	private final StoreService storeService;
	
	private final AuthenticationManager authenticationManager;
	private final ReservationService reservationService;

	@PostMapping("/sign-up")
	public ResponseDto<?> signUp(@Valid @RequestBody User user, Model model) {
		boolean success = userService.signUp(user);
		return new ResponseDto<>(success, user.getUsername() + "님 회원가입을 진심으로 축하드립니다.");
	}

	@PostMapping("/update")
	public ResponseDto<?> pwdUpdate(@RequestBody User user) {

		try {
			userService.updateUser(user);
			Authentication authentication = authenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
			SecurityContextHolder.getContext().setAuthentication(authentication);
			return new ResponseDto<>(true, "회원정보 수정에 성공하셨습니다 !!");
		} catch (Exception e) {
			return new ResponseDto<>(false, "회원정보 수정에 실패하셨습니다...");
		}
	}

	@DeleteMapping("/delete/{userId}")
	public ResponseDto<?> userDelete(@PathVariable int userId, @AuthenticationPrincipal PrincipalDetails details,
			HttpServletRequest req, HttpServletResponse res) {
		try {
			userService.deleteUser(userId, details.getUser().getId());
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); // 세션 생성 x , 세션 가져오기
			if (authentication != null) {
				new SecurityContextLogoutHandler().logout(req, res, authentication);
				Thread.sleep(1000);
			}
			return new ResponseDto<>(true, "회원탈퇴에 성공하셨습니다 !!");
		} catch (Exception e) {
			return new ResponseDto<>(false, "회원탈퇴에 실패하셨습니다...");
		}
	}

	// 아이디 찾기
	@PostMapping("/search")
	public ResponseDto<?> selectEamil(@RequestBody User user) {
		User userEntity = userService.searchUserEmail(user.getEmail());
		return new ResponseDto<>(true, userEntity.getUsername());
	}

	// 비밀번호 찾기
	@PostMapping("/send-mail")
	public ResponseDto<?> mailSend(@RequestBody User user) {

		User userEntity = userService.searchPassword(user.getUsername(), user.getEmail()); 
		LoginType lognType;
		try {
			lognType = userEntity.getLoginType();
		} catch (Exception e) {
			lognType = LoginType.CLICKGO;
		}

		if (lognType != LoginType.CLICKGO) {
			return new ResponseDto<String>(false, new String("소셜회원은 아이디/비밀번호를 찾을 수 없습니다. 관리자에게 문의해주세요"));
		}
		return new ResponseDto<>(true, naverMailSend(userEntity.getEmail()));
	}

	public int naverMailSend(String email) { 
		String host = "smtp.naver.com";
		// 테스트후 개인정보 보안상 비밀번호는 지워주세요

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties(); // Properties는 java.util의 Properties입니다.
		props.put("mail.smtp.host", host); // smtp의 호스트
		props.put("mail.smtp.port", 587); // 587 포트 사용
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 이 설정을 안붙이면 TLS Exception이 뜨더라구요. (버전이 안맞아서)

		Session session = Session.getDefaultInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(id)); // 발신자의 이메일
			// 수신자 이메일
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			// 메일 제목
			message.setSubject("Click-Go");

			// 메일 내용
			String temporary = userService.searchPasswordChange(email);
			message.setText("안녕하세요.\n 저희 클릭고 입니다. \n 임시비밀번호 : " + temporary); // 랜덤인 임시비밀번호를 생성

			// send the message
			Transport.send(message);
			return 0;
		} catch (MessagingException e) {
			e.printStackTrace();
			return -1;
		}
	}

	// 아이디 중복체크
	@PostMapping("/check-id")
	public int checkId(@RequestBody User user) {
		try {
			int result = userService.findByUsername(user.getUsername());
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	// 이메일 중복체크
	@PostMapping("/check-email")
	public int checkEmail(@RequestBody User user) {
		try {
			User userEntity = userService.searchUserEmail(user.getEmail());
			int result = (userEntity != null) ? 1 : -1;
			return result;
		} catch (Exception e) {
			return -1;
		}
	}

	// 과거에 갔던 가게 리스트 보기(10개)
	@GetMapping("/reservationed")
	public ResponseDto<?> sendMessage(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		System.err.println("들어옴?");
		List<Reservation> reservationedList = reservationService
				.findReservationedUser(principalDetails.getUser().getId());
		
		ObjectMapper mapper = new ObjectMapper();
		String array = "";
		try {
			array = mapper.writeValueAsString(reservationedList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return new ResponseDto<>(true, array);
	}
	
	// 과거에 갔던 가게 쪽지보내기
	@PostMapping("/send-message/{storeId}")
	public void sendMessage(@RequestBody Note note, @PathVariable int storeId, @AuthenticationPrincipal PrincipalDetails details) {
		
		Store storeEntity = storeService.findById(storeId);
		note.setNoteType(NoteType.STORE);
		note.setUser(details.getUser());
		note.setStore(storeEntity);
		noteService.noteSave(note);
		// 해당하는 가게 host한테 쪽지보내기
		
	}
	
	
	@PostMapping("/check-message/{noteId}")
	public ResponseDto<?> checkMessage( @PathVariable int noteId, @AuthenticationPrincipal PrincipalDetails details, @RequestBody Note note) {
		Note noteEntity = noteService.checkMessage(noteId); 
		
		note.setNoteType(NoteType.USER);
		note.setStore(noteEntity.getStore());
		note.setUser(noteEntity.getUser());
		note.setChecked(false);
		noteService.noteSave(note);
		return new ResponseDto<>(true, noteId);
	}

	@PostMapping("/resend-message/{noteId}")
	public ResponseDto<?> resendMessage( @PathVariable int noteId, @AuthenticationPrincipal PrincipalDetails details, @RequestBody Note note) {
		Note noteEntity = noteService.checkMessage(noteId); 
		
		note.setNoteType(NoteType.STORE);
		note.setStore(noteEntity.getStore());
		note.setUser(noteEntity.getUser());
		note.setChecked(false);
		noteService.noteSave(note);
		return new ResponseDto<>(true, noteId);
	}

}

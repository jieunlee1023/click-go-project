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
		return new ResponseDto<>(success, user.getUsername() + "??? ??????????????? ???????????? ??????????????????.");
	}

	@PostMapping("/update")
	public ResponseDto<?> pwdUpdate(@RequestBody User user) {

		try {
			userService.updateUser(user);
			Authentication authentication = authenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
			SecurityContextHolder.getContext().setAuthentication(authentication);
			return new ResponseDto<>(true, "???????????? ????????? ????????????????????? !!");
		} catch (Exception e) {
			return new ResponseDto<>(false, "???????????? ????????? ?????????????????????...");
		}
	}

	@DeleteMapping("/delete/{userId}")
	public ResponseDto<?> userDelete(@PathVariable int userId, @AuthenticationPrincipal PrincipalDetails details,
			HttpServletRequest req, HttpServletResponse res) {
		try {
			userService.deleteUser(userId, details.getUser().getId());
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); // ?????? ?????? x , ?????? ????????????
			if (authentication != null) {
				new SecurityContextLogoutHandler().logout(req, res, authentication);
				Thread.sleep(1000);
			}
			return new ResponseDto<>(true, "??????????????? ????????????????????? !!");
		} catch (Exception e) {
			return new ResponseDto<>(false, "??????????????? ?????????????????????...");
		}
	}

	// ????????? ??????
	@PostMapping("/search")
	public ResponseDto<?> selectEamil(@RequestBody User user) {
		User userEntity = userService.searchUserEmail(user.getEmail());
		return new ResponseDto<>(true, userEntity.getUsername());
	}

	// ???????????? ??????
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
			return new ResponseDto<String>(false, new String("??????????????? ?????????/??????????????? ?????? ??? ????????????. ??????????????? ??????????????????"));
		}
		return new ResponseDto<>(true, naverMailSend(userEntity.getEmail()));
	}

	public int naverMailSend(String email) { 
		String host = "smtp.naver.com";
		// ???????????? ???????????? ????????? ??????????????? ???????????????

		// SMTP ?????? ????????? ????????????.
		Properties props = new Properties(); // Properties??? java.util??? Properties?????????.
		props.put("mail.smtp.host", host); // smtp??? ?????????
		props.put("mail.smtp.port", 587); // 587 ?????? ??????
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // ??? ????????? ???????????? TLS Exception??? ???????????????. (????????? ????????????)

		Session session = Session.getDefaultInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(id)); // ???????????? ?????????
			// ????????? ?????????
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			// ?????? ??????
			message.setSubject("Click-Go");

			// ?????? ??????
			String temporary = userService.searchPasswordChange(email);
			message.setText("???????????????.\n ?????? ????????? ?????????. \n ?????????????????? : " + temporary); // ????????? ????????????????????? ??????

			// send the message
			Transport.send(message);
			return 0;
		} catch (MessagingException e) {
			e.printStackTrace();
			return -1;
		}
	}

	// ????????? ????????????
	@PostMapping("/check-id")
	public int checkId(@RequestBody User user) {
		try {
			int result = userService.findByUsername(user.getUsername());
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	// ????????? ????????????
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

	// ????????? ?????? ?????? ????????? ??????(10???)
	@GetMapping("/reservationed")
	public ResponseDto<?> sendMessage(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
		System.err.println("??????????");
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
	
	// ????????? ?????? ?????? ???????????????
	@PostMapping("/send-message/{storeId}")
	public void sendMessage(@RequestBody Note note, @PathVariable int storeId, @AuthenticationPrincipal PrincipalDetails details) {
		
		Store storeEntity = storeService.findById(storeId);
		note.setNoteType(NoteType.STORE);
		note.setUser(details.getUser());
		note.setStore(storeEntity);
		noteService.noteSave(note);
		// ???????????? ?????? host?????? ???????????????
		
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

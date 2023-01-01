package com.clickgo.project.api;

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
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.User;
import com.clickgo.project.service.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/user")
@RequiredArgsConstructor
public class UserApiController {
	
	@Value("${mail.pw}")
	private String password;
	
	private final UserService userService;
	private final AuthenticationManager authenticationManager;

	@PostMapping("/sign-up")
	public ResponseDto<?> signUp(@RequestBody User user, Model model) {
		boolean success = userService.signUp(user);
		return new ResponseDto<>(success, user.getUsername() + "님 회원가입을 진심으로 축하드립니다. ");
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
		@PostMapping("/auth/send")
	    public ResponseDto<Integer> mailSend(@RequestBody User user){
			User userEntity = userService.searchPassword(user.getUsername(),user.getEmail());
			
			
	        return new ResponseDto<>(true, naverMailSend(userEntity.getEmail()));
	    }

	    public int naverMailSend(String email){
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
	                return new PasswordAuthentication("whwlgns42@naver.com",password);
	            }
	        });

	        try{
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(email));
	            // 수신자 이메일
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress("whwlgns42@kakao.com"));

	            // 메일 제목
	            message.setSubject("SMTP TEST");

	            // 메일 내용
	            String temporary = userService.searchPasswordChange(email);
	            message.setText("안녕하세요.\n 저희 클릭고 입니다. \n 임시비밀번호 : " +  temporary); // 랜덤인 임시비밀번호를 생성

	            // send the message
	            Transport.send(message);
	            System.out.println("Success Message Send");
	            return 0;
	        }catch (MessagingException e){
	            e.printStackTrace();
	            return -1;
	        }
	    }
	
	
	
	

}

package com.clickgo.project.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.dto.res.ResponseDto;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;




@RestController
public class UserEmailController {

	// ("/auth/send") Path를 통해 실습해봤다.
    @GetMapping("/auth/send")
    public ResponseDto<Integer> mailSend(){
        return new ResponseDto<>(true, naverMailSend());
    }

    public static int naverMailSend(){
        String host = "smtp.naver.com";
        String user = "whwlgns42@naver.com"; 
        String password = "101312qwer!@"; // 테스트후 개인정보 보안상 비밀번호는 지워주세요

        // SMTP 서버 정보를 설정한다.
        Properties props = new Properties(); // Properties는 java.util의 Properties입니다.
        props.put("mail.smtp.host", host); // smtp의 호스트
        props.put("mail.smtp.port", 587); // 587 포트 사용
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 이 설정을 안붙이면 TLS Exception이 뜨더라구요. (버전이 안맞아서)

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });

        try{
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            // 수신자 이메일
            message.addRecipient(Message.RecipientType.TO, new InternetAddress("whwlgns42@naver.com"));

            // 메일 제목
            message.setSubject("SMTP TEST");

            // 메일 내용
            message.setText("안녕하세요.\n 이건 메일 테스트입니다ffffffffffffffffffff."); // 랜덤인 임시비밀번호를 생성

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


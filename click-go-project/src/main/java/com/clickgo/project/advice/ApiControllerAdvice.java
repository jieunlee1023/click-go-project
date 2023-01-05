package com.clickgo.project.advice;

import java.io.Console;
import java.util.HashMap;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.client.HttpServerErrorException;

import lombok.extern.slf4j.Slf4j;

@RestControllerAdvice
@Slf4j
public class ApiControllerAdvice {
	String fieldName;
	String message;

	@ExceptionHandler(value = Exception.class)
	public ResponseEntity<?> exception(Exception e) {

		System.out.println("--------------------------------------------");
		System.out.println("에러이름:" + e.getClass().getName());
		System.out.println("메시지:" + e.getLocalizedMessage());
		System.out.println("--------------------------------------------");

		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("");
	}

	@ExceptionHandler(value = MethodArgumentNotValidException.class)
	public ResponseEntity<?> methodArgumentNotValidException(MethodArgumentNotValidException e) {
		HashMap<String, String> cusErrorMap = new HashMap<>();
		System.err.println("메소드 에러");
		// name과 age 둘 다 잘못들어왔다면,
		e.getBindingResult().getAllErrors().forEach(e2 -> {
			FieldError fieldError = (FieldError) e2;
			fieldName = fieldError.getField();
			message = fieldError.getDefaultMessage();
			System.out.println(fieldError.getField());
			cusErrorMap.put(fieldName, message);

		});
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(message);

	}
	
	
	@ExceptionHandler(value = IllegalArgumentException.class)
	public ResponseEntity<?> illegalArgumentException(IllegalArgumentException e) {

			System.out.println("여기");
		// name과 age 둘 다 잘못들어왔다면,
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(message);

	}
}

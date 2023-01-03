package com.clickgo.project.advice;

import java.util.HashMap;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
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

		// name과 age 둘 다 잘못들어왔다면,
		e.getBindingResult().getAllErrors().forEach(e2 -> {
			FieldError fieldError = (FieldError) e2;
			fieldName = fieldError.getField();
			message = fieldError.getDefaultMessage();

			cusErrorMap.put(fieldName, message);

		});
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(message);

	}
	
	@ExceptionHandler(value = NotFoundIdException.class)
	public ResponseEntity<?> notFoundIdException(NotFoundIdException e) {
		System.out.println("머리아프다");
			
			System.err.println(e.getMessage());
			System.out.println(e.getStackTrace().toString());
			// name과 age 둘 다 잘못들어왔다면,
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(message);

	}
	
	
	@ExceptionHandler(value = IllegalArgumentException.class)
	public ResponseEntity<?> illegalArgumentException(IllegalArgumentException e) {

			System.out.println("여기");
		// name과 age 둘 다 잘못들어왔다면,
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(message);

	}
}

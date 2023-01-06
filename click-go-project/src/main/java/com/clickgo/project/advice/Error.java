package com.clickgo.project.advice;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Error implements ErrorController {

	private String ERROR_TEMPLATES_PATH = "error";

	@RequestMapping(value = "/error")
	public String handleError(HttpServletRequest request) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {
			int statusCode = Integer.valueOf(status.toString());
			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				System.out.println(ERROR_TEMPLATES_PATH + "/error");
				return ERROR_TEMPLATES_PATH + "/error";
			}

			if (statusCode == HttpStatus.FORBIDDEN.value()) {
				System.out.println(ERROR_TEMPLATES_PATH + "500");
				return ERROR_TEMPLATES_PATH + "500";
			}
		}
		return "/error";
	}
}

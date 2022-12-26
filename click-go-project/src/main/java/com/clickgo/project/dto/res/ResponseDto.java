package com.clickgo.project.dto.res;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
public class ResponseDto<T> {

	private boolean httpStatus;
	private T body;
}

package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.CsBoard;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.service.BoardService;

@RestController
public class BoardApiController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private AuthenticationManager authenticationManager;

//	@PostMapping("/api/board-save")
//	public String boardSave(CsBoard csBoard, @AuthenticationPrincipal PrincipalDetails details) {
//		
//		boardService.write(csBoard, details.getUser());
//		
//		return "redirect:/board/board-form";
//	}
	
	@PostMapping("/api/board")
	public ResponseDto<?> boardSave(@RequestBody CsBoard csBoard,
			@AuthenticationPrincipal PrincipalDetails details){
		boolean success = boardService.write(csBoard, details.getUser());
		
		System.out.println("!@3214 13142454123");
		return new ResponseDto<>(success, csBoard.getId());
	}
}

package com.clickgo.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.CsBoard;
import com.clickgo.project.entity.CsReply;
import com.clickgo.project.service.BoardService;

@RestController
public class BoardApiController {

	@Autowired
	private BoardService boardService;


	@PutMapping("/api/board/{boardId}")
	public ResponseDto<?> boardUpdate(@PathVariable int boardId, @RequestBody CsBoard csBoard) {
		boolean success = boardService.modifyBoard(boardId, csBoard);
		return new ResponseDto<>(success, csBoard.getId());
	}

	@DeleteMapping("/api/board/{id}")
	public ResponseDto<?> boardDeleteById(@PathVariable int id) {
		boolean success = boardService.deleteById(id);
		return new ResponseDto<>(success, "글삭제완료");
	}


	@DeleteMapping("/api/board/{boardId}/reply/{replyId}")
	public ResponseDto<?> deleteReplyById(@PathVariable String boardId, @PathVariable int replyId,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		boolean success = false;
		try {
			success = boardService.deleteById(replyId, principalDetails.getUser().getId());
			return new ResponseDto<>(success, "댓글삭제성공");
		} catch (Exception e) {
			return new ResponseDto<>(success, "댓글삭제실패");
		}
	}

}

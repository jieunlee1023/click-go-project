package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.dto.res.ResponseDto;
import com.clickgo.project.entity.CsBoard;
import com.clickgo.project.entity.CsReply;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.service.BoardService;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private StoreFranchiseService franchiseService;

	@PostMapping("/board/save")
	public String boardSave(@RequestParam(value = "secret", required = false) String[] secret, CsBoard csBoard,
			@AuthenticationPrincipal PrincipalDetails details) {

		boardService.write(secret, csBoard, details.getUser());
		return "redirect:/board/list";
	}

	@GetMapping({ "/board/list", "/board/search" })
	public String board(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 10, sort = "id", direction = Direction.DESC) Pageable pageable) {
		String searchTitle = q == null ? "" : q;

//		CsBoard boards1 = boardService.searchBoard(searchTitle, pageable);

//		Page<CsBoard> boards = boardService.getBoardList(pageable);
		Page<CsBoard> boards = boardService.searchBoard(searchTitle, pageable);

		int PAGENATION_BLOCK_COUNT = 10;

		int nowPage = boards.getPageable().getPageNumber() + 1;

		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage + startPageNumber, boards.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}
		model.addAttribute("boards", boards);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchTitle);

//		model.addAttribute("boards1",boards1);
		franchiseMassageCount(model);
		return "board/list";
	}

	@GetMapping("/board/form")
	public String board(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		franchiseMassageCount(model);
		return "board/write-form";
	}

	@GetMapping("/board/{id}")
	public String showDetail(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.boardDetail(id));
		franchiseMassageCount(model);
		return "board/detail";
	}
	// s w 비밀댓글
	@PostMapping("/board/{boardId}/reply")
	public String replySave(@PathVariable int boardId, CsReply requestReply,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		boardService.writeReply(boardId, requestReply, principalDetails.getUser());
		return "redirect:";
	}
	
	@GetMapping("/board/{id}/update-form")
	public String updateForm(@PathVariable(name = "id") int boardId, Model model) {
		model.addAttribute("board", boardService.boardDetail(boardId));
		franchiseMassageCount(model);
		return "board/update-form";
	}

	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);

		List<StoreFranchise> allMsg = franchiseService.getMessageList();
		franchiseMessages.forEach(t -> {
			if (t.getState().toString().equals("WAIT")) {
				allMsg.add(t);
			}
		});
		int waitMsg = allMsg.size() - franchiseMessages.size();
		model.addAttribute("waitMsg", waitMsg);
	}
	
	

}

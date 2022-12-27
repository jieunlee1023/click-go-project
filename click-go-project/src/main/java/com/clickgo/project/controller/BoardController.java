package com.clickgo.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.dto.res.CsBoard;
import com.clickgo.project.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping({"/board/board-list", "board/search"})
	public String board(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 3, sort = "id", direction = Direction.DESC) Pageable pageable) {
	System.out.println("0----0-0--0-0-00-0-0--");
//		public String boardIndex(@RequestParam(required = false) String q, Model model,
//				@PageableDefault(size = 3, sort = "id", direction = Direction.DESC) Pageable pageable) {
		
		String searchTitle = q == null ? "" : q;
		System.err.println(q);
		
		Page<CsBoard> boards = boardService.searchBoard(searchTitle, pageable);
		
		boards.forEach(t -> {
			System.err.println(t + "sadfsadf");
		});
		
		int PAGENATION_BLOCK_COUNT = 3;
		
		int nowPage = boards.getPageable().getPageNumber() + 1;
		
		int startPageNumber = Math.max(nowPage + PAGENATION_BLOCK_COUNT, boards.getTotalPages());
		int endPageNumber = Math.min(nowPage - startPageNumber, 1);
		
		
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for(int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}
		
		model.addAttribute("boards", boards);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchTitle);
		return "board/board-list";
	}
	
	@GetMapping("/board/{id}")
	public String showDetail(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.boardDetail(id));
		
		return "/board/board-detail";
	}
	
	@GetMapping("/boad/{id}/update_form")
	public String updateForm(@PathVariable(name = "id") int boardId, Model model) {
		model.addAttribute("board", boardService.boardDetail(boardId));
		return "/board/update_form";
	}
}

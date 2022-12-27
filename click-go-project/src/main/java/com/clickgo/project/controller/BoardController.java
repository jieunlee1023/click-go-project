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
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.dto.res.CsBoard;
import com.clickgo.project.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/board/board-form")
	public String boardIndex() {
	System.out.println("0----0-0--0-0-00-0-0--");
//		public String boardIndex(@RequestParam(required = false) String q, Model model,
//				@PageableDefault(size = 3, sort = "id", direction = Direction.DESC) Pageable pageable) {
//		
//		String searchTitle = q == null ? "" : q;
//		
//		Page<CsBoard> boards = boardService.searchBoard(searchTitle, pageable);
//		
//		int PAGENATION_BLOCK_COUNT = 3;
//		
//		int nowPage = boards.getPageable().getPageNumber() + 1;
//		
//		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
//		int endPageNumber = Math.min(nowPage + startPageNumber, boards.getTotalPages());
//		
//		
//		ArrayList<Integer> pageNumbers = new ArrayList<>();
//		for(int i = startPageNumber; i <= endPageNumber; i++) {
//			pageNumbers.add(i);
//		}
//		
//		model.addAttribute("boards", boards);
//		model.addAttribute("nowPage", nowPage);
//		model.addAttribute("startPageNumber", startPageNumber);
//		model.addAttribute("endPageNumber", endPageNumber);
//		model.addAttribute("pageNumbers", pageNumbers);
//		model.addAttribute("q", searchTitle);
		return "board/board-form";
	}
}

package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.dto.res.CsBoard;
import com.clickgo.project.dto.res.CsReply;
import com.clickgo.project.dto.res.Reply;
import com.clickgo.project.dto.res.User;
import com.clickgo.project.model.enums.BoardType;
import com.clickgo.project.model.enums.SecretType;
import com.clickgo.project.repository.IBoardRepository;
import com.clickgo.project.repository.IReplyRepository;

@Service
public class BoardService {

	@Autowired
	private IBoardRepository iBoardRepository;

	@Autowired
	private IReplyRepository iReplyRepository;

	public boolean write(CsBoard csBoard, User user) {
		
		csBoard.setCount(0);
		csBoard.setUser(user);
		csBoard.setBoardType(BoardType.QUESTION);
		csBoard.setSecretType(SecretType.PUBLIC);
		
		iBoardRepository.save(csBoard);
		
		return true;
	}

	@Transactional(readOnly = true)
	public Page<CsBoard> getBoardList(Pageable pageable) {

		return iBoardRepository.findAll(pageable);
	}

	@Transactional
	public CsBoard boardDetail(int boardId) {

		return iBoardRepository.findById(boardId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 글을 찾을 수 없습니다");
		});
	}

	@Transactional
	public void deleteById(int id) {
		iBoardRepository.deleteById(id);
	}

	@Transactional
	public int modifyBoard(int boardId, CsBoard csBoard) {
		CsBoard boardEntity = iBoardRepository.findById(boardId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 글을 찾을 수 없네요");
		});

		boardEntity.setTitle(csBoard.getTitle());
		boardEntity.setContent(csBoard.getContent());

		return 1;
	}

//	@Transactional
//	public CsReply writeReply(int boardId, CsReply reqReply, User user) {
//		
//		CsBoard board = iBoardRepository.findById(boardId).orElseThrow(() -> {
//			return new IllegalArgumentException("댓글 쓰기 실패 : 게시글이 존재하지 않습니다");
//		});
//		
//		 reqReply.setUser(user);
//		 reqReply.setCsBoard(board);
//		 CsReply replyEntity = iReplyRepository.save(reqReply);
//		 
//		 return replyEntity;
//	}
	@Transactional
	public Page<CsBoard> searchBoard(String q, Pageable pageable) {
		return iBoardRepository.findByTitleContaining1(q, pageable);
	}

}

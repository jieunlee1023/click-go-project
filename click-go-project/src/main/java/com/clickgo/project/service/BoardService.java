package com.clickgo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.CsBoard;
import com.clickgo.project.entity.CsReply;
import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.SecretType;
import com.clickgo.project.repository.IBoardRepository;
import com.clickgo.project.repository.IReplyRepository;

@Service
public class BoardService {

	@Autowired
	private IBoardRepository iBoardRepository;

	@Autowired
	private IReplyRepository iReplyRepository;

	public boolean write(String[] secret, CsBoard csBoard, User user) {

		if (secret != null) {
			csBoard.setUser(user);
			csBoard.setSecretType(SecretType.PRIVATE);
			iBoardRepository.save(csBoard);
		} else {
			csBoard.setUser(user);
			csBoard.setSecretType(SecretType.PUBLIC);
			iBoardRepository.save(csBoard);
		}
		return true;
	}

	@Transactional
	public Page<CsBoard> getBoardList(Pageable pageable) {

		return iBoardRepository.findAll(pageable);
	}

	@Transactional
	public CsBoard boardDetail(int boardId) {

//		return iBoardRepository.findById(boardId).orElseThrow(() -> {
		CsBoard csBoardEntity = iBoardRepository.findById(boardId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 글을 찾을 수 없습니다");
		});

		csBoardEntity.setCount(csBoardEntity.getCount() + 1);
		return csBoardEntity;
	}

	@Transactional
	public boolean deleteById(int id) {
		iBoardRepository.deleteById(id);
		return true;
	}

	@Transactional
	public boolean modifyBoard(int boardId, CsBoard csBoard) {
		CsBoard boardEntity = iBoardRepository.findById(boardId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 글을 찾을 수 없네요");
		});

		boardEntity.setTitle(csBoard.getTitle());
		boardEntity.setContent(csBoard.getContent());

		return true;
	}

	@Transactional
	public boolean writeReply(int boardId, CsReply requestReply, User user) {
		CsBoard board = iBoardRepository.findById(boardId).orElseThrow(() -> {
			return new IllegalArgumentException("댓글 쓰기 실패");
		});

		if (requestReply.isSecret() == true) {
			requestReply.setSecret(true);
		} else {
			requestReply.setSecret(false);
		}
		requestReply.setUser(user);
		requestReply.setCsBoard(board);
		iReplyRepository.save(requestReply);
		return true;
	}

	@Transactional
	public boolean deleteById(int replyId, int requestUserId) {

		CsReply replyEntity = iReplyRepository.findById(replyId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 리플 찾을수없음");
		});
		try {
			int dbWriter = replyEntity.getUser().getId();
			int principalId = requestUserId;

			if (dbWriter == principalId) {
				iReplyRepository.deleteById(replyId);
			} else {
				throw new IllegalArgumentException("본인글아닙니다");
			}
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	// 서치 ..
	@Transactional
	public Page<CsBoard> searchBoard(String q, Pageable pageable) {

		return iBoardRepository.findByTitleContaining(q, pageable);
	}

//	@Transactional
//	public int updateView(int count) {
//		return iBoardRepository.updateView(count);
//	}

}

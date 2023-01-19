package com.clickgo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clickgo.project.entity.Note;
import com.clickgo.project.repository.INoteRepository;

@Service
public class NoteService {

	@Autowired
	private INoteRepository iNoteRepository;

	public int noteSave(Note note) {
		iNoteRepository.save(note);
		return 1;
	}

	@Transactional
	public List<Note> readMessages(int userId) {
		return iNoteRepository.readMessages(userId);
	}

	@Transactional
	public Note checkMessage(int noteId) {
		Note noteEntity = iNoteRepository.findById(noteId).orElseThrow(() -> {
			return new IllegalArgumentException("없는 메세지입니다 다시 확인하여 주세요");
		});
		noteEntity.setChecked(true);
		return noteEntity;
	}

	public List<Note> findAllByUserId(int userId) {
		return iNoteRepository.findAllByUserId(userId);
	}
}

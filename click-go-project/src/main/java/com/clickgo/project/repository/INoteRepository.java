package com.clickgo.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clickgo.project.entity.Note;

public interface INoteRepository extends JpaRepository<Note, Integer>{

	@Query(value = " select n.* from note as n join store as s on n.storeId = s.id where s.userId = ?1 and isChecked = 0 and noteType = 'STORE'  ", nativeQuery = true)
	List<Note> readMessages(int userId);

	
	@Query(value = " select * from note where userId = ?1 and noteType = 'USER' and isChecked = 0 ", nativeQuery = true)
	List<Note> findAllByUserId(int userId);
}

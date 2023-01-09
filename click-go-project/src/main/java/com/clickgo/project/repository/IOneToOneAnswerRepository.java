package com.clickgo.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.clickgo.project.entity.OneToOneAnswer;

public interface IOneToOneAnswerRepository extends JpaRepository<OneToOneAnswer, Integer>{

}

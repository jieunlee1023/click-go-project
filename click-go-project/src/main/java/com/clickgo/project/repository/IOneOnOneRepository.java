package com.clickgo.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.clickgo.project.entity.OneOnOne;

public interface IOneOnOneRepository extends JpaRepository<OneOnOne, Integer>{

}

package com.clickgo.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.clickgo.project.entity.OneToOneAsk;

public interface IOneToOneAskRepository extends JpaRepository<OneToOneAsk, Integer>{

}

package com.clickgo.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.clickgo.project.dto.res.Store;

public interface IStoreRepository extends JpaRepository<Store, Integer>{

}

package com.clickgo.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.clickgo.project.dto.res.Kategory;
import com.clickgo.project.model.enums.StoreKategory;

public interface IKategoryRepository extends JpaRepository<Kategory, StoreKategory> {

}

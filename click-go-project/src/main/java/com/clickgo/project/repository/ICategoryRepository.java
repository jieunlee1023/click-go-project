package com.clickgo.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.clickgo.project.dto.res.Category;
import com.clickgo.project.model.enums.StoreCategory;

public interface ICategoryRepository extends JpaRepository<Category, StoreCategory> {

}

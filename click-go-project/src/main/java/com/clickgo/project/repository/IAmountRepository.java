package com.clickgo.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.clickgo.project.dto.res.kakaoPay.Amount;

public interface IAmountRepository extends JpaRepository<Amount, Integer> {

}

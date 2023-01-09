package com.clickgo.project.repository;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

@Repository
public class SalesRepository {

	// qlrm 테스트 코드
		private final EntityManager entityManager;
		
		
		
		public SalesRepository(EntityManager entityManager) {
			this.entityManager = entityManager;
		}
}

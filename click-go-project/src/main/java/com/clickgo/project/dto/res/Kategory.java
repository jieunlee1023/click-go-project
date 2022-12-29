package com.clickgo.project.dto.res;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;

import com.clickgo.project.model.enums.StoreKategory;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Kategory {

	@Id
	@Enumerated(EnumType.STRING)
	private StoreKategory id;
}

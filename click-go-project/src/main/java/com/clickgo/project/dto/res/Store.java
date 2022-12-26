package com.clickgo.project.dto.res;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Store {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "categoryId")
	private Category category;

	@Column(nullable = false, length = 15)
	private String storeName;

	@Pattern(regexp = "^\\d{3}-\\d{3}-\\d{4}$")
	private String storeTEL;

	@Column(nullable = false)
	private String address;

	@Column(nullable = false)
	private int totalRoomCount;

	@Column(nullable = false)
	@CreationTimestamp
	private Timestamp createDate;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "hostId", nullable = false)
	private Host host;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "likeStoreId", nullable = false)
	private LikeStore likeStore;

	@Column(nullable = false)
	@OneToMany(mappedBy = "store", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties
	private List<Image> image;

}

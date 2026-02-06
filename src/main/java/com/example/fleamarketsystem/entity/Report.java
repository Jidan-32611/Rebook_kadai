package com.example.fleamarketsystem.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Report {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	private Item item;

	@ManyToOne
	private User reporter;

	private String reason; // 盗品 / 違法 / その他

	@Column(columnDefinition = "text")
	private String message;

	private LocalDateTime createdAt = LocalDateTime.now();

	@Column(nullable = false)
	private String status = "未対応";

}

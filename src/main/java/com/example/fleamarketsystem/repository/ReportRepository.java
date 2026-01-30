package com.example.fleamarketsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.fleamarketsystem.entity.Report;

public interface ReportRepository extends JpaRepository<Report, Long> {
	List<Report> findAllByOrderByCreatedAtDesc();
}

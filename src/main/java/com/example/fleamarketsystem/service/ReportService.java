package com.example.fleamarketsystem.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.fleamarketsystem.entity.Item;
import com.example.fleamarketsystem.entity.Report;
import com.example.fleamarketsystem.entity.User;
import com.example.fleamarketsystem.repository.ReportRepository;

@Service
public class ReportService {

	private final ReportRepository reportRepository;
	private final ItemService itemService;

	public ReportService(ReportRepository reportRepository, ItemService itemService) {
		this.reportRepository = reportRepository;
		this.itemService = itemService;
	}

	public void createReport(Long itemId, User reporter, String reason, String message) {
		Item item = itemService.getItemById(itemId)
				.orElseThrow(() -> new IllegalArgumentException("Item not found"));

		Report report = new Report();
		report.setItem(item);
		report.setReporter(reporter);
		report.setReason(reason);
		report.setMessage(message);
		report.setStatus("未対応");

		reportRepository.save(report);
	}

	public List<Report> getAllReports() {
		return reportRepository.findAllByOrderByCreatedAtDesc();
	}
}

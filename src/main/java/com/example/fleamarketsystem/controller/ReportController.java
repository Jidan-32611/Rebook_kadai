package com.example.fleamarketsystem.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.fleamarketsystem.entity.User;
import com.example.fleamarketsystem.service.ReportService;
import com.example.fleamarketsystem.service.UserService;

@Controller
@RequestMapping("/reports")
public class ReportController {

	private final ReportService reportService;
	private final UserService userService;

	public ReportController(ReportService reportService, UserService userService) {
		this.reportService = reportService;
		this.userService = userService;
	}

	@PostMapping
	public String submitReport(
			@RequestParam Long itemId,
			@RequestParam String reason,
			@RequestParam(required = false) String message,
			@AuthenticationPrincipal UserDetails userDetails,
			RedirectAttributes redirectAttributes) {

		User reporter = userService.getUserByEmail(userDetails.getUsername())
				.orElseThrow(() -> new RuntimeException("User not found"));

		reportService.createReport(itemId, reporter, reason, message);

		redirectAttributes.addFlashAttribute("successMessage", "管理者へ通報しました");
		return "redirect:/items/" + itemId;
	}
}

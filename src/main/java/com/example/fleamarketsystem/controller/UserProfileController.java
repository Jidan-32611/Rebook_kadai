package com.example.fleamarketsystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.fleamarketsystem.entity.User;
import com.example.fleamarketsystem.service.ItemService;
import com.example.fleamarketsystem.service.UserService;

@Controller
@RequestMapping("/users")
public class UserProfileController {

	private final UserService userService;
	private final ItemService itemService;

	public UserProfileController(UserService userService, ItemService itemService) {
		this.userService = userService;
		this.itemService = itemService;
	}

	@GetMapping("/{id}")
	public String showUserProfile(@PathVariable Long id, Model model) {

		User user = userService.getUserById(id)
				.orElseThrow(() -> new IllegalArgumentException("User not found"));

		model.addAttribute("user", user);
		model.addAttribute("items",
				itemService.getPublicItemsBySeller(user));

		return "user_profile";
	}

}

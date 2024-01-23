package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.utils.CookieService;
import com.poly.utils.ParamService;
import com.poly.utils.SessionService;

import jakarta.servlet.http.Cookie;

@Controller
public class AccountController {

	@Autowired
	AccountDAO accountDAO;
	
	@Autowired
	ParamService paramService;
	
	@Autowired
	CookieService cookieService;
	
	@Autowired
	SessionService sessionService;
	
	@GetMapping("account/login")
	public String getLogin(Model model) {
		Cookie username = cookieService.get("cookieUsername");
		Cookie password = cookieService.get("cookiePassword");
		
		if (username != null) {
			model.addAttribute("username", username.getValue());
			model.addAttribute("password", password.getValue());
		}
		return "login";
	}
	
	@PostMapping("account/login")
	public String login(Model model) {
		String username = paramService.getString("username", "");
		String password = paramService.getString("password", "");
		boolean remember = paramService.getBoolean("remember", false);
		
		Account user = accountDAO.findById(username).get();
		
		if (user != null && user.getPassword().equals(password)) {
			if (remember == true) {
				cookieService.create("cookieUsername", username, 10);
				cookieService.create("cookiePassword", password, 10);
			} else {
				cookieService.remove("cookieUsername");
				cookieService.remove("cookiePassword");
			}
			
			sessionService.setAttribute("currentUser", user);
			return "redirect:/home";
		} else {
			model.addAttribute("message", "Username or password is invalid!");
		}
		
		return "login";
	}
	
	@GetMapping("account/logout")
	public String logout() {
		sessionService.removeAttribute("currentUser");
		return "redirect:/home";
	}
	
	@GetMapping("account/profile")
	public String getProfile() {
		return "profile";
	}
	
	@PostMapping("account/profile")
	public String updateProfile(Account user, Model model) {
		Account currentUser = (Account) sessionService.getAttribute("currentUser");
		
		Account updatedUser = accountDAO.findById(currentUser.getUsername()).get();
		
		updatedUser.setFirstName(user.getFirstName());
		updatedUser.setLastName(user.getLastName());
		updatedUser.setEmail(user.getEmail());
		
		accountDAO.save(updatedUser);
		
		model.addAttribute("message", "Update profile successfully!");
		
		sessionService.setAttribute("currentUser", updatedUser);
		
		return "profile";
	}
	
	@GetMapping("account/change-password")
	public String getChangePassword() {
		return "change-password";
	}
	
	@PostMapping("account/change-password") 
	public String changePassword(
			@RequestParam("password") String password,
			@RequestParam("newPassword") String newPassword,
			@RequestParam("confirmedPassword") String confirmedPassword,
			Model model) {
		
		Account currentUser = (Account) sessionService.getAttribute("currentUser");
		
		if (currentUser.getPassword().equals(password)) {
			if (newPassword.equals(confirmedPassword)) {
				Account updatedUser = accountDAO.findById(currentUser.getUsername()).get();
				updatedUser.setPassword(newPassword);
				accountDAO.save(updatedUser);
				
				sessionService.setAttribute("currentUser", updatedUser);
				
				model.addAttribute("message", "Change password successfully!");
			} else {
				model.addAttribute("errorMessage", "New password or confirmed password is invalid!");
			} 
		} else {
			model.addAttribute("errorMessage", "Password is invalid!");
		}
		
		return "change-password";
	}
}

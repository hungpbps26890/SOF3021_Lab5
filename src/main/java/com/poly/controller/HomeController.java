package com.poly.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.utils.SessionService;

@Controller
public class HomeController {

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	SessionService sessionService;

	@GetMapping("home")
	public String getIndex() {
		
		sessionService.setAttribute("keyword", "");
		sessionService.setAttribute("security-uri", null);
		
		return "index";
	}

	@RequestMapping("home/search-by-keyword")
	public String searchByKeyword(Model model, @RequestParam("keyword") Optional<String> keyword,
			@RequestParam("page") Optional<Integer> page, @RequestParam("category") Optional<String> category) {

		Pageable pageable = PageRequest.of(page.orElse(0), 4);
		
		if (category.isPresent()) {
			sessionService.setAttribute("keyword", category.get());
		}

		String kw = keyword.orElse(sessionService.getAttribute("keyword"));

		sessionService.setAttribute("keyword", kw);

		Page<Product> products = productDAO.findByKeyword("%" + kw + "%", pageable);

		model.addAttribute("products", products);

		return "index";
	}
	
	@ModelAttribute("products")
	public Page<Product> getProducts(@RequestParam("page") Optional<Integer> page) {
		Pageable pageable = PageRequest.of(page.orElse(0), 4);

		Page<Product> products = productDAO.findAll(pageable);
		
		return products;	
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		List<Category> categories = categoryDAO.findAll();
		return categories;
	}
}

package com.poly.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoryDAO;
import com.poly.entity.Category;

import jakarta.validation.Valid;

@Controller
public class CategoryManagementController {

	@Autowired
	CategoryDAO categoryDAO;

	@GetMapping("admin/category")
	public String getCategoryManagement(Model model) {

		Category category = new Category();
		model.addAttribute("category", category);

		return "category-management";
	}

	@PostMapping("admin/category")
	public String save(Model model, @Valid @ModelAttribute("category") Category category, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println(result.toString());
			return "category-management";
		} else {
			categoryDAO.save(category);
		}

		return "redirect:/admin/category";
	}

	@GetMapping("admin/category/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		Category category = categoryDAO.findById(id).get();
		model.addAttribute("category", category);

		return "category-management";
	}

	@PostMapping("admin/category/update")
	public String update(Model model, @Valid @ModelAttribute("category") Category category, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println(result.toString());
			return "category-management";
		} else {
			categoryDAO.save(category);
		}

		return "redirect:/admin/category";
	}

	@PostMapping("admin/category/delete/{id}")
	public String delete(@PathVariable("id") String id, Model model) {

		categoryDAO.deleteById(id);

		return "redirect:/admin/category";
	}

	@GetMapping(value = "admin/category", params = "btnDel")
	public String deleteInline(@RequestParam("id") String id, Model model) {
		categoryDAO.deleteById(id);

		return "redirect:/admin/category";
	}
	
	@ModelAttribute("categories")
	public Page<Category> getCategories(@RequestParam("page") Optional<Integer> page, @RequestParam("field") Optional<String> field) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
		Pageable pageable = PageRequest.of(page.orElse(0), 4, sort);
		Page<Category> categories = categoryDAO.findAll(pageable);
		return categories;
	}

}

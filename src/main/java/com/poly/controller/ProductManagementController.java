package com.poly.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.utils.UploadService;

import jakarta.validation.Valid;

@Controller
public class ProductManagementController {

	@Autowired
	ProductDAO productDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	UploadService uploadService;

	@GetMapping("admin/product")
	public String getProductManagement(Model model) {
		model.addAttribute("product", new Product());

		return "product-management";
	}

	@GetMapping("admin/product/list/sort")
	public String sort(@RequestParam("field") Optional<String> field, @RequestParam("page") Optional<Integer> page, Model model) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
		Pageable pageable = PageRequest.of(page.orElse(0), 4, sort);

		Page<Product> products = productDAO.findAll(pageable);

		model.addAttribute("products", products);


		return "product-management-list";
	}

	@GetMapping("admin/product/list")
	public String paginate(Model model, @RequestParam("page") Optional<Integer> page) {
		Pageable pageable = PageRequest.of(page.orElse(0), 4);

		Page<Product> products = productDAO.findAll(pageable);

		model.addAttribute("products", products);


		return "product-management-list";
	}

	@PostMapping("admin/product")
	public String insert(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model,
			@RequestPart("photo") MultipartFile multipartFile) throws IOException {

		if (result.hasErrors() || multipartFile.isEmpty()) {
			model.addAttribute("errorFile", "Please choose image");
			return "product-management";
		} else {

			String fileName = multipartFile.getOriginalFilename();
			uploadService.save(multipartFile, "/images/");
			product.setImage(fileName);

			Category category = categoryDAO.findById(product.getCategory().getId()).get();
			product.setCategory(category);

			productDAO.save(product);

			model.addAttribute("message", "Save product successfully");
		}

		return "redirect:/admin/product";
	}

	@GetMapping("admin/product/{id}")
	public String edit(@PathVariable("id") Integer id, Model model) {
		Product product = productDAO.findById(id).get();
		model.addAttribute("product", product);

		return "product-management";
	}
	
	@PostMapping("admin/product/delete/{id}")
	public String delete(@PathVariable("id") Integer id, Model model) {
		productDAO.deleteById(id);

		return "redirect:/admin/product";
	}

	@PostMapping("admin/product/update")
	public String update(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model,
			@RequestPart("photo") MultipartFile multipartFile) {
		if (result.hasErrors() || multipartFile.isEmpty()) {
			model.addAttribute("errorFile", "Please choose image");
			return "product-management";
		} else {

			String fileName = multipartFile.getOriginalFilename();
			uploadService.save(multipartFile, "/images/");
			product.setImage(fileName);

			Category category = categoryDAO.findById(product.getCategory().getId()).get();
			product.setCategory(category);

			productDAO.save(product);

			model.addAttribute("message", "Update product successfully");
		}

		return "redirect:/admin/product";
	}

	@GetMapping(value = "admin/product", params = "btnDel")
	public String deleteInline(@RequestParam("id") Integer id, Model model) {
		productDAO.deleteById(id);

		return "redirect:/admin/product/list";
	}

	@ModelAttribute("statuses")
	public Map<Boolean, String> getStatuses() {
		Map<Boolean, String> statusesMap = new HashMap<Boolean, String>();
		statusesMap.put(true, "Active");
		statusesMap.put(false, "Inactive");
		return statusesMap;
	}

	@ModelAttribute("categories")
	public List<Category> getCategories() {
		List<Category> categories = categoryDAO.findAll();
		return categories;
	}
}

package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.poly.dao.ProductDAO;
import com.poly.entity.Product;

@Controller
public class ProductController {
	
	@Autowired
	ProductDAO productDAO;

	@GetMapping("product/detail/{id}")
	public String getProductDetail(@PathVariable("id") Integer id, Model model) {
		Product product = productDAO.findById(id).get();
		model.addAttribute("product", product);
		return "detail";
	}
}

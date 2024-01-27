package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.poly.dao.ProductDAO;
import com.poly.entity.Report;

@Controller
public class ReportController {
	
	@Autowired
	ProductDAO productDAO;

	@GetMapping("admin/report")
	public String getReport() {
		
		return "report";
	}
	
	@ModelAttribute("categoryReports")
	public List<Report> getCategoryReports() {
		return productDAO.getReportByCategory();
	}
}

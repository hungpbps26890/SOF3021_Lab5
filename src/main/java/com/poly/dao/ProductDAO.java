package com.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Product;
import com.poly.entity.Report;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	
	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
	Page<Product> findByPrice(double minPrice, double maxPrice, Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE o.name LIKE ?1 OR o.category.name LIKE ?1")
	Page<Product> findByKeyword(String keyword, Pageable pageable);
	
	@Query("SELECT new com.poly.entity.Report(o.category, SUM(o.price), COUNT(o)) FROM Product o GROUP BY o.category ORDER BY SUM(o.price) DESC")
	List<Report> getReportByCategory();
}

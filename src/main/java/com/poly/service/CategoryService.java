package com.poly.service;

import java.util.List;
import java.util.Optional;

import com.poly.entity.Category;

public interface CategoryService {

	void delete(Category entity);

	void deleteById(String id);

	long count();

	boolean existsById(String id);

	Optional<Category> findById(String id);

	List<Category> findAll();

	List<Category> saveAll(List<Category> entities);

	Category save(Category entity);

}

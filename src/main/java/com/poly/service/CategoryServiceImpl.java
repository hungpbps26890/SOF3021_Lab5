package com.poly.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.CategoryDAO;
import com.poly.entity.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryDAO categoryDAO;

	@Override
	public Category save(Category entity) {
		return categoryDAO.save(entity);
	}

	@Override
	public List<Category> saveAll(List<Category> entities) {
		return categoryDAO.saveAll(entities);
	}

	@Override
	public List<Category> findAll() {
		return categoryDAO.findAll();
	}

	@Override
	public Optional<Category> findById(String id) {
		return categoryDAO.findById(id);
	}

	@Override
	public boolean existsById(String id) {
		return categoryDAO.existsById(id);
	}

	@Override
	public long count() {
		return categoryDAO.count();
	}

	@Override
	public void deleteById(String id) {
		categoryDAO.deleteById(id);
	}

	@Override
	public void delete(Category entity) {
		categoryDAO.delete(entity);
	}
	
	
}

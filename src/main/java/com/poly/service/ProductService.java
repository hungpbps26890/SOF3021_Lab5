package com.poly.service;

import java.util.List;
import java.util.Optional;

import com.poly.entity.Product;

public interface ProductService {

	void deleteAll();

	void deleteAllById(List<Integer> ids);

	void delete(Product entity);

	void deleteById(Integer id);

	long count();

	boolean existsById(Integer id);

	Optional<Product> findById(Integer id);

	List<Product> findAllById(List<Integer> ids);

	List<Product> findAll();

	List<Product> saveAll(List<Product> entities);

	Product save(Product entity);

}

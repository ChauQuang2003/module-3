package com.codegym.productmanager_mvc.service;

import com.codegym.productmanager_mvc.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void add(Product product);
    void update(int id, Product product);
    void delete(int id);
    Product findById(int id);
    List<Product> searchByName(String name);
}

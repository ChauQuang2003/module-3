package com.codegym.productmanager_mvc.service;

import com.codegym.productmanager_mvc.model.Product;

import java.util.List;

public interface IProductService <E>{
    List<Product> getAll();

    void add(E product);

    void delete(int id);

    E findById(int id);

    void update(int id, E product);

    List<E> findByString(String keyword);
}
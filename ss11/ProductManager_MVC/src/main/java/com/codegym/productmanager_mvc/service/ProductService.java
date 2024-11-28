package com.codegym.productmanager_mvc.service;

import com.codegym.productmanager_mvc.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {
    private static List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1, "Laptop", 1500.000, "Ok", "Dell"));
        products.add(new Product(1, "Ip16", 2000.000, "Ok", "IPhone"));
        products.add(new Product(1, "Smartphone", 700.000, "Ok", "Samsung"));
        products.add(new Product(1, "Laptop", 500.000, "Ok", "Dell"));
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void add(Product product) {
        Product existingProduct = findById(product.getId());
        if (existingProduct != null) {
            products.add(product);
        }else {
            System.out.println(" " + product.getId());
        }
    }

    @Override
    public void update(int id, Product product) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Product findById(int id) {
        return null;
    }

    @Override
    public List<Product> searchByName(String name) {
        return List.of();
    }
}

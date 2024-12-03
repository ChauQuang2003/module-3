package com.codegym.productmanager_mvc.service;


import com.codegym.productmanager_mvc.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService<Product> {
    private final List<Product> productList = new ArrayList<>();

    public ProductService() {
        productList.add(new Product(1,"Bánh mỳ", 15000,"Bánh giòn thơm", "Quang"));
        productList.add(new Product(1,"kẹo socola", 15000,"Thơm vị vani", "Quang"));
        productList.add(new Product(1,"Bánh quy", 25000,"Bánh giòn thơm có vị sữa ", "Quang"));
        productList.add(new Product(1,"Sữa", 7000,"Đập chất Vinamilk", "Quang"));
        productList.add(new Product(1,"Dầu ăn", 30000,"Dầu đậu phộng", "Quang"));
    }
    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                productList.remove(i);
            }
        }
    }

    @Override
    public Product findById(int id) {
        for (Product product : productList) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
        int index = findById(id).getId();
        productList.set(index, product);
    }

    @Override
    public List<Product> findByString(String keyword) {
        return List.of();
    }
}

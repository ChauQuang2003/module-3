package service;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService<Product> {
    private List<Product> list;

    public ProductService() {
        list = new ArrayList<>();
        list.add(new Product(1, "Bánh", 1200, "https://th.bing.com/th/id/OIP.RqpgWdyxd_d45enZ7sZdbAHaJ3?rs=1&pid=ImgDetMain"));
        list.add(new Product(2, "Kẹo", 1400, "https://th.bing.com/th/id/OIP.V4aLy3_wjDapFoPq1PfUtQHaKw?w=1024&h=1488&rs=1&pid=ImgDetMain"));
    }

    @Override
    public void add(Product product) {
        list.add(product);
    }

    @Override
    public List<Product> getAll() {
        return list;
    }

    @Override
    public void update(int id, Product product) {
        int index = this.findIndexById(id);
        list.set(index, product);
    }

    @Override
    public void delete(int id) {
        int index = this.findIndexById(id);
        list.remove(index);

    }

    @Override
    public Product findById(int id) {
        int index = this.findIndexById(id);
        return list.get(index);
    }

    @Override
    public int findIndexById(int id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId() == id)
                return i;
        }
        return -1;
    }
}

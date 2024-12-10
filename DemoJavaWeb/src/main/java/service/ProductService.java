package service;

import configuration.ConnecToMySQL;
import model.Category;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService<Product> {
    Connection connection = ConnecToMySQL.getConnection();

    @Override
    public void add(Product product) {
        String sql = "insert into product(name, price, quantity, idCategory, image, description) value (?,?,?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setInt(4, product.getCategory().getId());
            preparedStatement.setString(5, product.getImage());
            preparedStatement.setString(6, product.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "delete from product where id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        String sql = "select product.*, c.name as nameCategory from product join storequang.category c on c.id = product.idCategory;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int quantity = resultSet.getInt("quantity");
                double price = resultSet.getDouble("price");
                int idCategory = resultSet.getInt("idCategory");
                String image = resultSet.getString("image");
                String description = resultSet.getString("description");
                String nameCategory = resultSet.getString("nameCategory");
                Category category = new Category(idCategory, nameCategory);
                Product product = new Product(id, name, price, quantity, category, image, description);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public void edit(int id, Product product) {
            String sql = "update product set name =?, price=?, quantity=?, idCategory=?, image=?, description=? where id=?";
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, product.getName());
                preparedStatement.setDouble(2, product.getPrice());
                preparedStatement.setInt(3, product.getQuantity());
                preparedStatement.setInt(4, product.getCategory().getId());
                preparedStatement.setString(5, product.getImage());
                preparedStatement.setString(6, product.getDescription());
                preparedStatement.setInt(7, id);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
    }

    @Override
    public Product findById(int id) {
        String sql = "SELECT p.id, p.name, p.price, p.quantity, p.image, p.description, c.id AS category_id, c.name AS category_name "
                + "FROM product p "
                + "JOIN category c ON p.idCategory = c.id "
                + "WHERE p.id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category(resultSet.getInt("category_id"),
                        resultSet.getString("category_name"));
                return new Product(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getDouble("price"),
                        resultSet.getInt("quantity"),
                        category,
                        resultSet.getString("image"),
                        resultSet.getString("description")

                );

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    @Override
    public List<Product> findByName(String name) {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT p.id, p.name, p.price, p.quantity, p.image, p.description, c.id AS category_id, c.name AS category_name "
                + "FROM product p "
                + "JOIN category c ON p.idCategory = c.id "
                + "WHERE lower(p.name) LIKE lower(?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Category category = new Category(resultSet.getInt("category_id"),
                        resultSet.getString("category_name"));
                Product product = new Product(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getDouble("price"),
                        resultSet.getInt("quantity"),
                        category,
                        resultSet.getString("image"),
                        resultSet.getString("description")
                );
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productList;
    }

}

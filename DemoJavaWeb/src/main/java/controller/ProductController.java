package controller;

import model.Category;
import model.Product;
import service.CategoryService;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductService", value = "/products")
public class ProductController extends HttpServlet {
    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "home":
                showHomePage(req, resp);
                break;
            case "create":
                showFormCreate(req, resp);
                break;
            case "edit":
                showFormEdit(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            case "search":
                showFormSearch(req, resp);
                break;
            case "detail":
                showFormDeail(req, resp);
                break;
            default:
                showFormError(req, resp);
                break;
        }
    }

    private void showFormDeail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        List<Product> products = productService.findAll();
        req.setAttribute("product", product);
        req.setAttribute("products", products);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/detail.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showFormSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("keyword");
        System.out.println(name);
        List<Product> products = productService.findAll();
        List<Product> product = productService.findByName(name);
        System.out.println(product);
        req.setAttribute("products", product);
        req.getRequestDispatcher("/product/home.jsp").forward(req, resp);
    }
    
    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        List<Category> categories = categoryService.findAll();
        System.out.println(categories);
        req.setAttribute("categories", categories);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/edit.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);
        productService.delete(id);
        resp.sendRedirect("/products?action=home");
    }

    private void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/create.jsp");
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);
        dispatcher.forward(req, resp);
    }

    private void showHomePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/home.jsp");
        List<Product> products = productService.findAll();
        req.setAttribute("products", products);
        dispatcher.forward(req, resp);

    }

    private void showFormError(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/error.jsp");
        dispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "create":
                createProduct(req, resp);
                break;
            case "edit":
                editProduct(req, resp);
                break;
            default:
                showError(req, resp);
                break;
        }
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int id = Integer.parseInt(req.getParameter("id"));
            double price = Double.parseDouble(req.getParameter("price"));
            String name = req.getParameter("name");
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            int idCategory = Integer.parseInt(req.getParameter("idCategory"));
            System.out.println(idCategory);
            String image = req.getParameter("image");
            String description = req.getParameter("description");
            Category category = new Category(idCategory);
            System.out.println(id + ""+ category);
            Product product = new Product(name, price, quantity, category, image, description);
            productService.edit(id,product);
            resp.sendRedirect("/products?action=home");
    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            double price = Double.parseDouble(req.getParameter("price"));
            System.out.println(price);
            String name = req.getParameter("name");
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            int idCategory = Integer.parseInt(req.getParameter("idCategory"));
            System.out.println(idCategory);
            String image = req.getParameter("image");
            String description = req.getParameter("description");
            Category category = new Category(idCategory);
            Product product = new Product(name, price, quantity, category, image, description);
            productService.add(product);
            resp.sendRedirect("http://localhost:8080/products?action=home");

    }

    private void showError(HttpServletRequest req, HttpServletResponse resp) {

    }

}

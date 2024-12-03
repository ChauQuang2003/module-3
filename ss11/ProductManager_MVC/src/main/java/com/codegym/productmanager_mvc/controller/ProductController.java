package com.codegym.productmanager_mvc.controller;

import com.codegym.productmanager_mvc.model.Product;
import com.codegym.productmanager_mvc.service.IProductService;
import com.codegym.productmanager_mvc.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "product-controller", value = "/products")
public class ProductController extends HttpServlet {
    private final IProductService iProductService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getParameter("path");
        if (path == null) {
            path = "";
        }
        switch (path) {
            case "add":
                showAdd(request, response);
                break;
            case "edit":
                showEdit(request,response);
                break;
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));


    }

    private void showAdd(HttpServletRequest request, HttpServletResponse response) {

    }
}

package com.codegym.calculator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nums1 = request.getParameter("num1");
        String nums2 = request.getParameter("num2");
        String operation = request.getParameter("operation");
        try {
            double num1 = Double.parseDouble(nums1);
            double num2 = Double.parseDouble(nums2);
            double result = 0;
            switch (operation) {
                case "add":
                    result = num1 + num2;
                    break;
                case "sub":
                    result = num1 - num2;
                    break;
                case "mul":
                    result = num1 * num2;
                    break;
                case "divice":
                    result = num1 / num2;
                    break;
            }
            response.getWriter().print("Result:" + result);
        } catch (NumberFormatException e) {
            response.getWriter().print(e.getMessage());
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
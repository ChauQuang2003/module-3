package com.example.calculator;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "helloServlet", value = "/display-discount")
public class HelloServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double percent = Double.parseDouble(request.getParameter("percent"));

        double discountAmount = price * percent * 0.01;
        double discountPrice = price - discountAmount;

        response.getWriter().println("<html><body>");
        response.getWriter().println("<h1>Discount Calculator Result</h1>");
        response.getWriter().println("<p><strong>Product Description:</strong> " + description + "</p>");
        response.getWriter().println("<p><strong>List Price:</strong> $" + price + "</p>");
        response.getWriter().println("<p><strong>Discount Percent:</strong> " + percent + "%</p>");
        response.getWriter().println("<p><strong>Discount Amount:</strong> $" + discountAmount + "</p>");
        response.getWriter().println("<p><strong>Discount Price:</strong> $" + discountPrice + "</p>");
        response.getWriter().println("</body></html>");
    }
}

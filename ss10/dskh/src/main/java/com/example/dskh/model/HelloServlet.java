package com.example.dskh.model;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {

        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Customer> customers = new ArrayList<Customer>();
        customers.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://th.bing.com/th/id/R.ff60508ce412d6e878d02b96126dd310?rik=4iTErU4CVpxJNQ&pid=ImgRaw&r=0"));
        customers.add(new Customer("Nguyễn Văn Nam", "1983-04-09", "Bắc Giang","https://th.bing.com/th/id/OIP.j08rvUWxX5VU5MoSxbHxGAHaGW?rs=1&pid=ImgDetMain"));
        customers.add(new Customer("Nguyễn Thúy Trinh", "1983-05-27", "Trà Vinh","https://th.bing.com/th/id/OIP.j08rvUWxX5VU5MoSxbHxGAHaGW?rs=1&pid=ImgDetMain"));
        customers.add(new Customer("Nguyễn Văn Nam", "1983-04-09", "Bắc Giang","https://th.bing.com/th/id/OIP.j08rvUWxX5VU5MoSxbHxGAHaGW?rs=1&pid=ImgDetMain"));
        request.setAttribute("list", customers);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
package controller;


import model.PaymentMethod;
import model.Room;
import service.RoomService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "RoomController", value = "/rooms")
public class RoomController extends HttpServlet {
    private RoomService roomService = new RoomService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getParameter("path");
        if (path == null) {
            path = "";
        }
        switch (path) {
            case "add":
                showFormAdd(request, response);
                break;
            case "delete":
                showFormDelete(request, response);
                break;
            case "search":
                showSearch(request, response);
                break;
            default:
                showHome(request, response);
                break;
        }
    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        roomService.delete(id);
        response.sendRedirect("rooms");
    }

    private void showSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Room> rooms = roomService.findByName(keyword, keyword, keyword);
        request.setAttribute("roomList", rooms);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("viewRoom/home.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Room> rooms = roomService.getAll();
        List<PaymentMethod> paymentMethods = roomService.getAllPayment();
        request.setAttribute("paymentList", paymentMethods);
        request.setAttribute("roomList", rooms);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewRoom/home.jsp");
        dispatcher.forward(request, response);
    }


    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewRoom/add.jsp");
        List<PaymentMethod> paymentMethods = roomService.getAllPayment();
        request.setAttribute("payment", paymentMethods);
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getParameter("path");
        if (path == null) {
            path = "";
        }
        switch (path) {
            case "add":
                showAdd(request, response);
                break;
        }
    }


    private void showAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//       String tenantName = request.getParameter("tenantName");
//       System.out.println(tenantName);
//       String phoneNumber = request.getParameter("phoneNumber");
//       System.out.println(phoneNumber);
//       String startDate = request.getParameter("startDate");
//       int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
//       PaymentMethod paymentMethods = new PaymentMethod(paymentMethod);
//       String note = request.getParameter("note");
//       Room room = new Room(tenantName, phoneNumber, startDate, paymentMethods, note);
//       roomService.add(room);
//       response.sendRedirect("/rooms");
        String tenantName = request.getParameter("tenantName");
        String phoneNumber = request.getParameter("phoneNumber");
        String startDate = request.getParameter("startDate");
//        int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
        String note = request.getParameter("note");

        boolean check =false;

        if (tenantName == null || !tenantName.matches("^[\\p{L}\\s]{5,50}$")) {
            request.setAttribute("usernameError", "Tên người thuê trọ phải có từ 5 đến 50 kí tự và không chứa số hoặc kí tự đặc biệt.");
            check = true;
        }

        if (phoneNumber == null || !phoneNumber.matches("^\\d{10}$")) {
            request.setAttribute("phoneError", "Số điện thoại phải là 10 chữ số.");
            check = true;
        }

        if (startDate.(new Date(System.currentTimeMillis()))) {
            request.setAttribute("dateError", "Ngày bắt đầu thuê không được là ngày quá khứ.");
            check = true;
        }

        if (note != null && note.length()>200){
            request.setAttribute("noteError","Ghi chú không được quá 200 kí tự.");
            check = true;
        }
        if (check) {
            request.getRequestDispatcher("/viewRoom/add.jsp").forward(request, response);
            return;
        }

               int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
        System.out.println(paymentMethod);
       PaymentMethod paymentMethods = new PaymentMethod(paymentMethod);;
        Room room = new Room(tenantName, phoneNumber, startDate, paymentMethods, note);
        roomService.add(room);
        response.sendRedirect("/rooms");
    }
}



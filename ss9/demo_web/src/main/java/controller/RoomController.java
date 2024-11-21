package controller;

import model.Room;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class RoomController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "home":
//            showHome(request, response);
            break;
        }
    }

    private void showHome(HttpServletRequest request, HttpServletResponse response) {
//        List<Room> roomList =
    }
}

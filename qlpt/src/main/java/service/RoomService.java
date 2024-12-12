package service;

import configuration.ConnectDatabase;
import model.PaymentMethod;
import model.Room;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class RoomService implements IRoomService<Room> {
    Connection connection = ConnectDatabase.getConnection();

    @Override
    public void add(Room room) {
        String sql = "INSERT INTO Room (tenantName, phoneNumber, startDate, paymentMethod, note) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = ConnectDatabase.getConnection().prepareStatement(sql);
            preparedStatement.setString(1, room.getTenantName());
            preparedStatement.setString(2, room.getPhoneNumber());
            preparedStatement.setDate(3, Date.valueOf(room.getStartDate()));
            preparedStatement.setInt(4, room.getPaymentMethod().getId());
            preparedStatement.setString(5, room.getNote());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Room> getAll() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT r.id, r.tenantName, r.phoneNumber, r.startDate, r.note, pm.id AS idPayment, pm.typeName AS paymentTypeName " +
                "FROM Room r " +
                "JOIN PaymentMethod pm ON r.paymentMethod = pm.id";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                PaymentMethod paymentMethod = new PaymentMethod(resultSet.getInt("idPayment"), resultSet.getString("paymentTypeName"));
                Room room = new Room(
                        resultSet.getInt("id"),
                        resultSet.getString("tenantName"),
                        resultSet.getString("phoneNumber"),
                        resultSet.getDate("startDate").toString(),
                        paymentMethod,
                        resultSet.getString("note")
                );
                rooms.add(room);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rooms;
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM Room WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Xóa thành công phòng với ID: " + id);
            } else {
                System.out.println("Không tìm thấy phòng với ID " + id + "để xóa.");
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi xóa phòng với ID: " + id);
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(int id, Room room) {
        String sql = "UPDATE Room SET roomCode = ?, tenantName = ?, phoneNumber = ?, startDate = ?, paymentMethod = ?, note = ? WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, room.getRoomCode());
            preparedStatement.setString(2, room.getTenantName());
            preparedStatement.setString(3, room.getPhoneNumber());
            preparedStatement.setDate(4, Date.valueOf(room.getStartDate()));
            preparedStatement.setInt(5, room.getPaymentMethod().getId());
            preparedStatement.setString(6, room.getNote());
            preparedStatement.setInt(7, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Room findById(int id) {
        String sql = "SELECT * FROM Room WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    PaymentMethod paymentMethod = new PaymentMethod(resultSet.getInt("id"), resultSet.getString("typeName"));
                    return new Room(
                            resultSet.getInt("id"),
                            resultSet.getString("tenantName"),
                            resultSet.getString("phoneNumber"),
                            resultSet.getDate("startDate").toString(),
                            paymentMethod,
                            resultSet.getString("note")
                    );
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public List<Room> findByName(String name, String id, String phoneNumber) {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT r.id, r.tenantName, r.phoneNumber, r.startDate, r.note, pm.id AS idPayment, pm.typeName AS paymentTypeName " +
                "FROM Room r " +
                "JOIN PaymentMethod pm ON r.paymentMethod = pm.id " +
                "WHERE r.tenantName LIKE ? OR r.id LIKE ? OR r.phoneNumber LIKE ?";


        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + name + "%");
            preparedStatement.setString(2, "%" + id + "%");
            preparedStatement.setString(3, "%" + phoneNumber + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                PaymentMethod paymentMethod = new PaymentMethod(resultSet.getInt("idPayment"), resultSet.getString("paymentTypeName"));
                Room room = new Room(
                        resultSet.getInt("id"),
//                        resultSet.getString("roomCode"),
                        resultSet.getString("tenantName"),
                        resultSet.getString("phoneNumber"),
                        resultSet.getDate("startDate").toString(),
                        paymentMethod,
                        resultSet.getString("note")
                );
                  rooms.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi tìm tên "+ name +" hoặc id: " + id );
            throw new RuntimeException(e);
        }
        return rooms;
    }

    @Override
    public List<PaymentMethod> getAllPayment() {
        List<PaymentMethod> paymentMethods = new ArrayList<>();
        String sql = "SELECT * FROM paymentMethod";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                PaymentMethod paymentMethod = new PaymentMethod(resultSet.getInt("id"), resultSet.getString("typeName"));
                paymentMethods.add(paymentMethod);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return paymentMethods;
    }
}

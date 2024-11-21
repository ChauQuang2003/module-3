package service;

import model.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class RoomService implements IRoomService<Room> {
    Connection connection = ConnecToMySQL.getConnection();
    public RoomService() {}

    @Override
    public boolean add(Room room) {
        String sql = "insert into room(room_code, tenant_name, phone_number, start_date, payment_type_id, note) values(?,?,?,?,?,?,?);";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, room.getRoomCode());
            statement.setString(2, room.getTenantName());
            statement.setString(3, room.getPhoneNumber());
            statement.setDate(4, java.sql.Date.valueOf(room.getStartDate()));
            statement.setInt(5, room.getPaymentTypeId());
            statement.setString(6, room.getNote());
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean edit(Room room, int id) {
        String sql = "UPDATE room SET room_code = ?, tenant_name = ?, phone_number = ?, start_date = ?, payment_type_id = ?, note = ? WHERE id = ?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, room.getRoomCode());
            statement.setString(2, room.getTenantName());
            statement.setString(3, room.getPhoneNumber());
            statement.setDate(4, java.sql.Date.valueOf(room.getStartDate()));
            statement.setInt(5, room.getPaymentTypeId());
            statement.setString(6, room.getNote());
            statement.setInt(7, id);
            statement.executeUpdate();
            return true;
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM room WHERE id = ?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
            return true;
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Room findById(int id) {
        String sql = "SELECT * FROM room WHERE id = ?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new Room(
                        resultSet.getInt("room_id"),
                        resultSet.getString("room_code"),
                        resultSet.getString("tenant_name"),
                        resultSet.getString("phone_number"),
                        resultSet.getDate("start_date").toLocalDate(),
                        resultSet.getInt("payment_type_id"),
                        resultSet.getString("note")
                );
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Room> findAll() {

    }

    @Override
    public void edit(int id, Room room) {

    }
}

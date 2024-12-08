package service.Users;

import model.Users;

import java.util.List;

public class UserService implements IUsersService<Users> {

    @Override
    public void add(Users users) {

    }

    @Override
    public List<Users> getAll() {
        return List.of();
    }

    @Override
    public void update(int id, Users users) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Users findById(int id) {
        return null;
    }

    @Override
    public int findByUserName(int id) {
        return 0;
    }

    @Override
    public Users findByEmail(String email) {
        return null;
    }

    @Override
    public List<Users> findByRole(String role) {
        return List.of();
    }

    @Override
    public List<Users> findByStatus(boolean isActive) {
        return List.of();
    }
}

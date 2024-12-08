package service.Users;

import java.util.List;

public interface IUsersService<T>{
    void add(T t);
    List<T> getAll();
    void update(int id, T t);
    void delete(int id);
    T findById(int id);
    int findByUserName(int id);
    T findByEmail(String email);
    List<T> findByRole(String role);
    List<T> findByStatus(boolean isActive);

}

package service;

import model.PaymentMethod;

import java.util.List;

public interface IRoomService <E>{
    void add(E e);
    List<E> getAll();
    void delete(int id);
    void update(int id, E e);
    E findById(int id);

    List<E> findByName(String name, String id, String phoneNumber);

    List<PaymentMethod> getAllPayment();
}

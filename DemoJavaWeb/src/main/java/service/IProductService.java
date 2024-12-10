package service;

import java.util.List;

public interface IProductService<E> {
    void add(E e);
    void delete(int id);
    List<E> findAll();
    void edit(int id, E e);
    E findById(int id);
    List<E> findByName(String name);

}

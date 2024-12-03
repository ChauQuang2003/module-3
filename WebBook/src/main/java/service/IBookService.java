package service;

import model.Book;

import java.util.List;

public interface IBookService <E>{
    boolean add(E e);

    boolean edit(Book book, int id);

    boolean delete(int id);

    Book findById(int id);

    List<Book> findAll();
    void edit(int id, E e);
}

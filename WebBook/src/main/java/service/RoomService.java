package service;

import model.Book;

import java.util.List;

public class RoomService implements IBookService<Book>{

    public RoomService() {
    }

    @Override
    public boolean add(Book book) {
        return false;
    }

    @Override
    public boolean edit(Book book, int id) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public Book findById(int id) {
        return null;
    }

    @Override
    public List<Book> findAll() {
        return List.of();
    }

    @Override
    public void edit(int id, Book book) {

    }
}

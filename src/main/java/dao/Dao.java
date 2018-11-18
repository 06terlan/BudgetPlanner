package dao;

import model.Model;

import java.util.List;
import java.util.Optional;

public interface Dao<T extends Model> {

    Optional<T> get(long id);

    List<T> getAll();

    void save(T t);

    void update(T t, String[] params);

    void delete(T t);
}

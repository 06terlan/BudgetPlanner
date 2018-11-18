package dao;

import java.util.List;
import java.util.Optional;

public interface Dao<Model> {

    Optional<Model> get(long id);

    List<Model> getAll();

    void save(Model t);

    void update(Model t, String[] params);

    void delete(Model t);
}

package dao;

import model.User;

import java.util.*;

public class Users implements Dao<User> {
    private static List<User> users = new ArrayList<>();

    static {
        users.add(new User("Tarlan", "123"));
        users.add(new User("Oljas", "123"));
    }

    public static User getUser(String username, String password){
        for (User user : users) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    @Override
    public Optional<User> get(long id) {
        for (User user : users) {
            if (user.getId() == id) {
                return Optional.of(user);
            }
        }
        return null;
    }

    @Override
    public List<User> getAll() {
        return null;
    }

    @Override
    public void save(User user) {

    }

    @Override
    public void update(User user, String[] params) {

    }

    @Override
    public void delete(User user) {

    }
}

package dao;

import models.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class Users implements Dao<User> {
    private static List<User> users = new ArrayList<>();
    private String tableName = "user";

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
    public String getTableName() {
        return tableName;
    }

    @Override
    public String[] getFields() {
        return new String[0];
    }

    @Override
    public User extractFromResultSet(ResultSet rs) throws SQLException {
        return null;
    }
}

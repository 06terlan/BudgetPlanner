package dao;

import DB.DBConnection;
import models.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class UserDao implements Dao<User> {
    private static List<User> users = new ArrayList<>();
    private String tableName = "user";
    private String[] fields = {"username", "email", "password"};

    public User login(String username, String password){
        DBConnection database = DBConnection.getInstance();
        Connection connection = database.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM " + this.getTableName() + " WHERE username='" + username + "' AND password='" + password + "';");
            if(rs.next())
            {
                return extractFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
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
        User user = new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password")
        );
        return user;
    }
}

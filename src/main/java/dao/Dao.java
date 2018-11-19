package dao;

import DB.DBConnection;
import models.Model;

import java.sql.*;
import java.util.*;

public interface Dao<T extends Model> {

    String getTableName();

    default T get(long id) {
        DBConnection database = DBConnection.getInstance();
        Connection connection = database.getConnection();
        System.out.print(connection);
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM " + this.getTableName() + " WHERE id=" + id);
            if(rs.next())
            {
                return extractFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    };

    default List<T> getAll() {
        DBConnection database = DBConnection.getInstance();
        Connection connection = database.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM " + this.getTableName());
            List<T> models = new ArrayList<>();
            while(rs.next())
            {
                T model = this.extractFromResultSet(rs);
                models.add(model);
            }
            return models;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    };

    default T save(T t) {
        if (this.get(t.getId()) != null) {
            t = this.update(t);
        } else {
            t = this.insert(t);
        }
        return t;
    };

    default T insert(T t) {
        DBConnection database = DBConnection.getInstance();
        Connection connection = database.getConnection();
        try {
            String[] fields = this.getFields();
            String[] values = new String[fields.length];
            for (int i = 0; i < fields.length; i++) {
                values[i] = "?";
            }
            PreparedStatement statement = connection.prepareStatement("INSERT INTO " + this.getTableName() + "(" + String.join(",", fields) + ") VALUES (" + String.join(",", values) + ")", Statement.RETURN_GENERATED_KEYS);

            for (int i = 1; i <= fields.length; i++) {
                try {
                    statement.setString(i, t.getClass().getField(fields[i]).toString());
                } catch (NoSuchFieldException e) {
                    // do nothing
                }
            }

            int result = statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();

            if (rs.next()) {
                t.setId(rs.getLong(1));
            }

            return t;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    };

    default T update(T t) {
        DBConnection database = DBConnection.getInstance();
        Connection connection = database.getConnection();
        try {
            String[] fields = this.getFields();
            String[] values = new String[fields.length];
            for (int i = 0; i < fields.length; i++) {
                values[i] = "?";
            }
            PreparedStatement statement = connection.prepareStatement("UPDATE " + this.getTableName() + " SET " + String.join("=?,", fields) + "=? WHERE id = " + t.getId());

            for (int i = 1; i <= fields.length; i++) {
                try {
                    statement.setString(i, t.getClass().getField(fields[i]).toString());
                } catch (NoSuchFieldException e) {
                    // do nothing
                }
            }
            int result = statement.executeUpdate();
            if(result > 0) {
                return t;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    };

    default void delete(T t) {
        DBConnection database = DBConnection.getInstance();
        Connection connection = database.getConnection();
        try {
            Statement statement = connection.createStatement();
            statement.executeQuery("DELETE FROM " + this.getTableName() + " WHERE id=" + t.getId());
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    };

    String[] getFields();

    T extractFromResultSet(ResultSet rs) throws SQLException;
}

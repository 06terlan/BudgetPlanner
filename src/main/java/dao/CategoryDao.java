package dao;

import DB.DBConnection;
import models.Category;
import models.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class CategoryDao implements Dao<Category> {

    private String tableName = "category";
    private String[] fields = {"name", "type", "icon", "sort_order", "user_id", "parent_id"};

    @Override
    public String getTableName() {
        return tableName;
    }

    @Override
    public String[] getFields() {
        return fields;
    }

    public ArrayList<Category> getUserCategories(User owner) {
        ArrayList<Category> categories = new ArrayList<>();
        DBConnection database = DBConnection.getInstance();
        Connection connection = database.getConnection();
        try {
            Statement statement = connection.createStatement();
            String sql = "SELECT * FROM " + this.getTableName() + " WHERE user_id = '" + owner.getId() + "'";
            ResultSet rs = statement.executeQuery(sql);

            while(rs.next())
            {
                Category category = this.extractFromResultSet(rs);
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    @Override
    public Category extractFromResultSet(ResultSet rs) throws SQLException {
        Category category = new Category(rs.getLong("id"));
        category.setName( rs.getString("name") );
        category.setType( rs.getString("type") );
        category.setParent( new Category(rs.getLong("parent_id")));
        category.setOwner( new User(rs.getLong("user_id")));
        category.setIcon( rs.getString("icon") );
        category.setSort_order( rs.getInt("sort_order") );
        return category;
    }
}

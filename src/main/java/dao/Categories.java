package dao;

import models.Category;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class Categories implements Dao<Category> {

    private String tableName = "category";
    private String[] fields = {"name", "type", "icon", "sort_order", "user_id", "parent_id"};
    private HashMap<String, String> properties = new HashMap<>();

    @Override
    public String getTableName() {
        return tableName;
    }

    @Override
    public String[] getFields() {
        return fields;
    }


    @Override
    public Category extractFromResultSet(ResultSet rs) throws SQLException {
        Category category = new Category(rs.getLong("id"));
        category.setName( rs.getString("name") );
        category.setType( rs.getString("type") );
        category.setIcon( rs.getString("icon") );
        return category;
    }
}

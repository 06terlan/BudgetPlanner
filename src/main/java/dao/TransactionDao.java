package dao;

import model.Category;
import model.Transaction;
import model.Wallet;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class TransactionDao implements Dao<Category> {

    private String tableName = "transaction";
    private String[] fields = {"amount", "type", "date", "description", "category_id", "wallet_id"};

    @Override
    public String getTableName() {
        return tableName;
    }

    @Override
    public String[] getFields() {
        return fields;
    }

    @Override
    public Transaction extractFromResultSet(ResultSet rs) throws SQLException {
        Transaction transaction = new Transaction(
                rs.getLong("id"),
                rs.getDouble("amount"),
                new Category(rs.getLong("category_id")),
                new Wallet(rs.getLong("wallet_id")),
                rs.getString("description"),
                rs.getDate("date")
        );
        return transaction;
    }
}

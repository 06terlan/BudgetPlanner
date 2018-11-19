package dao;

import DB.DBConnection;
import models.Category;
import models.Transaction;
import models.Wallet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class TransactionDao implements Dao<Transaction> {

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

    public ArrayList<Transaction> getTransactions(Category category, Wallet wallet) {
        ArrayList<Transaction> transactions = new ArrayList<>();
        DBConnection database = DBConnection.getInstance();
        Connection connection = database.getConnection();

        try {
            Statement statement=connection.createStatement();
            String sql="SELECT * FROM transaction WHERE category_id = " + category.getId() + " AND wallet_id = " + wallet.getId() + ";" ;
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()){
                Transaction transaction = this.extractFromResultSet(rs);
                transactions.add(transaction);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
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

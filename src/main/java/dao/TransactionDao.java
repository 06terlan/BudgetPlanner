package dao;

import DB.DBConnection;
import models.Category;
import models.Transaction;
import models.User;
import models.Wallet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class TransactionDao implements Dao<Transaction> {

    private String tableName = "transaction";
    private String[] fields = {"amount", /*"type",*/ "date", "description", "category_id", "wallet_id"};
    private Wallet wallet;
    private Category category;

    @Override
    public String getTableName() {
        return tableName;
    }

    @Override
    public String[] getFields() {
        return fields;
    }

    public ArrayList<Transaction> getTransactions(Category category, Wallet wallet) {
        this.category = category;
        this.wallet = wallet;
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

    public ArrayList<Transaction> getTransactions(Category category, User user) {
        this.category = category;
        ArrayList<Transaction> transactions = new ArrayList<>();
        DBConnection database = DBConnection.getInstance();
        Connection connection = database.getConnection();

        try {
            Statement statement=connection.createStatement();
            String sql="SELECT * FROM transaction WHERE category_id = " + category.getId() + " AND wallet_id IN (SELECT w.id FROM wallet WHERE user_id = " + user.getId() + ");" ;
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
                category,
                wallet,
                rs.getString("description"),
                rs.getDate("date")
        );
        return transaction;
    }
}

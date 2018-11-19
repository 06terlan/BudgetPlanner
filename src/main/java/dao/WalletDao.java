package dao;

import model.Category;
import model.User;
import model.Wallet;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class WalletDao implements Dao<Category> {

    private String tableName = "wallet";
    private String[] fields = {"name", "user_id", "balance"};

    @Override
    public String getTableName() {
        return tableName;
    }

    @Override
    public String[] getFields() {
        return fields;
    }


    @Override
    public Wallet extractFromResultSet(ResultSet rs) throws SQLException {
        Wallet wallet = new Wallet(rs.getLong("id"));
        wallet.setName( rs.getString("name") );
        wallet.setOwner( new User(rs.getLong("user_id")) );
        wallet.setBalance( rs.getDouble("balance") );
        return wallet;
    }
}

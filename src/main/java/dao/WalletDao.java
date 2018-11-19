package dao;

import DB.DBConnection;
import models.Category;
import models.User;
import models.Wallet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class WalletDao implements Dao<Wallet> {

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

    public ArrayList<Wallet> getUserWallets(User user) {
        ArrayList<Wallet> wallets = new ArrayList<>();
        DBConnection database = DBConnection.getInstance();
        Connection connection = database.getConnection();

        try {
            Statement statement = connection.createStatement();
            String sql="SELECT * FROM " + this.getTableName() + " WHERE user_id = " + user.getId() + "";
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()){
                Wallet wallet = this.extractFromResultSet(rs);
                wallets.add(wallet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wallets;
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

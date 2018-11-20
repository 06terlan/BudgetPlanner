package models;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Transaction implements Model {

    private long id;
    private double amount;
    private String type;
    private Category category;
    private long category_id;
    private Wallet wallet;
    private long wallet_id;
    private String description;
    private Date date;

    Transaction() {}

    public Transaction(long id, double amount, Category category, Wallet wallet) {
        this.id = id;
        this.amount = amount;
        setWallet(wallet);
        setCategory(category);
    }

    public Transaction(long id, double amount, Category category, Wallet wallet, String description) {
        this.id = id;
        this.amount = amount;
        setWallet(wallet);
        setCategory(category);
        this.description = description;
    }

    public Transaction(long id, double amount, Category category, Wallet wallet, String description, Date date) {
        this.id = id;
        this.amount = amount;
        this.category = category;
        setWallet(wallet);
        setCategory(category);
        this.description = description;
        this.date = date;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Category getCategory() {
        return category;
    }

    public long getCategory_id() { return category_id; }

    public void setCategory(Category category) {
        this.category = category;
        this.category_id = category.getId();
    }

    public Wallet getWallet() {
        return wallet;
    }

    public long getWallet_id() { return wallet_id; }

    public void setWallet(Wallet wallet) {
        this.wallet = wallet;
        this.wallet_id = wallet.getId();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return new SimpleDateFormat("yyyy-MM-dd").format(date);
    }

    public Date getDate2() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) { this.id = id; }

}

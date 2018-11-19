package model;

import java.util.Date;

public class Transaction implements Model {

    private long id;
    private double amount;
    private String type;
    private Category category;
    private Wallet wallet;
    private String description;
    private Date date;

    Transaction() {}

    Transaction(int id, double amount, Category category, Wallet wallet) {
        this.id = id;
        this.amount = amount;
        this.category = category;
        this.wallet = wallet;
    }

    Transaction(int id, double amount, Category category, Wallet wallet, String description) {
        this.id = id;
        this.amount = amount;
        this.category = category;
        this.wallet = wallet;
        this.description = description;
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

    public void setCategory(Category category) {
        this.category = category;
    }

    public Wallet getWallet() {
        return wallet;
    }

    public void setWallet(Wallet wallet) {
        this.wallet = wallet;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
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
    public void setId(long id) {
        this.id = id;
    }

}

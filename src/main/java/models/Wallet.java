package models;

public class Wallet implements Model {

    private long id;
    private String name;
    private long user_id;
    private User owner;
    private double balance;

    public Wallet() {}

    public Wallet(int id, String name, User user, Double initialBalance) {
        this.id = id;
        this.name = name;
        this.balance = initialBalance;
        this.user_id = user.getId();
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) { this.owner = owner; }

    public String getName() {
        return name;
    }

    public void setName(String name) { this.name = name; }

    public double getBalance() { return balance; }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) { this.id = id; }

}

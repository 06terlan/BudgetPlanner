package model;

public class User implements Model {
    private long id;
    private String tableName;
    private String username;
    private String password;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    @Override
    public long getId() {
        return id;
    }

    @Override
    public String getTableName() {
        return tableName;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

}

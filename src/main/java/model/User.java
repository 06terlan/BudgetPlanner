package model;

public class User implements Model {
    private long id;
    private String username;
    private String email;
    private String password;

    User () {};

    public User(long id) { this.id = id; };

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(long id, String username, String email, String password) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }


    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

}

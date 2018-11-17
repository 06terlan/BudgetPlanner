package DB;

import Model.User;

import java.util.Hashtable;
import java.util.Map;

public class UsersDB {
    private static Map<String, String> users = new Hashtable<>();

    static {
        users.put("tarlan", "123");
    }

    public static User getUser(String username, String password){
        if(users.containsKey(username) && users.get(username).equals(password)){
            return new User(username, password);
        }

        return null;
    }
}

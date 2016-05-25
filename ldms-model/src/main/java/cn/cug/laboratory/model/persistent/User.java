package cn.cug.laboratory.model.persistent;

public class User {
    public User() {
    }

    public User(String username, String password, String auth) {
        this.username = username;
        this.password = password;
        this.auth = auth;
    }

    private String username;

    private String password;

    private String auth;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth == null ? null : auth.trim();
    }
}
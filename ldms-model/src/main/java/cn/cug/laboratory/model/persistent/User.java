package cn.cug.laboratory.model.persistent;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

//    public User(String username, String auth) {
//        this.username = username;
//        this.auth = auth;
//    }

    private String username;

    private String password;

    private String auth;
}
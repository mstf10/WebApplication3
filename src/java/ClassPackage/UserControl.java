/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClassPackage;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mergu
 */
public class UserControl {

    DbConnect dbConnect = new DbConnect();
    private String username;
    private String password;
    public String logincheck;

    public void userController() {
        try {
            Statement statement = dbConnect.connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from user where binary username= '" + getUsername() + "' and binary password='" + getPassword() + "'");
            while (resultSet.next()) {
                logincheck = "true";
            }
            resultSet.close();
            statement.close();
            dbConnect.connection.close();
                    
        } catch (SQLException ex) {
            Logger.getLogger(UserControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sit.bank.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Man
 */
public class UserEBank {
    private String userName;
    private String password;
    private int userId;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
    public boolean resetPassword(int userId, String oldPass, String newPass){
        String password = this.password;
        Connection con = null;
        try{
            con = ConnectionBuilder.getConnection();
            String sqlCmd = "UPDATE userEBank SET password=? WHERE user_id=?";
            PreparedStatement stm = null;
            if(oldPass.equals(password)){
                stm.setString(1, newPass);
                stm.setInt(2, userId);
                int done = stm.executeUpdate();
                if(done>0){
                    return true;
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sit.bank.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Man
 */
public class UserEBank {
    private String userName;
    private String password;

    private int accountId;

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

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    

    
    
    public boolean addUserE(String user, String pass, int accountId){
        int save = 0;
        try{
            Connection con = ConnectionBuilder.getConnection();
            if(new Account().findMyAccount(accountId+"")!=null){
                String sql = "INSERT INTO UserEBank Values(?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, user);
                ps.setString(2, pass);
                ps.setInt(3, accountId);
                
                save = ps.executeUpdate();
                
            }
        }
        catch(SQLException ex){
            System.out.println("sql add user e-bank error: "+ex);
        }
        return save > 0;
    }
    
    

    
    
    

    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.bank.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.kohsuke.rngom.ast.builder.BuildException;

/**
 *
 * @author Man
 */
public class Account {

    private int accountId;
    private String accountName;
    private String type;
    private Double balance;
    private int userId;

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public boolean deposit(int accountId, double money) {
        Connection con = null;
        try {
            con = ConnectionBuilder.getConnection();
            String sqlUpdate = "UPDATE account SET balance=? WHERE account_id=?";
            PreparedStatement stm = con.prepareStatement(sqlUpdate);
            double balance = this.getBalance();
            stm.setDouble(1, balance + money);
            stm.setInt(2, this.accountId);
            int done = stm.executeUpdate();
            if (done > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);

        }
        return false;
    }

    public boolean withdraw(int accountId, double money) {
        Connection con = null;
        double balance;
        try {
            con = ConnectionBuilder.getConnection();
            String sqlUpdate = "UPDATE account SET balance=? WHERE account_id=?";
            PreparedStatement stm = con.prepareStatement(sqlUpdate);
            balance = this.getBalance();
            if (balance - money > 0) {
                double b = balance - money;
                stm.setDouble(1, b);
                stm.setInt(2, this.accountId);
                int done = stm.executeUpdate();
                if (done > 0) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public static void transfer(double money, int accountId1, int accountId2) {
        Connection con = null;
        Account a = null;
        a.withdraw(accountId1, money);
        a.deposit(accountId2, money);
    }
    
}

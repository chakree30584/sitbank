/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.bank.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.InputMismatchException;
import java.util.List;
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
    private List<Transaction> transactions = null;

    Account() {

    }

    Account(int accountId, String accountName, String type, Double balance, int userId) {
        this.accountId = accountId;
        this.accountName = accountName;
        this.type = type;
        this.userId = userId;
        this.balance = balance;
    }

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
        int done = 0;
        try {
            con = ConnectionBuilder.getConnection();
            String sqlUpdate = "UPDATE account SET balance=? WHERE account_id=?";
            PreparedStatement stm = con.prepareStatement(sqlUpdate);
            double balance = this.getBalance();
            stm.setDouble(1, balance + money);
            stm.setInt(2, this.accountId);
            done = stm.executeUpdate();
            Transaction t = new Transaction();
            t.setAmount(money);
            t.setTransactionCode(Transaction.TransactionCode.CSD);
            t.setTransactionDateTime(new Date(System.currentTimeMillis()));
            addTransaction(t);
        } catch (SQLException ex) {
            System.out.println(ex);

        }
        return done > 0;
    }

    public boolean withdraw(int accountId, double money) {
        Connection con = null;
        double balance;
        int done = 0;
        try {
            con = ConnectionBuilder.getConnection();
            String sqlUpdate = "UPDATE account SET balance=? WHERE account_id=?";
            PreparedStatement stm = con.prepareStatement(sqlUpdate);
            balance = this.getBalance();
            if (balance - money > 0) {
                double b = balance - money;
                stm.setDouble(1, b);
                stm.setInt(2, this.accountId);
                done = stm.executeUpdate();
                Transaction t = new Transaction();
                t.setAmount(money);
                t.setTransactionCode(Transaction.TransactionCode.CSW);
                t.setTransactionDateTime(new Date(System.currentTimeMillis()));
                addTransaction(t);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return done > 0;
    }

    public void transfer(double money, int accountId1, int accountId2) {
        Connection con = null;
        Account a = null;
        a.withdraw(accountId1, money);
        a.deposit(accountId2, money);
        Transaction t = new Transaction();
        t.setAmount(money);
        t.setTransactionCode(Transaction.TransactionCode.CSD);
        t.setTransactionDateTime(new Date(System.currentTimeMillis()));
        addTransaction(t);
    }

    public boolean checkInt(String account) {
        try {
            Integer.parseInt(account);
            return true;
        } catch (Exception ex) {
            System.out.println("Not number" + ex);
        }
        return false;
    }

    public Account findMyAccount(String account) {
        Account ac = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "";
            PreparedStatement ps;
            if (checkInt(account)) {
                sql = "SELECT * FROM Account WHERE Account_Id = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(account));
            } else {
                sql = "SELECT * FROM Account WHERE Account_Name = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, account);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ac = new Account();
                ac.setAccountId(rs.getInt("Account_Id"));
                ac.setAccountName(rs.getString("Account_Name"));
                ac.setType(rs.getString("Type"));
                ac.setBalance(rs.getDouble("Balance"));
                ac.setUserId(rs.getInt("User_Id"));
            }

        } catch (SQLException ex) {
            System.out.println("sql find MyAccount error: " + ex);
        }

        return ac;
    }

    private void addTransaction(Transaction t) {
        if (transactions == null) {
            transactions = new ArrayList<Transaction>();
        }
        transactions.add(t);
    }

    private void addTransaction(int x, Transaction t) {
        if (transactions == null) {
            transactions = new ArrayList<Transaction>();
        }
        transactions.add(x, t);
    }

}

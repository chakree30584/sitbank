/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sit.bank.model;

import java.util.Date;

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
    
        
    
    public void deposit(double amount){
        if (amount > 0) {
            setBalance(this.balance + amount);
        } else {
            System.out.println("Deposit: 0");
        }
    }
    
    public void withdraw(double amount){
        if (this.balance - amount < 0) {
            System.out.println("Not enough balance (balance=" + balance + "), amount=" + amount + ")");
        } else if (amount > 0) {
            setBalance(this.balance - amount);
        }
    }
    
    
}

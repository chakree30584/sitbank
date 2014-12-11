
package sit.bank.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Account {

    private long accountId;
    private String accountName;
    private String type;
    private Double balance;
    private long userId;
    
    Account(){
        
    }
    
    Account(long accountId, String accountName, String type, Double balance, long userId) {
        this.accountId = accountId;
        this.accountName = accountName;
        this.type = type;
        this.userId = userId;
        this.balance = balance;
    }

    public long getAccountId() {
        return accountId;
    }

    public void setAccountId(long accountId) {
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

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public boolean deposit(long accountId, double money) {
        Connection con = null;
        int done = 0;
        try {
            con = ConnectionBuilder.getConnection();
            String sqlUpdate = "UPDATE account SET balance=? WHERE account_id=?";
            PreparedStatement stm = con.prepareStatement(sqlUpdate);
            double balance = this.getBalance();
            stm.setDouble(1, balance + money);
            stm.setLong(2, this.accountId);
            done = stm.executeUpdate();
            Transaction.writeTransaction(userId, "CSD", money);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return done > 0;
    }

    public boolean withdraw(long accountId, double money) {
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
                stm.setLong(2, this.accountId);
                done = stm.executeUpdate();
                Transaction.writeTransaction(userId, "CSW", money);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return done > 0;
    }

    public void transfer(double money, long accountId1, long accountId2) {
        Connection con = null;
        Account a = null;
        a.withdraw(accountId1, money);
        a.deposit(accountId2, money);
        Transaction t = new Transaction();
        Transaction.writeTransaction(userId, "CST", money);
    }

    public static boolean openNewAccount(String accountName, String type, Double money, long iduser) throws SQLException {
        int status = 0;
        String sql3 = "INSERT INTO Account Values (null, ?, ?, ?, ?)";
        Connection con = ConnectionBuilder.getConnection();
        PreparedStatement ps3 = con.prepareStatement(sql3);
        ps3.setString(1, accountName);
        ps3.setString(2, type);
        ps3.setDouble(3, money);
        ps3.setLong(4, iduser);
        status = ps3.executeUpdate();
        con.close();
        return status > 0;
    }

    public static Account findByAccountId(long accountId) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Account WHERE Account_Id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, accountId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return convertResultSetToAccount(rs);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public static List<Account> findByAccountName(String name) {
        ArrayList<Account> arr = new ArrayList<Account>();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Account WHERE Account_Name = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                arr.add(convertResultSetToAccount(rs));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return arr;
    }
    
    public static List<Account> findAccountOfUid(long accid) {
        ArrayList<Account> arr = new ArrayList<Account>();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Account WHERE User_Id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, accid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                arr.add(convertResultSetToAccount(rs));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return arr;
    }

    public boolean update() {
        int status = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sqlUpdate = "UPDATE account SET balance=?, Account_Name=?, Account_Type=? WHERE account_id=?";
            PreparedStatement stm = con.prepareStatement(sqlUpdate);
            double balance = this.getBalance();
            stm.setDouble(1, this.balance);
            stm.setString(2, this.accountName);
            stm.setString(3, this.type);
            stm.setLong(4, this.accountId);
            status = stm.executeUpdate();
        } catch (SQLException ex) {

        }
        return status > 0;
    }

    public static Account convertResultSetToAccount(ResultSet rs) throws SQLException {
        Account ac = new Account();
        ac.setAccountId(rs.getLong("Account_Id"));
        ac.setAccountName(rs.getString("Account_Name"));
        ac.setType(rs.getString("Type"));
        ac.setBalance(rs.getDouble("Balance"));
        ac.setUserId(rs.getLong("User_Id"));
        return ac;
    }

}

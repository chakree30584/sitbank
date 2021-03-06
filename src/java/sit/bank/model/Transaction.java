/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.bank.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Transaction implements Serializable {

    public static final Map<String, String> transactionDescription = new HashMap<String, String>();

    static {
        transactionDescription.put("ADU", "Add Account");
        transactionDescription.put("UPU", "Update Account");
        transactionDescription.put("CSW", "Cash Withdraw");
        transactionDescription.put("CSD", "Cash Deposite");
        transactionDescription.put("CST", "Cash Transfer");
    }

    public enum TransactionCode {

        ADU, UPU, CSW, CSD, CST;
    };

    private long transactionId;
    private TransactionCode transactionCode;
    private String transactionDateTime;
    private Long accId;
    private double amount;

    public long getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(long transactionId) {
        this.transactionId = transactionId;
    }

    public TransactionCode getTransactionCode() {
        return transactionCode;
    }

    public void setTransactionCode(TransactionCode transactionCode) {
        this.transactionCode = transactionCode;
    }

    public String getTransactionDateTime() {
        return transactionDateTime;
    }

    public void setTransactionDateTime(String transactionDateTime) {
        this.transactionDateTime = transactionDateTime;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getTransactionDescription() {
        return transactionDescription.get(transactionCode.name());
    }

    public Long getAccId() {
        return accId;
    }

    public void setAccId(Long accId) {
        this.accId = accId;
    }

    public static List<Transaction> getTransaction(long accountId) {
        List<Transaction> transactions = new ArrayList<Transaction>();
        try {
            Connection con = ConnectionBuilder.getConnection();
            Transaction t = null;
            String sqlCmd = "SELECT * FROM Transactions WHERE account_id = ? OR account_id = ? ORDER BY transaction_id DESC";
            PreparedStatement stm = con.prepareStatement(sqlCmd);
            stm.setLong(1, accountId);
            stm.setString(2, accountId+""+1111111+"%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                t = new Transaction();
                orm(rs, t);
                transactions.add(t);
            }
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return transactions;
    }
    
    public static List<Transaction> getAllTransaction() {
        List<Transaction> transactions = new ArrayList<Transaction>();
        try {
            Connection con = ConnectionBuilder.getConnection();
            Transaction t = null;
            String sqlCmd = "SELECT * FROM Transactions ORDER BY transaction_id DESC";
            PreparedStatement stm = con.prepareStatement(sqlCmd);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                t = new Transaction();
                orm(rs, t);
                transactions.add(t);
            }
            con.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return transactions;
    }

    public static boolean writeTransaction(long acid, String code, Double amount) {
        System.out.println("writeTranscationCalled");
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Transaction t = null;
            String sqlCmd = "INSERT INTO Transactions (account_id, transaction_code, transaction_date, amount) VALUES (?, ?, now(), ?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setLong(1, acid);
            pstm.setString(2, code);
            pstm.setDouble(3, amount);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return x > 0;
    }

    private static void orm(ResultSet rs, Transaction t) throws SQLException {
        t.setAmount(rs.getDouble("amount"));
        t.setTransactionDateTime(rs.getString("transaction_date"));
        t.setTransactionId(rs.getLong("transaction_id"));
        t.setTransactionCode(TransactionCode.valueOf(rs.getString("transaction_code")));
        t.setAccId(rs.getLong("account_id"));
    }

}

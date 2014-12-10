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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Man
 */
public class User {
    private int userId;
    private String Fullname;
    private String Lastname;
    private String address;
    private String road;
    private String subDistrict;
    private String district;
    private String zipCode;
    private String province;
    private String country;
    private String identification;
    private String mobile;
    private String phone;
    private String email;
    private String accountId;

    
    User(){
        /*
        this.userId = 0;
        this.Fullname = null;
        this.Lastname = null;
        this.address = null;
        this.road = null;
        this.subDistrict = null;
        this.district = null;
        this.zipCode = null;
        this.province = null;
        this.country = null;
        this.identification = null;
        this.mobile = null;
        this.phone = null;
        this.email = null;
        this.accountId = null;
        */
    }
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

   
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRoad() {
        return road;
    }

    public void setRoad(String road) {
        this.road = road;
    }

    public String getSubDistrict() {
        return subDistrict;
    }

    public void setSubDistrict(String subDistrict) {
        this.subDistrict = subDistrict;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String Fullname) {
        this.Fullname = Fullname;
    }

    public String getLastname() {
        return Lastname;
    }

    public void setLastname(String Lastname) {
        this.Lastname = Lastname;
    }
    

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }
    
    public boolean register(String fullName, String lastName,
        String address, String road, String subDistrict,
        String district, String zipCode, String province,
        String country, String identification, String mobile, 
        String phone, String email, String accountId){
        int regis = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO sitbank.User_Info VALUES(null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, lastName);
            ps.setString(3, address);
            ps.setString(4, road);
            ps.setString(5, subDistrict);
            ps.setString(6, district);
            ps.setString(7, zipCode);
            ps.setString(8, province);
            ps.setString(9, country);
            ps.setString(10, identification);
            ps.setString(11, mobile);
            ps.setString(12, phone);
            ps.setString(13, email);
            ps.setString(14, accountId);
            
            regis = ps.executeUpdate();
            
        } 
        catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return regis>0;
        
    }//เปิดบัญชีหลัก
    
    public User showCustomer(String identification){
        User result = null;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM sitbank.User_Info WHERE Identification = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, identification);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                result = new User();
                result.setUserId(rs.getInt("UserId"));
                result.setFullname(rs.getString("Fullname"));
                result.setLastname(rs.getString("Lastname"));
                result.setAddress(rs.getString("Address"));
                result.setRoad(rs.getString("Road"));
                result.setSubDistrict(rs.getString("Subdistrict"));
                result.setDistrict(rs.getString("District"));
                result.setZipCode(rs.getString("Zipcode"));
                result.setProvince(rs.getString("Province"));
                result.setCountry(rs.getString("Country"));
                result.setIdentification(rs.getString("Identification"));
                result.setMobile(rs.getString("Mobile"));
                result.setPhone(rs.getString("Phone"));
                result.setEmail(rs.getString("Email"));
                result.setAccountId(rs.getString("AccountId"));
                
            }
            
        }
         catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }//ค้นหา สมาชิกจาก บัตรประชาชน
    
    public boolean checkIdenUser(String identification){
        boolean check = false;
        if(showCustomer(identification)!=null){
            check = true;
        }
        else{
            check = false;
        }
        
        return check;
    }//เช็ค ว่ามีชื่อในระบบหลักไหม
    
    public boolean regisEBank(String Username, String Password, String identification){
        int result = 0;
        try{
            if(checkIdenUser(identification)){
                Connection con = ConnectionBuilder.getConnection();
                String sql = "INSERT INTO sitbank.User_EBank VALUES(null, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, Username);
                ps.setString(2, Password);
                ps.setInt(3, showCustomer(identification).getUserId());
                
                result = ps.executeUpdate();
            }
            
        }
        catch(SQLException ex){
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return result > 0;
    }
    
    public boolean resetPassword(String Username, String newPassword){
        int result = 0;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE User_EBank SET Password = ? WHERE Username = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, Username);
            
            result = ps.executeUpdate();
        }
        catch(SQLException ex){
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result > 0;
    }
   
    
}

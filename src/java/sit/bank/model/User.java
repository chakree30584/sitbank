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
public class User {
    private int userId;
    private String userName;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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
    
    public boolean register(String userName,
        String address, String road, String subDistrict,
        String district, String zipCode, String province,
        String country, String identification, String mobile, 
        String phone, String email, String accountId){
        int regis = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO sitbank.User_Info VALUES(null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, address);
            ps.setString(3, road);
            ps.setString(4, subDistrict);
            ps.setString(5, district);
            ps.setString(6, zipCode);
            ps.setString(7, province);
            ps.setString(8, country);
            ps.setString(9, identification);
            ps.setString(10, mobile);
            ps.setString(11, phone);
            ps.setString(12, email);
            ps.setString(13, accountId);
            
            regis = ps.executeUpdate();
            
        } 
        catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return regis>0;
        
    }
   
    
}

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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Man
 */
public class User {
    //UserInfo Table
    private int userId;
    private String fullName;
    private String lastName;
    private String sex;
    private String identification;
    private String email;
    private String mobilePhone;
    private String homePhone;
    
    //Address Table
    private int homeId;
    private String address;
    private String road;
    private String subDistrict;
    private String district;
    private String country;
    private String province;
    private String zip;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getHomePhone() {
        return homePhone;
    }

    public void setHomePhone(String homePhone) {
        this.homePhone = homePhone;
    }

    public int getHomeId() {
        return homeId;
    }

    public void setHomeId(int homeId) {
        this.homeId = homeId;
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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }
    
    
    
    
    public boolean addUser(String fullName,
        String lastName, String sex, String identification,
        String email, String mobilePhone, String homePhone,
        String address, String road,
        String subDistrict, String district, String country,
        String province, String zip){
        int result = 0;
        int result2 = 0;
        
        try{
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO UserInfo Values (null, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, lastName);
            ps.setString(3, sex);
            ps.setString(4, identification);
            ps.setString(5, email);
            ps.setString(6, mobilePhone);
            ps.setString(7, homePhone);
            result = ps.executeUpdate();
            if(result>0){
                String sqlGet = "SELECT User_Id FROM UserInfo WHERE identification = '"+identification+"'";
                PreparedStatement psGet = con.prepareStatement(sqlGet);
                ResultSet rs = psGet.executeQuery();
                if(rs.next()){
                    String sql2 = "INSERT INTO Address Values (null, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement ps2 = con.prepareStatement(sql2);
                    ps2.setString(1, address);
                    ps2.setString(2, road);
                    ps2.setString(3, subDistrict);
                    ps2.setString(4, district);
                    ps2.setString(5, country);
                    ps2.setString(6, province);
                    ps2.setString(7, zip);
                    ps2.setInt(8, rs.getInt("User_Id"));
                    
                    result2 = ps2.executeUpdate();
                }
            }
           
        }
        catch(SQLException ex){
            System.out.println("sql add error: "+ex);
        }
        
        return result > 0 && result2 > 0;
    }
    
    
    
    
    
   
    
    
}

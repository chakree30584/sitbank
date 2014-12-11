package sit.bank.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class User {

    //UserInfo Table
    private long userId;
    private String fullName;
    private String lastName;
    private String sex;
    private String identification;
    private String email;
    private String mobilePhone;
    private String homePhone;

    //Address Table
    private long homeId;
    private String address;
    private String road;
    private String subDistrict;
    private String district;
    private String country;
    private String province;
    private String zip;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
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

    public long getHomeId() {
        return homeId;
    }

    public void setHomeId(long homeId) {
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
            String province, String zip) {

        int result = 0;
        int result2 = 0;

        try {
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
            if (result > 0) {
                String sqlGet = "SELECT User_Id FROM UserInfo WHERE identification = '" + identification + "'";
                PreparedStatement psGet = con.prepareStatement(sqlGet);
                ResultSet rs = psGet.executeQuery();
                if (rs.next()) {
                    //add address table
                    long iduser = rs.getLong("User_Id");
                    String sql2 = "INSERT INTO Address Values (null, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement ps2 = con.prepareStatement(sql2);
                    ps2.setString(1, address);
                    ps2.setString(2, road);
                    ps2.setString(3, subDistrict);
                    ps2.setString(4, district);
                    ps2.setString(5, country);
                    ps2.setString(6, province);
                    ps2.setString(7, zip);
                    ps2.setLong(8, iduser);
                    result2 = ps2.executeUpdate();
                    Transaction.writeTransaction(userId, "ADU", 0.0);
                }
            }
        } catch (SQLException ex) {
            System.out.println("sql add error: " + ex);
        }
        return result > 0 && result2 > 0;
    }

    public static User findByUserId(long userId) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            ResultSet rs = null;
            String sql = "SELECT * FROM UserInfo U JOIN Address AD ON U.User_Id = AD.User_Id WHERE U.User_Id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return convertResultSetToUserObject(rs);
            }
        } catch (SQLException ex) {
            System.out.println("sql find By User Id error: " + ex);
        }
        System.out.println("null");
        return null;
    }

    public static List<User> findByAccIdGetUser(long id) {
        Account ac = Account.findByAccountId(id);
        if (ac == null) {
            return null;
        } else {
            ArrayList<User> arr = new ArrayList();
            arr.add(findByUserId(ac.getUserId()));
            return arr;
        }
    }

    public static List<User> findByName(String name) {
        ArrayList<User> arr = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            ResultSet rs = null;
            String sql = "SELECT * FROM UserInfo U JOIN Address AD ON U.User_Id = AD.User_Id WHERE UPPER(U.Fullname) like ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name.toUpperCase() + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                arr.add(convertResultSetToUserObject(rs));
            }
        } catch (SQLException ex) {
            System.out.println("sql find By User Id error: " + ex);
        }
        return arr;
    }

    public boolean update() {
        int result = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE u SET u.fullname=?,u.lastname=?,u.sex=?,u.identification=?,"
                    + "u.email=?,u.mobilephone=?,u.homephone=?, a.address_id=?, a.road=?, a.district=?, "
                    + "a.subdistrict=?, a.province=?, a.country=?, a.zip=? "
                    + "FROM user AS u INNER JOIN address AS a"
                    + "ON u.user_id = a.user_id "
                    + "WHERE u.user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, lastName);
            ps.setString(3, sex);
            ps.setString(4, identification);
            ps.setString(5, email);
            ps.setString(6, mobilePhone);
            ps.setString(7, homePhone);
            ps.setString(8, address);
            ps.setString(9, road);
            ps.setString(10, subDistrict);
            ps.setString(11, district);
            ps.setString(12, country);
            ps.setString(13, province);
            ps.setString(14, zip);
            ps.setLong(15, userId);
            result = ps.executeUpdate();
            Transaction.writeTransaction(userId, "UPU", 0.0);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return result > 0;
    }

    public static User convertResultSetToUserObject(ResultSet rs) throws SQLException {
        User u = new User();
        u.setFullName(rs.getString("Fullname"));
        u.setLastName(rs.getString("Lastname"));
        u.setEmail(rs.getString("Email"));
        u.setHomePhone(rs.getString("HomePhone"));
        u.setIdentification(rs.getString("Identification"));
        u.setMobilePhone(rs.getString("MobilePhone"));
        u.setSex(rs.getString("Sex"));
        u.setUserId(rs.getLong("User_Id"));
        u.setAddress(rs.getString("Address_Id"));
        u.setCountry(rs.getString("Country"));
        u.setDistrict(rs.getString("District"));
        u.setHomeId(rs.getLong("Home_Id"));
        u.setProvince(rs.getString("Province"));
        u.setRoad(rs.getString("Road"));
        u.setSubDistrict(rs.getString("Subdistrict"));
        u.setZip(rs.getString("Zip"));
        return u;
    }
}

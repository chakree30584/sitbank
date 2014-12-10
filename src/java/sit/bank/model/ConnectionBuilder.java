package sit.bank.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author chakree30584
 */
public class ConnectionBuilder {
    public static Connection getConnection() {
        String url = "jdbc:mysql://server.chakree.me:3306/sitbank";
        String driver = "com.mysql.jdbc.Driver";
        String user = "bootcamp_bike";
        String pass = "bootcamp";
        try {
            Class.forName(driver);
            return DriverManager.getConnection(url + "?useUnicode=true&characterEncoding=UTF-8", user, pass);
        } catch (ClassNotFoundException ex) {
            System.err.println(ex);
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return null;
    }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Mohsin Ali
 */

public class Database {

    private final String host = "localhost";
    private final String port = "";
    private final String dbname = "ementor";
    private final String dbuser = "root";
    private final String dbpass = "";
    private final String dburl = "jdbc:mysql://" + host + (!port.isEmpty() ? ":" + port : "") + "/" + dbname;
    
    
    protected static Connection connection;

    protected Database() {
        this.connection = null;
    }

    public Connection openConnection() throws SQLException,
            ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        if(!checkConnection())
            connection = DriverManager.getConnection(dburl, dbuser, dbpass);
        return connection;
    }

    public boolean checkConnection() throws SQLException {
        return connection != null && !connection.isClosed();
    }

    public Connection getConnection() {
        return connection;
    }
    public boolean closeConnection() throws SQLException {
        if (connection == null) {
            return false;
        }
        connection.close();
        return true;
    }

    public ResultSet querySQL(String query) throws SQLException,
            ClassNotFoundException {
        if (!checkConnection()) {
            openConnection();
        }

        Statement statement = connection.createStatement();

        ResultSet result = statement.executeQuery(query);

        return result;
    }

    public int updateSQL(String query) throws SQLException,
            ClassNotFoundException {
        if (!checkConnection()) {
            openConnection();
        }

        Statement statement = connection.createStatement();

        int result = statement.executeUpdate(query);

        return result;
    }
}

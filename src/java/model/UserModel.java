/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.User;
import database.Database;
import entity.Course;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;

/**
 *
 * @author Mohsin Ali
 */
public class UserModel extends Database {

    public int getUserCurrentBalance(int userId) {
        String query = "SELECT balance FROM users WHERE userid = '" + userId + "' LIMIT 1";
        int balance = -1;
        try {
            ResultSet rs = querySQL(query);
            if(rs.first()) {
               balance = rs.getInt("balance");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return balance;
    }

    public User updateUser(User u) {

        User user = null;

        String query = "UPDATE users SET ";
        if (u.getPassword() != null && !u.getPassword().equals("")) {
            query += "password = '" + u.getPassword() + "',";
        }
        query += "     email = '" + u.getEmail() + "', fname = '" + u.getFname() + "',"
                + "     lname = '" + u.getLname() + "',  city = '" + u.getCity() + "',"
                + "     country = '" + u.getCountry() + "'";

        query += " WHERE userid = '" + u.getUserid() + "'";
        System.out.println(query);
        boolean flag = false;
        try {
            if (updateSQL(query) > 0) {
                user = u;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
        return user;
    }

    public boolean deleteUser(String userId, String contextPath) {
        boolean flag = true;
        String query = "DELETE FROM users WHERE userid = '" + userId + "'";
        ArrayList<Course> courses = Models.courseModel.getAllCoursesByUserId(userId);
        for (Course c : courses) {
            if (!Models.courseModel.deleteCourse(String.valueOf(c.getCourseid()), contextPath)) {
                flag = false;
                break;
            }
        }

        try {
            if (flag) {
                flag = (updateSQL(query) > 0);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());

        }
        return flag;
    }

    public boolean updateUserProfileImage(String userId, String profileImg) {
        String query = "UPDATE users SET profileimage = '" + profileImg + "' WHERE userid = '" + userId + "'";
        boolean flag = false;
        try {
            flag = (updateSQL(query) > 0);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());

        }
        return flag;
    }

    public String getUserProfileImage(String userId) {
        String query = "SELECT profileimage FROM users WHERE userid = '" + userId + "'";
        String profileImg = "";
        try {
            ResultSet rs = querySQL(query);
            profileImg = rs.getString("profileimage");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());

        }
        return profileImg;
    }

    public User addUser(User u) {
        String username = u.getEmail().substring(0, u.getEmail().indexOf("@"));
        u.setUsername(username);

        if (emailExists(u.getEmail())) {
            return null;
        }

        int i = 1;
        while (usernameExists(username)) {
            username = u.getUsername() + i;
            i++;
        }
        u.setUsername(username);

        try {
            String query = "INSERT INTO users (username,password,email,fname,lname,city,country,usertype) "
                    + " VALUES('" + username + "', '" + u.getPassword() + "',"
                    + "'" + u.getEmail() + "', '" + u.getFname() + "',"
                    + "'" + u.getLname() + "', '" + u.getCity() + "',"
                    + "'" + u.getCountry() + "', '" + u.getUsertype()+ "')";
            int result = updateSQL(query);
            if (result > 0) {
                u.setUserid(getLastInsertedUserId());
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
        return u;
    }

    public boolean usernameExists(String username) {
        boolean flag = false;

        String query = "SELECT username FROM users WHERE username = 'username' LIMIT 1";

        try {
            ResultSet rs = querySQL(query);
            flag = rs.first();
        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
        return flag;
    }

    public boolean emailExists(String email) {
        boolean flag = false;

        String query = "SELECT email FROM users WHERE email = 'email' LIMIT 1";

        try {
            ResultSet rs = querySQL(query);
            flag = rs.first();
        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
        return flag;
    }

    public int isValidLogin(String username, String password) {
        int userid = -1;
        String query = "SELECT * FROM users WHERE (username = '" + username + "' OR email = '" + username + "') AND password = '" + password + "'";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                userid = rs.getInt("userid");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());

        }

        return userid;
    }

    public int getLastInsertedUserId() {
        int id = -1;
        String query = "SELECT userid FROM users ORDER BY userid DESC LIMIT 1";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                id = rs.getInt("userid");
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return id;
    }

    public User getUser(Pair<String, String> arg) {
        User u = null;
        String col = arg.getKey();
        String val = arg.getValue();
        System.out.println(arg);
        String query = "SELECT * FROM users WHERE " + col + " = '" + val + "' LIMIT 1";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                u = new User(
                        rs.getInt("userid"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("fname"),
                        rs.getString("lname"),
                        rs.getString("city"),
                        rs.getString("country"),
                        rs.getInt("usertype"),
                        rs.getTimestamp("registeredon").toString(),
                        rs.getInt("balance"),
                        rs.getString("profileimage")
                );
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return u;
    }

    public ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();
        String query = "SELECT * FROM users ORDER BY userid ASC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                do {
                    User u = new User(
                            rs.getInt("userid"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getString("fname"),
                            rs.getString("lname"),
                            rs.getString("city"),
                            rs.getString("country"),
                            rs.getInt("usertype"),
                            rs.getTimestamp("registeredon").toString(),
                            rs.getInt("balance"),
                            rs.getString("profileimage")
                    );
                    users.add(u);
                } while (rs.next());
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return users;
    }

}

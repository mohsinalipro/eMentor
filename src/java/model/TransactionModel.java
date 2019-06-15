/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import database.Database;
import entity.Course;
import entity.Transaction;
import entity.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;

/**
 *
 * @author Kinza Younous
 */
public class TransactionModel extends Database {

        public Transaction getTransactionById(int transactionsId) {
        Transaction result = null;
        String query = "SELECT * FROM courses WHERE courseid = '" + transactionsId + "' LIMIT 1";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new Transaction(
                        rs.getInt("transactionId"),
                        rs.getInt("courseId"),
                        rs.getInt("userId"),
                        rs.getTimestamp("timestamp"),
                        rs.getInt("amount")
                );
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    
    public boolean transactionExists(int userId, int courseId) {
        boolean exists = false;
        String query = "SELECT * FROM transactions WHERE userid = '" + userId + "' AND courseid ='" + courseId + "' LIMIT 1";
        System.out.println(query);
        try {
            ResultSet rs = querySQL(query);
            exists = rs.first();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());

        }
        return exists;
    }

    public ArrayList<Transaction> getAllTransactionsByCourseId(int courseId) {
        ArrayList<Transaction> transactions = new ArrayList<>();
        String query = "SELECT * FROM transactions WHERE courseid = '" + courseId + "' ORDER BY transactionid DESC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                transactions = new ArrayList<>();
                do {
                    Transaction t = new Transaction(
                            rs.getInt("transactionid"),
                            rs.getInt("courseid"),
                            rs.getInt("userid"),
                            rs.getTimestamp("timestamp"),
                            rs.getInt("amount")
                    );
                    transactions.add(t);
                } while (rs.next());
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return transactions;
    }

    public ArrayList<Transaction> getAllTransactionsByUserId(int userId) {
        ArrayList<Transaction> transactions = new ArrayList<>();
        String query = "SELECT * FROM transactions WHERE userId = '" + userId + "' ORDER BY transactionid DESC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                transactions = new ArrayList<>();
                do {
                    Transaction t = new Transaction(
                            rs.getInt("transactionid"),
                            rs.getInt("courseid"),
                            rs.getInt("userid"),
                            rs.getTimestamp("timestamp"),
                            rs.getInt("amount")
                    );
                    transactions.add(t);
                } while (rs.next());
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return transactions;
    }

    public ArrayList<Transaction> getAllTransactions() {
        ArrayList<Transaction> transactions = new ArrayList<>();
        String query = "SELECT * FROM transactions ORDER BY transactionid DESC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                transactions = new ArrayList<>();
                do {
                    Transaction t = new Transaction(
                            rs.getInt("transactionid"),
                            rs.getInt("courseid"),
                            rs.getInt("userid"),
                            rs.getTimestamp("timestamp"),
                            rs.getInt("amount")
                    );
                    transactions.add(t);
                } while (rs.next());
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return transactions;
    }

    public int getLastTransactionId() {
        int id = -1;
        try {
            ResultSet rs = querySQL("Select transactionid FROM transactions ORDER BY transactionid DESC LIMIT 1");
            if (rs.first()) {
                id = rs.getInt("transactionid");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return id;
    }

    public int makeTransaction(int courseId, int userId, int amount) {
        int result = -1;
        Course course = Models.courseModel.getCourseById(String.valueOf(courseId));
        User student = Models.userModel.getUser(new Pair<String, String>("userid", String.valueOf(userId)));
        User teacher = Models.userModel.getUser(new Pair<String, String>("userid", String.valueOf(course.getCreatedby())));
        int price = course.getPrice();
        int newStudentBalance = student.getBalance() - price;
        int newTeacherBalance = teacher.getBalance() + price;
        if (newStudentBalance >= 0) {
            Connection conn = null;
            Statement stmnt = null;
            try {
                String query_teacher = "UPDATE users SET balance = '" + newTeacherBalance + "' WHERE userid = '" + teacher.getUserid() + "'";
                String query_student = "UPDATE users SET balance = '" + newStudentBalance + "' WHERE userid = '" + student.getUserid() + "'";
                String query_transaction = "INSERT INTO transactions (courseid, userid, amount) VALUES('" + courseId + "', '" + userId + "', '" + amount + "')";
                conn = openConnection();
                conn.setAutoCommit(false);
                stmnt = conn.createStatement();
                stmnt.executeUpdate(query_teacher);
                stmnt.executeUpdate(query_student);
                stmnt.executeUpdate(query_transaction);
                conn.commit();
                result = getLastTransactionId();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                if (stmnt != null) {
                    try {
                        conn.rollback();
                    } catch (SQLException ex1) {
                        System.out.println(ex.getMessage());
                    }
                }
            } catch (ClassNotFoundException ex) {
                System.out.println(ex.getMessage());
                if (stmnt != null) {
                    try {
                        conn.rollback();
                    } catch (SQLException ex1) {
                        System.out.println(ex.getMessage());
                    }
                }
            } finally {
                if (conn != null) {
                    try {
                        conn.setAutoCommit(true);
                        stmnt.close();
                        conn.close();
                    } catch (SQLException ex) {
                        System.out.println(ex.getMessage());
                    }
                }
            }
        } else {
            result = 0;
        }

        return result;
    }

}

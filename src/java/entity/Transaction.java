/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Timestamp;

/**
 *
 * @author Mohsin Ali
 */
public class Transaction {
    private int transactionid;
    private int courseid;
    private int userid;
    private Timestamp timestamp;
    private int amount;

    public Transaction() {
    }

    public Transaction(int transactionid, int courseid, int userid, Timestamp timestamp, int amount) {
        this.transactionid = transactionid;
        this.courseid = courseid;
        this.userid = userid;
        this.timestamp = timestamp;
        this.amount = amount;
    }

    public int getTransactionid() {
        return transactionid;
    }

    public void setTransactionid(int transactionid) {
        this.transactionid = transactionid;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    
}

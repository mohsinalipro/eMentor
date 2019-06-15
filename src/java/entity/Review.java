/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Noor Fatima
 */
public class Review implements Serializable{
    int reviewid;
    int courseid;
    int reviewby;
    int rating;
    String comment;
    Timestamp reveiwedon;

    public Review() {
    }

    public Review(int reviewid, int courseid, int reviewby, int rating, String comment, Timestamp reveiwedon) {
        this.reviewid = reviewid;
        this.courseid = courseid;
        this.reviewby = reviewby;
        this.rating = rating;
        this.comment = comment;
        this.reveiwedon = reveiwedon;
    }

    public int getReviewid() {
        return reviewid;
    }

    public void setReviewid(int reviewid) {
        this.reviewid = reviewid;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public int getReviewedBy() {
        return reviewby;
    }

    public void setReviewby(int reviewby) {
        this.reviewby = reviewby;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getReveiwedon() {
        return reveiwedon;
    }

    public void setReveiwedon(Timestamp reveiwedon) {
        this.reveiwedon = reveiwedon;
    }

}

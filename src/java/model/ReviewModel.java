/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import database.Database;
import entity.Course;
import entity.Review;
import entity.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;

/**
 *
 * @author Kinza Younas
 */
public class ReviewModel extends Database {

    public int getLastInsertedCourseId() {
        int id = -1;
        try {
            ResultSet rs = querySQL("Select reviewid FROM reviews ORDER BY reviewid DESC LIMIT 1");
            if (rs.first()) {
                id = rs.getInt("reviewid");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return id;
    }

    public int addReview(Review r) {
        int reviewId = -1;
        String query = "INSERT INTO reviews (courseid, reviewby, rating, comment) VALUES ('" + r.getCourseid() + "','" + r.getReviewedBy() + "','" + r.getRating() + "','" + r.getComment() + "')";
        try {
            if (updateSQL(query) > 0) {
                reviewId = getLastInsertedCourseId();
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());

        }
        return reviewId;
    }

    public String getReviewByUserHtml(int userId, int courseId) {
        Review review = null;

        String out = "";
        String query = "SELECT * FROM reviews WHERE reviewby = '" + userId + "' AND courseId = '" + courseId + "' LIMIT 1";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                review = new Review(
                        rs.getInt("reviewid"),
                        rs.getInt("courseid"),
                        rs.getInt("reviewby"),
                        rs.getInt("rating"),
                        rs.getString("comment"),
                        rs.getTimestamp("reviewedon")
                );
                User user = Models.userModel.getUser(new Pair<String, String>("userid", String.valueOf(userId)));
                out = ""
                        + "    <div class=\"container-fluid\">"
                        + "        <div class=\"row\">"
                        + "            <div class=\"col-sm-1\">"
                        + "                <div class=\"thumbnail\">"
                        + "                    <img class=\"img-responsive user-photo\" src=\"" + user.getProfileimage() + "\">"
                        + "                </div><!-- /thumbnail -->"
                        + "            </div><!-- /col-sm-1 -->"
                        + ""
                        + "            <div class=\"col-sm-11\">"
                        + "                <div class=\"panel panel-default\">"
                        + "                    <div class=\"panel-heading\">"
                        + "                        <strong>" + user.getProfileLink() + "</strong> <span class=\"text-muted\">reviewed on" + review.getReveiwedon() + "</span>"
                        + "                    </div>"
                        + "                    <div class=\"panel-body\">" + review.getComment() + "<hr><small>Rating: " + review.getRating() + "/5</small></div><!-- /panel-body -->"
                        + "                </div><!-- /panel panel-default -->"
                        + "            </div><!-- /col-sm-11 -->"
                        + "        </div><!-- /row -->"
                        + "    </div><!-- /container -->";
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        }

        return out;
    }

    public double getCourseRating(int courseId) {
        double rating = 0;
        String query = "SELECT avg(rating) as rating FROM reviews where courseid = '" + courseId + "'";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                rating = rs.getDouble("rating");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReviewModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReviewModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rating;
    }

    public Review getReviewByUserId(String userId) {
        Review result = null;
        String query = "SELECT * FROM reviews where reviewby = '" + userId + "'";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new Review(
                        rs.getInt("reviewid"),
                        rs.getInt("courseid"),
                        rs.getInt("reviewby"),
                        rs.getInt("rating"),
                        rs.getString("comment"),
                        rs.getTimestamp("reviewedon")
                );
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public ArrayList<Review> getAllReviewsByCourseId(String courseId) {
        ArrayList<Review> result = new ArrayList<>();
        String query = "SELECT * FROM reviews WHERE courseId = '" + courseId + "'";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new ArrayList<>();
                do {
                    Review c = new Review(
                            rs.getInt("reviewid"),
                            rs.getInt("courseid"),
                            rs.getInt("reviewby"),
                            rs.getInt("rating"),
                            rs.getString("comment"),
                            rs.getTimestamp("reviewedon")
                    );
                    result.add(c);
                } while (rs.next());
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public ArrayList<Review> getAllReviewsByUserId(String userId) {
        ArrayList<Review> result = new ArrayList<>();
        String query = "SELECT * FROM reviews WHERE userId = '" + userId + "'";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new ArrayList<>();
                do {
                    Review c = new Review(
                            rs.getInt("reviewid"),
                            rs.getInt("courseid"),
                            rs.getInt("reviewby"),
                            rs.getInt("rating"),
                            rs.getString("comment"),
                            rs.getTimestamp("reviewedon")
                    );
                    result.add(c);
                } while (rs.next());
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public ArrayList<Review> getAllReviews() {
        ArrayList<Review> result = new ArrayList<>();
        String query = "SELECT * FROM reviews";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new ArrayList<>();
                do {
                    Review c = new Review(
                            rs.getInt("reviewid"),
                            rs.getInt("courseid"),
                            rs.getInt("reviewby"),
                            rs.getInt("rating"),
                            rs.getString("comment"),
                            rs.getTimestamp("reviewedon")
                    );
                    result.add(c);
                } while (rs.next());
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public String getAllReviewsByCourseIdHtml(String courseId) {
        ArrayList<Review> reviews = getAllReviewsByCourseId(courseId);
        String out = "";
        for (Review review : reviews) {
            User user = Models.userModel.getUser(new Pair<String, String>("userid", String.valueOf(review.getReviewedBy())));
            out += ""
                    + "    <div class=\"container-fluid\">"
                    + "        <div class=\"row\">"
                    + "            <div class=\"col-sm-1\">"
                    + "                <div class=\"thumbnail\">"
                    + "                    <img class=\"img-responsive user-photo\" src=\"" + user.getProfileimage() + "\">"
                    + "                </div><!-- /thumbnail -->"
                    + "            </div><!-- /col-sm-1 -->"
                    + ""
                    + "            <div class=\"col-sm-11\">"
                    + "                <div class=\"panel panel-default\">"
                    + "                    <div class=\"panel-heading\">"
                    + "                        <strong>" + user.getProfileLink() + "</strong> <span class=\"text-muted\">reviewed on" + review.getReveiwedon() + "</span>"
                    + "                    </div>"
                    + "                    <div class=\"panel-body\">" + review.getComment() + "<hr><small>Rating: " + review.getRating() + "/5</small></div><!-- /panel-body -->"
                    + "                </div><!-- /panel panel-default -->"
                    + "            </div><!-- /col-sm-11 -->"
                    + "        </div><!-- /row -->"
                    + "    </div><!-- /container -->";
        }

        return out;
    }
}

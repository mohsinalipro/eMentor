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
public class Course implements Serializable {

    int courseid;
    String title;
    String subheading;
    String description;
    String prerequisite;
    String thumbnail;
    int categoryid;
    int createdby;
    String language;
    String level;
    Timestamp lastupdated;
    int nooflectures;
    int price;

    public Course() {
    }

    public Course(int courseid, String title, String subheading, String description, String prerequisite, String thumbnail, int categoryid, int createdby, String language, String level, Timestamp lastupdated, int nooflectures, int price) {
        this.courseid = courseid;
        this.title = title;
        this.subheading = subheading;
        this.description = description;
        this.prerequisite = prerequisite;
        this.thumbnail = thumbnail;
        this.categoryid = categoryid;
        this.createdby = createdby;
        this.language = language;
        this.level = level;
        this.lastupdated = lastupdated;
        this.nooflectures = nooflectures;
        this.price = price;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubheading() {
        return subheading;
    }

    public void setSubheading(String subheading) {
        this.subheading = subheading;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrerequisite() {
        return prerequisite;
    }

    public void setPrerequisite(String prerequisite) {
        this.prerequisite = prerequisite;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public int getCreatedby() {
        return createdby;
    }

    public void setCreatedby(int createdby) {
        this.createdby = createdby;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Timestamp getLastupdated() {
        return lastupdated;
    }

    public void setLastupdated(Timestamp lastupdated) {
        this.lastupdated = lastupdated;
    }

    public int getNooflectures() {
        return nooflectures;
    }

    public void setNooflectures(int nooflectures) {
        this.nooflectures = nooflectures;
    }

    public String getItemHtml(String createdBy, String courseRating) {
        int descMaxLength = 170;
        String out = "<div id=\"courseitem_" + courseid + "\" class=\"col-md-4 col-sm-6 course-item-wrapper\">"
                + "<div class=\"course-item\">"
                + "    <figure class=\"imghvr-fold-up\">"
                + "    <span class=\"course-title\">" + title + "</span>"
                + "      <img src=\"" + getThumbnail() + "\" class=\"img-responsive\">"
                + "      <figcaption>"
                + "          <br><br>"
                + "          <span>" + (description.length() < descMaxLength ? description : description.substring(0, descMaxLength) + "...") + "</span>";
        out += "     <span class=\"createdby\">Teacher: " + createdBy + "</span>";
        out += "     <span class=\"courserating\">Rating: " + courseRating + "/5.0</span>";
        out += " </figcaption>"
                + "       <a href=\"/eMentor/course.jsp?id=" + courseid + "\"></a>"
                + "    </figure>"
                + "</div>"
                + "</div>";

        return out;
    }

    public String getDashboardItemHtml(String createdBy, String courseRating) {
        int descMaxLength = 170;
        String out = "<div id=\"courseitem_" + courseid + "\" class=\"col-md-4 col-sm-6 course-item-wrapper\">"
                + "<div class=\"course-item\">"
                + "    <figure class=\"imghvr-fold-up\">"
                + "    <span class=\"course-title\">" + title + "</span>"
                + "      <img src=\"" + getThumbnail() + "\" class=\"img-responsive\">"
                + "      <figcaption>"
                + "          <br><br>"
                + "          <span>" + (description.length() < descMaxLength ? description : description.substring(0, descMaxLength) + "...") + "</span>";
        out += "     <span class=\"createdby\">Teacher: " + createdBy + "</span>";
        out += "     <span class=\"courserating\">Rating: " + courseRating + "/5.0</span>";
        out += " </figcaption>"
                + "       <a href=\"dashboard.jsp?page=courses&action=view&id=" + courseid + "\"></a>"
                + "    </figure>"
                + "</div>"
                + "</div>";

        return out;
    }

    public String getEnrolledItemHtml(String createdBy, String courseRating) {
        int descMaxLength = 170;
        String out = "<div id=\"courseitem_" + courseid + "\" class=\"col-md-4 col-sm-6 course-item-wrapper\">"
                + "<div class=\"course-item\">"
                + "    <figure class=\"imghvr-fold-up\">"
                + "    <span class=\"course-title\">" + title + "</span>"
                + "      <img src=\"" + getThumbnail() + "\" class=\"img-responsive\">"
                + "      <figcaption>"
                + "          <br><br>"
                + "          <span>" + (description.length() < descMaxLength ? description : description.substring(0, descMaxLength) + "...") + "</span>";
        out += "     <span class=\"createdby\">Teacher: " + createdBy + "</span>";
        out += "     <span class=\"courserating\">Rating: " + courseRating + "/5.0</span>";
        out += " </figcaption>"
                + "       <a href=\"dashboard.jsp?page=courses&action=lectures&id=" + courseid + "\"></a>"
                + "    </figure>"
                + "</div>"
                + "</div>";

        return out;
    }

    

}

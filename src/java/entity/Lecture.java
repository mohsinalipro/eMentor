/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Noor Fatima
 */
public class Lecture {
    
    int lectureid;
    String title;
    String videofile;
    int lectureno;
    int courseid;

    public Lecture() {
    }

    public Lecture(int lectureid, String title, String videofile, int lectureno, int courseid) {
        this.lectureid = lectureid;
        this.title = title;
        this.videofile = videofile;
        this.lectureno = lectureno;
        this.courseid = courseid;
    }

    public int getLectureid() {
        return lectureid;
    }

    public void setLectureid(int lectureid) {
        this.lectureid = lectureid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getVideofile() {
        return videofile;
    }

    public void setVideofile(String videofile) {
        this.videofile = videofile;
    }

    public int getLectureno() {
        return lectureno;
    }

    public void setLectureno(int lectureno) {
        this.lectureno = lectureno;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

}

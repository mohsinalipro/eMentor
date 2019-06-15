/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import database.Database;
import entity.Course;
import entity.Lecture;
import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Noor Fatima
 */
public class LectureModel extends Database {

    public boolean updateLecture(Lecture l) {
        String query = "UPDATE lectures SET title = '" + l.getTitle() + "', lectureno = '" + l.getLectureno() + "' WHERE lectureid = '" + l.getLectureid() + "'";
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

    public Lecture getLectureById(String lectureId) throws ClassNotFoundException {
        Lecture result = null;
        String query = "SELECT * FROM lectures WHERE lectureid= '" + lectureId + " ' LIMIT 1";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new Lecture(
                        rs.getInt("lectureid"),
                        rs.getString("title"),
                        rs.getString("videofile"),
                        rs.getInt("lectureno"),
                        rs.getInt("courseid")
                );
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return result;
    }

    public boolean deleteLectureById(String lectureId, String contextPath)  {
        boolean result = false;
        Connection conn = null;
        Statement stmnt = null;
        try {
            Lecture lec = Models.lectureModel.getLectureById(lectureId);
            Course c = Models.courseModel.getCourseById(String.valueOf(lec.getCourseid()));
            String query_lecture = "DELETE FROM lectures WHERE lectureid= '" + lectureId + "'";
            String query_course = "UPDATE courses SET lastupdated = now(), nooflectures = '" + (c.getNooflectures() - 1) + "' WHERE courseid = '" + c.getCourseid() + "'";
            conn = openConnection();
            conn.setAutoCommit(false);
            stmnt = conn.createStatement();
            stmnt.executeUpdate(query_lecture);
            stmnt.executeUpdate(query_course);
            conn.commit();

            String videoFilePath = contextPath;
            videoFilePath = videoFilePath.substring(0, videoFilePath.indexOf("\\build")) + "\\web" + lec.getVideofile().substring("/eMentor".length()).replace("/", "\\");
            File videoFile = new File(videoFilePath);
            if (videoFile.exists()) {
                videoFile.delete();
            }
            result = true;

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
        return result;
    }

    public int getLastInsertedLectureId() {
        int id = -1;
        try {
            ResultSet rs = querySQL("Select lectureid FROM lectures ORDER BY lectureid DESC LIMIT 1");
            if (rs.first()) {
                id = rs.getInt("lectureid");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return id;
    }

    public int addCourse(Lecture l) {
        int result = -1;
        String query = "INSERT INTO lectures (title, videofile, lectureno, courseid) "
                + "VALUES ("
                + "'" + l.getTitle() + "',"
                + "'" + l.getVideofile() + "',"
                + "'" + l.getLectureno() + "',"
                + "'" + l.getCourseid() + "'"
                + ")";
        System.out.println(query);

        try {
            if (updateSQL(query) > 0) {
                result = getLastInsertedLectureId();
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public ArrayList<Lecture> getAllLectures() throws ClassNotFoundException {
        ArrayList<Lecture> result = new ArrayList<>();
        String query = "SELECT * FROM lectures ORDER BY id DESC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new ArrayList<>();
                do {
                    Lecture c = new Lecture(
                            rs.getInt("lectureid"),
                            rs.getString("title"),
                            rs.getString("videofile"),
                            rs.getInt("lectureno"),
                            rs.getInt("courseid")
                    );
                    result.add(c);
                } while (rs.next());
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return result;
    }

    public ArrayList<Lecture> getAllLecturesByCourseId(String courseId) throws ClassNotFoundException {
        ArrayList<Lecture> result = new ArrayList<>();
        String query = "SELECT * FROM lectures WHERE courseid = '" + courseId + " 'ORDER BY lectureno ASC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new ArrayList<>();
                do {
                    Lecture c = new Lecture(
                            rs.getInt("lectureid"),
                            rs.getString("title"),
                            rs.getString("videofile"),
                            rs.getInt("lectureno"),
                            rs.getInt("courseid")
                    );
                    result.add(c);
                } while (rs.next());
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return result;
    }

}

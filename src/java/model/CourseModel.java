/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Course;
import database.Database;
import entity.Lecture;
import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mohsin Ali
 */
public class CourseModel extends Database {

    public ArrayList<Course> searchCourse(String str) {
        ArrayList<Course> result = new ArrayList<>();
        String query = "SELECT * FROM courses c, categories cat WHERE c.categoryid = cat.categoryid AND lower(c.title) LIKE '%" + str.toLowerCase() + "%' OR lower(cat.name) LIKE '%" + str.toLowerCase() + "%' OR c.description LIKE '%" + str.toLowerCase() + "%' GROUP BY c.courseid  ORDER BY c.courseid DESC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                do {

                    Course c = new Course(
                            rs.getInt("courseid"),
                            rs.getString("title"),
                            rs.getString("subheading"),
                            rs.getString("description"),
                            rs.getString("prerequisite"),
                            rs.getString("thumbnail"),
                            rs.getInt("categoryid"),
                            rs.getInt("createdby"),
                            rs.getString("language"),
                            rs.getString("level"),
                            rs.getTimestamp("lastupdated"),
                            rs.getInt("nooflectures"),
                            rs.getInt("price")
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

    public boolean deleteCourse(String courseId, String contextPath) {
        boolean result = true;
        try {
            Course c = Models.courseModel.getCourseById(courseId);
            ArrayList<Lecture> lectures = Models.lectureModel.getAllLecturesByCourseId(courseId);
            for (Lecture lec : lectures) {
                if (!Models.lectureModel.deleteLectureById(String.valueOf(lec.getLectureid()), contextPath)) {
                    result = false;
                    break;
                }
            }
            if (result) {
                String query = "DELETE FROM courses WHERE courseId = '" + c.getCourseid() + "'";
                result = updateSQL(query) > 0;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CourseModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CourseModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean updateCourse(Course c) {
        String query = "UPDATE courses SET title = '" + c.getTitle() + "', subheading = '" + c.getSubheading() + "',  description = '" + c.getDescription() + "', prerequisite = '" + c.getPrerequisite() + "', language = '" + c.getLanguage() + "'  WHERE courseid = '" + c.getCourseid() + "'";
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

    public int getCourseTeacherIdByCourseId(int courseId) {
        int id = -1;
        try {
            ResultSet rs = querySQL("Select createdby FROM courses WHERE courseid = '" + courseId + "' LIMIT 1");
            if (rs.first()) {
                id = rs.getInt("createdby");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return id;
    }

    public int getLastInsertedCourseId() {
        int id = -1;
        try {
            ResultSet rs = querySQL("Select courseid FROM courses ORDER BY courseid DESC LIMIT 1");
            if (rs.first()) {
                id = rs.getInt("courseid");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return id;
    }

    public int addCourse(Course c) {
        int result = -1;
        String query = "INSERT INTO courses (title, subheading, description, prerequisite, categoryid, language, level, lastupdated, createdby, price) "
                + "VALUES ("
                + "'" + c.getTitle() + "',"
                + "'" + c.getSubheading() + "',"
                + "'" + c.getDescription() + "',"
                + "'" + c.getPrerequisite() + "',"
                + "'" + c.getCategoryid() + "',"
                + "'" + c.getLanguage() + "',"
                + "'" + c.getLevel() + "',"
                + "now(),"
                + "'" + c.getPrice() + "',"
                + "'" + c.getCreatedby() + "'"
                + ")";
        System.out.println(query);

        try {
            if (updateSQL(query) > 0) {
                result = getLastInsertedCourseId();
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public boolean updateThumbnail(String thumbnail, String courseId) throws SQLException, ClassNotFoundException {
        String query = "UPDATE courses SET lastupdated = now(), thumbnail = '" + thumbnail + "' WHERE courseid = '" + courseId + "'";
        return (updateSQL(query) > 0);
    }

    public boolean updateNoOfLectures(String noOfLectures, String courseId) throws SQLException, ClassNotFoundException {
        String query = "UPDATE courses SET lastupdated = now(), nooflectures = '" + noOfLectures + "' WHERE courseid = '" + courseId + "'";
        return (updateSQL(query) > 0);
    }

    public Course getCourseById(String courseId) {
        Course result = null;
        String query = "SELECT * FROM courses WHERE courseid = '" + courseId + "' LIMIT 1";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new Course(
                        rs.getInt("courseid"),
                        rs.getString("title"),
                        rs.getString("subheading"),
                        rs.getString("description"),
                        rs.getString("prerequisite"),
                        rs.getString("thumbnail"),
                        rs.getInt("categoryid"),
                        rs.getInt("createdby"),
                        rs.getString("language"),
                        rs.getString("level"),
                        rs.getTimestamp("lastupdated"),
                        rs.getInt("nooflectures"),
                        rs.getInt("price")
                );
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public ArrayList<Course> getAllCoursesEnrolled(String userId) {
        ArrayList<Course> result = new ArrayList<>();
        String query = "SELECT * FROM courses c, transactions t WHERE t.courseid = c.courseid AND t.userid = '" + userId + "' GROUP BY c.courseid ORDER BY c.lastupdated DESC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new ArrayList<>();
                do {
                    Course c = new Course(
                            rs.getInt("courseid"),
                            rs.getString("title"),
                            rs.getString("subheading"),
                            rs.getString("description"),
                            rs.getString("prerequisite"),
                            rs.getString("thumbnail"),
                            rs.getInt("categoryid"),
                            rs.getInt("createdby"),
                            rs.getString("language"),
                            rs.getString("level"),
                            rs.getTimestamp("lastupdated"),
                            rs.getInt("nooflectures"),
                            rs.getInt("price")
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

    public ArrayList<Course> getAllCoursesByUserId(String userId) {
        ArrayList<Course> result = new ArrayList<>();
        String query = "SELECT * FROM courses WHERE createdBy = '" + userId + "' ORDER BY lastupdated DESC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new ArrayList<>();
                do {
                    Course c = new Course(
                            rs.getInt("courseid"),
                            rs.getString("title"),
                            rs.getString("subheading"),
                            rs.getString("description"),
                            rs.getString("prerequisite"),
                            rs.getString("thumbnail"),
                            rs.getInt("categoryid"),
                            rs.getInt("createdby"),
                            rs.getString("language"),
                            rs.getString("level"),
                            rs.getTimestamp("lastupdated"),
                            rs.getInt("nooflectures"),
                            rs.getInt("price")
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

    public ArrayList<Course> getCourseByCategoryId(String categoryId) {
        ArrayList<Course> result = new ArrayList<>();
        String query = "SELECT * FROM courses WHERE categoryid = '" + categoryId + "'";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new ArrayList<>();
                do {
                    Course c = new Course(
                            rs.getInt("courseid"),
                            rs.getString("title"),
                            rs.getString("subheading"),
                            rs.getString("description"),
                            rs.getString("prerequisite"),
                            rs.getString("thumbnail"),
                            rs.getInt("categoryid"),
                            rs.getInt("createdby"),
                            rs.getString("language"),
                            rs.getString("level"),
                            rs.getTimestamp("lastupdated"),
                            rs.getInt("nooflectures"),
                            rs.getInt("price")
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

    public ArrayList<Course> getAllCourses() {
        ArrayList<Course> result = new ArrayList<>();
        String query = "SELECT * FROM courses  ORDER BY lastupdated DESC";
        try {
            ResultSet rs = querySQL(query);
            if (rs.first()) {
                result = new ArrayList<>();
                do {
                    Course c = new Course(
                            rs.getInt("courseid"),
                            rs.getString("title"),
                            rs.getString("subheading"),
                            rs.getString("description"),
                            rs.getString("prerequisite"),
                            rs.getString("thumbnail"),
                            rs.getInt("categoryid"),
                            rs.getInt("createdby"),
                            rs.getString("language"),
                            rs.getString("level"),
                            rs.getTimestamp("lastupdated"),
                            rs.getInt("nooflectures"),
                            rs.getInt("price")
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
}

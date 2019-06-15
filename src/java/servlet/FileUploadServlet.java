/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import entity.Course;
import entity.Lecture;
import entity.User;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Models;

/**
 *
 * @author Mohsin Ali
 */
@WebServlet(name = "FileUploadServlet", urlPatterns = {"/upload"})
@MultipartConfig
public class FileUploadServlet extends HttpServlet {

    private final static Logger LOGGER
            = Logger.getLogger(FileUploadServlet.class.getCanonicalName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ServletContext servletContext = getServletContext();
        final String contextPath = servletContext.getRealPath(File.separator);
        final String appPath = contextPath.substring(0, contextPath.indexOf("\\build"));

        final String newMediaUrl = "/eMentor/media";

        // Create path components to save the file
        String path = appPath + "\\web\\media";
        final Part filePart = request.getPart("file");
        final String fileName = getFileName(filePart).replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
        final String mediaType = request.getParameter("type");
        final String refId = request.getParameter("refid");
        final String belongsto = request.getParameter("belongsto");
        String forwardUrl = "/eMentor";

        if (mediaType.equals("img")) {
            path += "\\img";
        } else if (mediaType.equals("vid")) {
            path += "\\vid";
        }

        OutputStream out = null;
        InputStream filecontent = null;

        try {
            out = new FileOutputStream(new File(path + File.separator
                    + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
//            writer.println("New file " + fileName + " created at " + path);
            LOGGER.log(Level.INFO, "File{0}being uploaded to {1}",
                    new Object[]{fileName, path});

            if (belongsto.equals("course_thumbnail") || belongsto.equals("course_video")) {
                if (belongsto.equals("course_thumbnail")) {
                    Models.courseModel.updateThumbnail(newMediaUrl + "/img/" + fileName, refId);
                    forwardUrl += "/dashboard.jsp?page=courses&id=" + refId;
                } else if (belongsto.equals("course_video")) {
                    Lecture l = new Lecture(
                            -1, // lectureid
                            request.getParameter("title"),
                            newMediaUrl + "/vid/" + fileName,
                            Integer.parseInt(request.getParameter("lectureno")),
                            Integer.parseInt(refId)
                    );
                    int lectureid = Models.lectureModel.addCourse(l);
                    if (lectureid > 0) {
                        Course course = Models.courseModel.getCourseById(refId);
                        int noOfLectures = course.getNooflectures();
                        Models.courseModel.updateNoOfLectures(String.valueOf(noOfLectures + 1), refId);
                    }
                    forwardUrl += "/dashboard.jsp?page=courses&action=lectures&id=" + refId;

                }
            } else if (belongsto.equals("profile_img")) {

                if(Models.userModel.updateUserProfileImage(refId, newMediaUrl + "/img/" + fileName)) {
                    HttpSession session = request.getSession();
                    User u = (User) session.getAttribute("current_user");
                    u.setProfileimage(newMediaUrl + "/img/" + fileName);
                }
                if (request.getParameter("updatefrom") != null && request.getParameter("updatefrom").equals("admin")) {
                    forwardUrl += "/dashboard.jsp?page=users&action=edit&id=" + refId;
                } else {
                    forwardUrl += "/profile.jsp";
                }
            }

        } catch (FileNotFoundException fne) {
//            writer.println("You either did not specify a file to upload or are "
//                    + "trying to upload a file to a protected or nonexistent "
//                    + "location.");
//            writer.println("<br/> ERROR: " + fne.getMessage());

            LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                    new Object[]{fne.getMessage()});
        } catch (SQLException ex) {
            Logger.getLogger(FileUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FileUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
//            writer.println(request.getQueryString());

            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
            System.out.println(forwardUrl);
            response.sendRedirect(forwardUrl);
            return;
        }
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

<%@page import="entity.Review"%>
<%@page import="java.io.File"%>
<%@page import="entity.Lecture"%>
<%@page import="entity.Course"%>
<%@page import="javafx.util.Pair"%>
<%@page import="entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CategoryModel"%>
<%@page import="entity.User"%>
<%@page import="model.Models"%>
<%
    User loggedIn = Models.userModel.getUser(new Pair<String, String>("userid", "1"));
    HttpSession httpSession = request.getSession(true);
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
    }
    String currentaction = (request.getParameter("action") != null ? request.getParameter("action") : "");

    Course c = null;
    if (request.getParameter("id") != null) {
        c = Models.courseModel.getCourseById(request.getParameter("id"));
    }
    if(currentaction.equals("view")) {
        if(c.getCreatedby() != loggedIn.getUserid()) {
            response.sendRedirect("dashboard.jsp?page=courses");
            return;
        }
    }
%>
<h1 class="dashboard-title">Courses</h1>
<ul class="nav nav-tabs">
    <li<%= currentaction.equals("") || currentaction.equals("viewallenrolled") ? " class=\"active\"" : ""%>><a href="?page=courses&action=viewallenrolled">Enrolled All Courses</a></li>
        <% if (loggedIn.getUsertype() != 3) {%>
    <li<%= currentaction.equals("viewall") ? " class=\"active\"" : ""%>><a href="?page=courses&action=viewall">View My Courses</a></li>
    <li<%= currentaction.equals("addnew") ? " class=\"active\"" : ""%>><a href="?page=courses&action=addnew">Add New Course</a></li>
        <% } %>
        <% if ((currentaction.equals("view") || currentaction.equals("lectures") || currentaction.equals("addnewlecture"))) {%>
    <li<%= currentaction.equals("lectures") || currentaction.equals("addnewlecture") ? " class=\"active\"" : ""%>><a href="?page=courses&action=lectures<%= (c != null ? "&id=" + c.getCourseid() : "")%>">Lectures</a></li>
        <% } %>
</ul>

<div class="container-fluid">
    <br>
    <% if (currentaction.equals("") || currentaction.equals("viewallenrolled")) {
            ArrayList<Course> courses = Models.courseModel.getAllCoursesEnrolled(String.valueOf(loggedIn.getUserid()));
            for (Course course : courses) {
                out.print(course.getEnrolledItemHtml(loggedIn.getUsername(), "1"));
            }
        } else if (loggedIn.getUsertype() != 3 && currentaction.equals("viewall")) {
            ArrayList<Course> courses = Models.courseModel.getAllCoursesByUserId(String.valueOf(loggedIn.getUserid()));
            for (Course course : courses) {
                out.print(course.getDashboardItemHtml(loggedIn.getUsername(), "1"));
            }
        } else if (currentaction.equals("addnew") || currentaction.equals("view")) {%>

    <form class="form-horizontal" role="form" method="post" action="<%= currentaction.equals("addnew") ? "do_add_course.jsp" : "do_update_course.jsp"%>">  
        <% if (c != null) {%>
        <input type="hidden" name="courseid" value="<%= c.getCourseid() %>" />
        <% } %>
        <div class="form-group">
            <label class="col-lg-3 control-label">Category:</label>
            <div class="col-lg-8">
                <select class="form-control" name="categoryid">
                    <%
                        CategoryModel categoryModel = new CategoryModel();
                        ArrayList<Category> categories = categoryModel.getAllCategories();
                        for (Category cat : categories) {
                    %>
                    <option value="<%=cat.getCategoryid()%>" <%=(c != null && c.getCategoryid() == cat.getCategoryid() ? "selected=\"selected\"" : "")%>><%=cat.getName()%></option>
                    <% }%>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-3 control-label">Course Title:</label>
            <div class="col-lg-8">
                <input class="form-control" name="title" value=" <%=(c != null ? c.getTitle() : "")%>" type="text" required="required">
            </div>
        </div>
        <!-- field -->

        <div class="form-group">
            <label class="col-lg-3 control-label">Sub Heading: </label>
            <div class="col-lg-8">
                <input class="form-control" name="subheading" value="<%=(c != null ? c.getSubheading() : "")%>" type="text" required="required">
            </div>
        </div>
        <!-- field -->

        <div class="form-group">
            <label class="col-lg-3 control-label">Summary </label>
            <div class="col-lg-8">
                <textarea class="form-control" rows="5" name="description" required="required"><%=(c != null ? c.getDescription() : "")%></textarea>
            </div>
        </div>
        <!-- field -->

        <div class="form-group">
            <label class="col-lg-3 control-label">Prerequisite: </label>
            <div class="col-lg-8">
                <input class="form-control" name="prerequisite" value="<%=(c != null ? c.getPrerequisite() : "")%>" type="text" required="required">
            </div>
        </div>
        <!-- field -->


        <div class="form-group">
            <label class="col-lg-3 control-label"> Language: </label>
            <div class="col-lg-8">
                <input class="form-control" name="language" value="<%=(c != null ? c.getLanguage() : "")%>" type="text" required="required">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">Price: </label>
            <div class="col-lg-8">
                <input class="form-control" name="price" value="<%=(c != null ? c.getPrice(): "")%>" type="number" required="required">
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-3 control-label"> Course Level: </label>
            <div class="col-lg-8">

                <div class="btn-group">
                     <label class="radio-inline"><input type="radio" name="level" <%=(c != null && c.getLevel().equalsIgnoreCase("Beginner") ? "checked=\"checked\"" : "")%> required="required">Beginner</label>
                <label class="radio-inline"><input type="radio" name="level" <%=(c != null && c.getLevel().equalsIgnoreCase("Intermediate") ? "checked=\"checked\"" : "")%> required="required">Intermediate</label>
                <label class="radio-inline"><input type="radio" name="level" <%=(c != null && c.getLevel().equalsIgnoreCase("Advanced") ? "checked=\"checked\"" : "")%> required="required">Advanced</label> 
                </div>
            </div>

        </div>
        <!-- field -->



        <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-lg-8">
                <input class="btn btn-primary" value="<%= c != null ? "Update" : "Add"%> Course" type="submit">
                <% if(c != null) { %>
                <a class="btn btn-danger" href="?page=courses&action=deletecourse&id=<%=c.getCourseid() %>">Delete</a>
                <% } %>
            </div>
        </div>
    </form> 
    <% } else if (currentaction.equals("lectures")) { %>
    <% ArrayList<Lecture> lectures = Models.lectureModel.getAllLecturesByCourseId(String.valueOf(c.getCourseid()));%>
    <h2><%=c.getTitle()%></h2>
    <p><span class="lead">Total Lectures: <%=c.getNooflectures()%> </span> 
        <% if (loggedIn.getUsertype() != 3) {%>
        <a href="?page=courses&action=addnewlecture&id=<%=c.getCourseid()%>" class="btn btn-success btn-sm" role="button">Add New Lecture</a>
        <% } %>
    </p>
    <table class="table">
        <thead class="thead-inverse">
            <tr>
                <th>#</th>
                <th>Title</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Lecture l : lectures) {
            %>
            <tr>
                <th scope="row"><%=l.getLectureno()%></th>
                <td><%= l.getTitle()%></td>
                <td>
                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#viewLecture<%=l.getLectureid()%>">View Lecture</button>

                    <!-- Modal -->
                    <div id="viewLecture<%=l.getLectureid()%>" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Lecture #<%= l.getLectureno()%> <%= l.getTitle()%></h4>
                                </div>
                                <div class="modal-body">
                                    <div align="center" class="embed-responsive embed-responsive-16by9">
                                        <video controls class="embed-responsive-item">
                                            <source src="<%=l.getVideofile()%>" type="video/mp4">
                                        </video>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <% if (loggedIn.getUsertype() != 3) {%>
                    <a href="?page=courses&action=editlecture&id=<%=l.getLectureid()%>" class="btn btn-warning btn-sm" role="button">Edit</a> <a href="?page=courses&action=deletelecture&id=<%=c.getCourseid()%>&lecid=<%=l.getLectureid()%>" class="btn btn-danger btn-sm" role="button">Delete</a>
                    <% } %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>


    <% if (loggedIn.getUserid() != c.getCreatedby()) {%>
    <hr>
    <h4 class="lead">Your Review about the course:</h4>
    <% String review = Models.reviewModel.getReviewByUserHtml(loggedIn.getUserid(), c.getCourseid());
        if (!review.isEmpty()) {
            out.print(review);
               } else { %>
    <form class="form-horizontal" role="form" method="post" action="do_add_review.jsp">  
        <input type="hidden" value="<%=c.getCourseid()%>" name="courseid" />
        <input type="hidden" value="<%=loggedIn.getUserid()%>" name="reviewby" />
        <div class="form-group">
            <div class="form-group">
                <label class="col-lg-3 control-label">Comment:</label>
                <div class="col-lg-8">
                    <textarea class="form-control" rows="3" name="comment" required="required"></textarea>
                </div>
            </div>
            <label class="col-lg-3 control-label">Rating:</label>
            <div class="col-lg-8">
                <div class="btn-group">
                    <label class="radio-inline"><input type="radio" name="rating" value="1" required="required">1</label>
                    <label class="radio-inline"><input type="radio" name="rating" value="2" required="required">2</label>
                    <label class="radio-inline"><input type="radio" name="rating" value="3" required="required">3</label>
                    <label class="radio-inline"><input type="radio" name="rating" value="4" required="required">4</label>
                    <label class="radio-inline"><input type="radio" name="rating" value="5" required="required">5</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-3 control-label"></label>
            <div class="col-lg-8">
                <input class="btn btn-primary btn-sm" value="Post Review" type="submit">
            </div>
        </div>
    </form>
    <% }%>
    <% }%>


    <% } else if (currentaction.equals("addnewlecture") || currentaction.equals("editlecture")) { %>
    <%
        Lecture l = null;
        if (currentaction.equals("editlecture") && request.getParameter("id") != null) {
            l = Models.lectureModel.getLectureById(request.getParameter("id"));
        }

    %>
    <form class="form-horizontal" role="form" method="post" action="upload?belongsto=course_video&type=vid&refid=<%=c.getCourseid()%>" enctype="multipart/form-data">  
        <div class="form-group">
            <label class="col-lg-3 control-label">Lecture No:</label>
            <div class="col-lg-8">
                <input class="form-control" name="lectureno" value="<%=(l != null ? l.getLectureno() : c.getNooflectures() + 1)%>" type="number" required="required">
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-3 control-label">Lecture Title:</label>
            <div class="col-lg-8">
                <input class="form-control" name="title" value="<%=l != null ? l.getTitle() : ""%>" type="text" required="required">
            </div>
        </div>
        <% if (currentaction.equals("addnewlecture")) { %>
        <div class="form-group">
            <label class="col-lg-3 control-label">Video:</label>
            <div class="col-lg-8">
                <input type="file" class="form-control-file" name="file" required="required">
                <!--<small class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>-->
                <br>
                <input class="btn btn-primary btn-sm" value="Upload Video" type="submit">
            </div>
        </div>
        <% } else if (currentaction.equals("editlecture")) { %>
        <div class="form-group">
            <label class="col-lg-3 control-label"></label>
            <div class="col-lg-8">
                <input class="btn btn-primary btn-sm" value="Update Lecture" type="submit">
            </div>
        </div>
        <% } %>
    </form>
    <% } else if (currentaction.equals("deletelecture")) { %>
    <%
        String lectureId = request.getParameter("lecid") != null ? request.getParameter("lecid") : "";
        if (!lectureId.isEmpty()) {
            Lecture lec = Models.lectureModel.getLectureById(lectureId);
            Course crs = Models.courseModel.getCourseById(String.valueOf(lec.getCourseid()));
            if (lec != null && crs != null
                    && Models.lectureModel.deleteLectureById(lectureId,getServletContext().getRealPath(""))) {
    %>

    <div class="alert alert-success">
        Lecture Deleted Successfully
    </div>
    <a href="dashboard.jsp?page=courses&action=lectures&id=<%=c.getCourseid() %>" class="btn btn-default">Go Back</a>
    <%
        } else { %>
        
    <div class="alert alert-success">
        Error deleting lecture
    </div>
    <% } %> 
    <% } %> 
    <% } else if(currentaction.equals("deletecourse")) { %> 
    <% if(Models.courseModel.deleteCourse(request.getParameter("id"),getServletContext().getRealPath(File.separator))) { %>
        
    <div class="alert alert-success">
        Course Deleted Successfully
    </div>
        <% } else { %>
        
    <div class="alert alert-success">
        Error deleting course
    </div>
    <% } %>
    <% } %>
</div>
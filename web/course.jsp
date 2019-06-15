<%@page import="entity.Lecture"%>
<%@page import="entity.Transaction"%>
<%@page import="model.Models"%>
<%@page import="entity.Category"%>
<%@page import="model.CategoryModel"%>
<%@page import="javafx.util.Pair"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Course"%>
<%@page import="entity.User"%>
<%@page import="model.UserModel"%>
<%
    User loggedIn = null;
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
    }
    boolean alreadyEnrolled = false;

    String courseId = request.getParameter("id");
    Course course = Models.courseModel.getCourseById(courseId);
    int teacherId = Models.courseModel.getCourseTeacherIdByCourseId(course.getCourseid());
    User teacher = Models.userModel.getUser(new Pair<String, String>("userid", String.valueOf(teacherId)));
    ArrayList<Transaction> transactions = Models.transactionModel.getAllTransactionsByCourseId(course.getCourseid());
    ArrayList<Lecture> lectures = Models.lectureModel.getAllLecturesByCourseId(String.valueOf(course.getCourseid()));
    double courseRating = Models.reviewModel.getCourseRating(course.getCourseid());

    if (loggedIn != null) {
        alreadyEnrolled = Models.transactionModel.transactionExists(loggedIn.getUserid(), course.getCourseid());
    }


%>
<% request.setAttribute("pagetitle", course.getTitle());%>
<jsp:include page="template/header.jsp"></jsp:include>
    <section id="courses" class="section-padding">
        <div class="container">
            <div class="row">
                <div class="jumbotron">

                    <h2><%= course.getTitle()%></h2>
                <div class="container-fluid">
                    <u><strong>Summary: </strong></u>
                    <div class="row">
                        <div class="col-sm-8">

                            <p>
                                <small><%= course.getDescription()%></small>
                            </p>
                        </div>
                        <div class="col-sm-4"><img src="<%= course.getThumbnail()%>" class="img-responsive" /></div>
                    </div>
                </div>
                <hr class="my-4">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">Language: <%= course.getLanguage()%></div>
                        <div class="col-sm-3">Level: <%= course.getLevel()%></div>
                        <div class="col-sm-3">Lectures: <%= course.getNooflectures()%></div>
                        <div class="col-sm-3">Students Enrolled: <%= transactions.size()%></div>
                    </div>
                </div>
                <hr class="my-4">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3 text-center">Teacher: <%=teacher.getProfileLink()%></div>
                        <div class="col-sm-3 text-center">Rating: <%= courseRating%>/5.0</div>
                        <div class="col-sm-3 text-center">Price: Rs.<%= course.getPrice()%></div>
                        <div class="col-sm-3 text-center">
                            <% if (alreadyEnrolled || (loggedIn != null && loggedIn.getUserid() == course.getCreatedby())) {%>
                            <a class="btn btn-success btn-sm" href="dashboard.jsp?page=courses&action=view&id=<%= course.getCourseid()%>">View Course</a>
                            <% } else {%>
                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#confirmdialog">Enroll Now</button>

                            <!-- Modal -->
                            <div id="confirmdialog" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Confirm Enrollment</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="table-responsive"> 
                                                <table class="table table-condensed">
                                                    <thead>
                                                        <tr>
                                                            <td class="text-left"><strong>Course Title</strong></td>
                                                            <td class="text-center"><strong>Price</strong></td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <!-- foreach ($order->lineItems as $line) or some such thing here -->

                                                        <tr>
                                                            <td class="text-left"><%= course.getTitle()%></td>
                                                            <td class="text-right">Rs.<%= course.getPrice()%></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="thick-line text-center"><strong>Subtotal</strong></td>
                                                            <td class="thick-line text-right">Rs.<%= course.getPrice()%></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="no-line text-center"><strong>Tax</strong></td>
                                                            <td class="no-line text-right">Rs. 0</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="no-line text-center"><strong>Total</strong></td>
                                                            <td class="no-line text-right">Rs.<%= course.getPrice()%></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="no-line text-center"><strong>Your Current Balance</strong></td>
                                                            <td class="no-line text-right">Rs.<%= loggedIn.getBalance()%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            <a class="btn btn-primary btn-sm" href="enroll.jsp?id=<%= course.getCourseid()%>">Confirm</a>

                                        </div>
                                    </div>

                                </div>
                            </div>

                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
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
                    int i = 1;
                    for (Lecture l : lectures) {
                %>
                <tr>
                    <th scope="row"><%=l.getLectureno()%></th>
                    <td><%= l.getTitle()%></td>
                    <td>
                        <% if (i == 1) {%>
                        <!-- Trigger the modal with a button -->
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#viewLecture<%=l.getLectureid()%>">Preview</button>

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
                        <%  } %>
                    </td>
                </tr>
                <% 
                    if(!alreadyEnrolled) {
                        i++;
                    }
                    %>
                <%  }%>
            </tbody>
        </table>

        <hr>
        <h4 class="lead">Students' Reviews about the course:</h4>
        <%=Models.reviewModel.getAllReviewsByCourseIdHtml(String.valueOf(course.getCourseid()))%>
    </div>
</section> <!-- /courses -->

<jsp:include page="template/footer.jsp"></jsp:include>

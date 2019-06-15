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
    if (loggedIn == null || request.getParameter("id") == null) {
        response.sendRedirect("/eMentor/");
        return;
    }

    String courseId = request.getParameter("id");
    Course course = Models.courseModel.getCourseById(courseId);
    boolean alreadyEnrolled = Models.transactionModel.transactionExists(loggedIn.getUserid(), course.getCategoryid());
    if (alreadyEnrolled) {
        response.sendRedirect("course.jsp?id=" + course.getCourseid());
        return;
    }
    int teacherId = Models.courseModel.getCourseTeacherIdByCourseId(course.getCourseid());
    User teacher = Models.userModel.getUser(new Pair<String, String>("userid", String.valueOf(teacherId)));

    int transactionResult = Models.transactionModel.makeTransaction(course.getCourseid(), loggedIn.getUserid(), course.getPrice());
    loggedIn.setBalance(Models.userModel.getUserCurrentBalance(loggedIn.getUserid()));
    session.setAttribute("current_user", loggedIn);

%>
<% request.setAttribute("pagetitle", course.getTitle());%>
<jsp:include page="template/header.jsp"></jsp:include>
    <section id="courses" class="section-padding">
        <div class="container">
            <div class="row">
            <% if (transactionResult > 0) {%>
            <div class="alert alert-success">
                Congrats, Course Enrollment Successful
            </div>
            <div class="jumbotron">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="invoice-title">
                                <h2>Invoice</h2><h3 class="pull-right">Order # <%=transactionResult%></h3>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-xs-12 text-right">
                                    <address>
                                        <strong>Enrollment Date:</strong><br>
                                        <%=Models.transactionModel.getTransactionById(transactionResult) %><br><br>
                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><strong>Order summary</strong></h3>
                                </div>
                                <div class="panel-body">
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
                                                    <td class="no-line text-center"><strong>Your Remaining Balance</strong></td>
                                                    <td class="no-line text-right">Rs.<%= loggedIn.getBalance()%></td>                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <a class="btn btn-success btn-lg" href="course.jsp?id=<%=course.getCourseid()%>">View Course Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } else if (transactionResult == 0) { %>
            <div class="alert alert-warning">
                Not enough balance to enroll this course
            </div>
            <% } else { %>
            <div class="alert alert-danger">
                Error, Something went wrong please try again
            </div>
            <% }%>
        </div>
    </div>
</section> <!-- /courses -->

<jsp:include page="template/footer.jsp"></jsp:include>


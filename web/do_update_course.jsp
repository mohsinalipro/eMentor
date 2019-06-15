<%@page import="javafx.util.Pair"%>
<%@page import="model.Models"%>
<%@page import="entity.User"%>
<%
    User loggedIn = null;
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
    } else {
        response.sendRedirect("/eMentor/login.jsp");
        return;
    }


    request.setAttribute("pagetitle", loggedIn.getFname() + "'s Dashboard");
%>
<jsp:include page="template/header.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="/eMentor/css/dashboardstyle.css">

    <div id="wrapper">

    <jsp:include page="template/dashboard_sidebar.jsp"></jsp:include>


        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">

                    <jsp:useBean id="course" class="entity.Course" scope="request">
                        <jsp:setProperty name="course" property="*" />
                    </jsp:useBean>
                    <%
                        if (Models.courseModel.updateCourse(course)) {
                    %>
                    <div class="alert alert-success">
                        Course Updated Successfully
                    </div>
                    <a class="btn btn-sm btn-default" href="dashboard.jsp?page=courses&action=view&id=<%= course.getCourseid() %>">Go Back</a>
                    <% } else { %>
                    <div class="alert alert-danger">
                        Error updating course
                    </div>
                    <a class="btn btn-sm btn-default" href="dashboard.jsp?page=courses">Go Back</a>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<jsp:include page="template/footer.jsp"></jsp:include>


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

    String currentpage = (request.getParameter("page") != null ? request.getParameter("page") : "");

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

                    <jsp:useBean id="c" class="entity.Course">
                        <jsp:setProperty name="c" property="*" />
                        <jsp:setProperty name="c" property="createdby" value="<%= loggedIn.getUserid()%>"></jsp:setProperty>
                    </jsp:useBean>
                    <%
                        c.setCourseid(Models.courseModel.addCourse(c));
                        if (c.getCourseid() > 0) {
                    %>
                    <div class="alert alert-success">
                        Course Added Successfully
                    </div>
                    <form class="form-horizontal" role="form" method="post" action="upload?belongsto=course_thumbnail&type=img&refid=<%=c.getCourseid()%>" enctype="multipart/form-data">  
                        <p class="lead muted">Set Course Showcase Image...</p>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Showcase Image:</label>
                            <div class="col-lg-8">
                                <input type="file" class="form-control-file" name="file" required="required">
                                <!--<small class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>-->
                                <br>
                                <input class="btn btn-primary btn-sm" value="Upload Image" type="submit">
                            </div>
                        </div>
                    </form>
                    <% } else { %>
                    <div class="alert alert-danger">
                        Error adding course
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<jsp:include page="template/footer.jsp"></jsp:include>


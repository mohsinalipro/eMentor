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

                    <jsp:useBean id="user" class="entity.User" scope="request">
                        <jsp:setProperty name="user" property="*" />
                    </jsp:useBean>
                    <%
                        out.print(user.getUsertype());
                        user = Models.userModel.addUser(user);
                        if (user != null) {
                    %>
                    <div class="alert alert-success">
                        User Added Successfully
                    </div>
                    <a class="btn btn-sm btn-default" href="dashboard.jsp?page=users&action=edit&id=<%= user.getUserid()%>">Go Back</a>
                    <% } else { %>
                    <div class="alert alert-danger">
                        Error adding user
                    </div>
                    <a class="btn btn-sm btn-default" href="dashboard.jsp?page=users&action=viewall">Go Back</a>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<jsp:include page="template/footer.jsp"></jsp:include>


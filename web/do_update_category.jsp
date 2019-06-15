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

                    <jsp:useBean id="category" class="entity.Category" scope="request">
                        <jsp:setProperty name="category" property="*" />
                    </jsp:useBean>
                    <%
                        category.setIcon(category.getIcon().substring(category.getIcon().indexOf("fa-")+3));
                        Models.categoryModel.updateCategory(category);
                        if (category.getCategoryid()> 0) {
                    %>
                    <div class="alert alert-success">
                        Category Updated Successfully
                    </div>
                    <a class="btn btn-sm btn-default" href="dashboard.jsp?page=categories&action=edit&id=<%= category.getCategoryid()%>">Go Back</a>
                    <% } else { %>
                    <div class="alert alert-danger">
                        Error updating category
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


<%@page import="java.util.ArrayList"%>
<%@page import="javafx.util.Pair"%>
<%@page import="model.Models"%>
<%@page import="entity.User"%>
<% 
    User loggedIn = null;
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
    } 

    String currentpage = (request.getParameter("page") != null ? request.getParameter("page") : "");

    
     if (loggedIn == null || (loggedIn != null && loggedIn.getUsertype() != 1 && currentpage.equals("users") || currentpage.equals("categories"))) {
             response.sendRedirect("/eMentor/");
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
                    <% if (currentpage.equals("")) {  %>
                    <jsp:include page="template/dashboard_home.jsp"></jsp:include>
                    <% } else if (currentpage.equals("courses")) { %>
                    <jsp:include page="template/dashboard_courses.jsp"></jsp:include>
                    <% } else if (currentpage.equals("categories")) {%>
                    <jsp:include page="template/dashboard_categories.jsp"></jsp:include>
                    <% } else if (currentpage.equals("users")) { %> 
                    <jsp:include page="template/dashboard_users.jsp"></jsp:include>
                    <% } else if (currentpage.equals("reviews")) { %>
                    <jsp:include page="template/dashboard_reviews.jsp"></jsp:include>
                    <% } else if (currentpage.equals("transactions")) { %>  
                    <jsp:include page="template/dashboard_transactions.jsp"></jsp:include>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<jsp:include page="template/footer.jsp"></jsp:include>

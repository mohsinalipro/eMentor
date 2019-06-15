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


%>

<!-- Sidebar -->
<div id="sidebar-wrapper">
    <ul class="sidebar-nav">
        <li class="sidebar-brand">
            <a href="/eMentor/dashboard.jsp">Dashboard</a>
        </li>
        <li style="background: #eee;">
            <% if (loggedIn.getUsertype() == 1) {
                    out.print("Admin");
                } else if (loggedIn.getUsertype() == 2) {
                    out.print("Teacher");
                } else if (loggedIn.getUsertype() == 3) {
                    out.print("Student");
                }%>
        </li>
        <li><a href="?page=courses">Manage Courses</a></li>
            <% if (loggedIn.getUsertype() == 1) { %>
        <li><a href="?page=categories">Manage Categories</a></li>
        <li><a href="?page=users">Manage Users</a></li>
            <% }%>
        <li><a href="?page=reviews">View Reviews</a></li>
        <li><a href="?page=transactions">View Transactions</a></li>
    </ul>
</div>
<!-- /#sidebar-wrapper -->

<%@page import="java.io.File"%>
<%@page import="javafx.util.Pair"%>
<%@page import="entity.User"%>
<%@page import="entity.Course"%>
<%@page import="model.Models"%>
<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Transaction"%>
<%
    User loggedIn = null;
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
    }
   

    String currentaction = (request.getParameter("action") != null ? request.getParameter("action") : "");

%>
<h1 class="dashboard-title">Users</h1>
<ul class="nav nav-tabs">
    <li<%= currentaction.equals("") || currentaction.equals("viewall") ? " class=\"active\"" : ""%>><a href="?page=users&action=viewall">View All Users</a></li>
    <li<%= currentaction.equals("addnew") ? " class=\"active\"" : ""%>><a href="?page=users&action=addnew">Add New User</a></li>
        <% if (currentaction.equals("edit")) {%>
    <li<%= currentaction.equals("edit") ? " class=\"active\"" : ""%>><a href="?page=users&action=edit">Edit User</a></li>
        <% } %>
</ul>

<% if (currentaction.equals("") || currentaction.equals("viewall")) { %>
<%     ArrayList<User> users = Models.userModel.getAllUsers(); %>
<div class="table-responsive"> 
    <table class="table">
        <thead class="thead-inverse"> 
            <tr>
                <th class="text-center"><strong>User ID</strong></th>
                <th class="text-left"><strong>Username</strong></th>
                <th class="text-left"><strong>First Name</strong></th>
                <th class="text-left"><strong>Last Name</strong></th>
                <th class="text-left"><strong>Email</strong></th>
                <th class="text-center"><strong>Type</strong></th>
                <th class="text-center"><strong>Date Registered</strong></th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <% for (User u : users) {%>
            <tr>
                <td class="text-center"><%= u.getUserid()%></td>
                <td class="text-left"><%= u.getProfileLink()%></td>
                <td class="text-left"><%= u.getFname()%></td>
                <td class="text-left"><%= u.getLname()%></td>
                <td class="text-left"><%= u.getEmail()%></td>
                <td class="text-center">
                    <% if (u.getUsertype() == 1) { %>
                    Admin
                    <% } else if (u.getUsertype() == 2) { %>
                    Teacher
                    <% } else { %>
                    Student
                    <% }%>

                </td>
                <td class="text-center"><%= u.getRegisteredon()%></td>
                <td class="text-center">
                    <a class="btn btn-sm btn-info" href="dashboard.jsp?page=users&action=edit&id=<%=u.getUserid()%>">Edit</a>
                    <a class="btn btn-sm btn-danger" href="dashboard.jsp?page=users&action=delete&id=<%=u.getUserid()%>">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<% } else if (currentaction.equals("edit") || currentaction.equals("addnew")) {%>
<% User u = null;
    if (request.getParameter("id") != null) {
        u = Models.userModel.getUser(new Pair<String, String>("userid", request.getParameter("id")));
    };%>
<%= currentaction.equals("edit") && u != null ? User.getProfileImageCard(u, true, true) : ""%>
<br>
<form onsubmit="return userupdate();" class="form-horizontal" role="form" method="post" action="<%= (currentaction.equals("addnew") ? "do_add_user.jsp" : "do_update_user.jsp")%>">  
    <input type="hidden" name="userid" value="<%= u != null ? u.getUserid() : ""%>" />
    <div class="form-group">
        <label class="col-lg-3 control-label">First Name:</label>
        <div class="col-lg-8">
            <input class="form-control" name="fname" value="<%= u != null ? u.getFname() : ""%>" type="text" required="required">
        </div>
    </div>

    <div class="form-group">
        <label class="col-lg-3 control-label">Last name:</label>
        <div class="col-lg-8">
            <input class="form-control" name="lname" value="<%= u != null ? u.getLname() : ""%>" type="text" required="required">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">City</label>
        <div class="col-lg-8">
            <input class="form-control" name="city" value="<%= u != null ? u.getCity() : ""%>" type="text" required="required">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">Country</label>
        <div class="col-lg-8">
            <input class="form-control" name="country" value="<%= u != null ? u.getCountry() : ""%>" type="text" required="required">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">Email:</label>
        <div class="col-lg-8">
            <input class="form-control" name="email" value="<%= u != null ? u.getEmail() : ""%>" type="email" required="required">
        </div>
    </div>
    <hr>
    <div class="form-group">
        <label class="col-md-3 control-label">Username:</label>
        <div class="col-md-8">
            <% if (u != null) {%>
            <input class="form-control" name="username" value="<%= (u.getUsername() != null && u.getUsername().isEmpty() ? "" : u.getUsername())%>" type="text"<%=(u.getUsername() != null && u.getUsername().isEmpty() ? "" : "disabled=\"disabled\"")%>>
            <% } else { %>
            <input class="form-control" name="username" value="">
            <% } %>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">New Password:</label>
        <div class="col-md-8">
            <input class="form-control" id="password" name="password" value="" type="password">
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Confirm password:</label>
        <div class="col-md-8">
            <input class="form-control" id="repassword" name="repassword" value="" type="password">
        </div>
    </div>
    <div class="alert alert-danger" id="formerror"></div>
    <div class="form-group">
        <label class="col-md-3 control-label"></label>
        <div class="col-md-8"> 
            <input class="btn btn-primary" value="Save Changes" type="submit">
            <span></span>
            <a href="/eMentor/profile.jsp?action=edit" class="btn btn-default">Cancel</a>
        </div>
    </div>
</form>
<% } else if (currentaction.equals("delete") && request.getParameter("id") != null) { %>
<% if (Models.userModel.deleteUser(request.getParameter("id"), getServletContext().getRealPath(File.separator))) { %>
<div class="alert alert-success">
    User Deleted Successfully
</div>
<%} else { %>
<div class="alert alert-danger">
    Error deleting user
</div>
<%}%>
<a href="dashboard.jsp?page=users&action=viewall" class="btn btn-default">Go Back</a>
<%}%>
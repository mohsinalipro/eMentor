<%@page import="model.Models"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="javafx.util.Pair"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CourseModel"%>
<%@page import="entity.Course"%>
<%@page import="entity.User"%>
<%@page import="model.UserModel"%>
<%
    User loggedIn = null;
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
    }

    String action = (request.getParameter("action") != null ? request.getParameter("action") : "");

    User publicUser = null;
    if (request.getParameter("id") != null) {
        publicUser = Models.userModel.getUser(new Pair<String, String>("userid", request.getParameter("id")));
        if (publicUser == null) {
            response.sendRedirect("/eMentor/");
            return;
            // user not found
        }
    } else if (loggedIn == null) {
        response.sendRedirect("/eMentor/");
        return;
        // user not found
    }   

    if (publicUser != null) {
        request.setAttribute("pagetitle", publicUser.getFname() + "'s Profile");
    } else if (loggedIn != null) {
        request.setAttribute("pagetitle", loggedIn.getFname() + "'s Profile");
    }
%>
<jsp:include page="template/header.jsp"></jsp:include>

    <div class="container-fluid page-title">
        <div class="container">

            <h3 class="det-txt">Profile</h3>
        </div>
    </div>
    <!--Profile-->
    <section id="profile" class="section-padding">
        <div class="container">
        <% if (loggedIn != null && action.equals("update")) { %>
        <div class="alert alert-info alert-dismissable">
            <a class="panel-close close" data-dismiss="alert">×</a> 
            <i class="fa fa-coffee"></i>
            Profile has been updated
        </div>
        <% } %>
        <div class="row">
            <!-- left column -->
            <div class="col-md-3 profile-sidebar">
                <ul class="list-group nav-stacked">
                    <li class="list-inline-item"><a href="/eMentor/profile.jsp?id=<%= publicUser != null ? publicUser.getUserid() : loggedIn.getUserid()%>" class="btn btn-default btn-block">Overview</a></li>
                        <% if (loggedIn != null) { %>
                    <li class="list-inline-item"><a href="/eMentor/profile.jsp?action=edit" class="btn btn-default btn-block">Account Settings</a></li>
                        <% }%>
                    <li class="list-inline-item"><a href="/eMentor/profile.jsp?action=courses&id=<%= publicUser != null ? +publicUser.getUserid() : loggedIn.getUserid()%>" class="btn btn-default btn-block">View <%=(publicUser != null ? publicUser.getFname() + "'s" : "My")%> Courses</a></li>
                </ul>
            </div>
            <div class="col-md-9">

                <% if (loggedIn != null && action.equals("edit")) {%>
                <!-- Account Settings -->
                <%=User.getProfileImageCard(loggedIn,true, false)%>
                <br>
                <form onsubmit="return userupdate();"  class="form-horizontal" role="form" method="post" action="do_update_user.jsp">  
                    <input type="hidden" name="userid" value="<%=loggedIn.getUserid() %>" />
                    <div class="form-group">
                        <label class="col-lg-3 control-label">First Name:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="fname" value="<%=loggedIn.getFname()%>" type="text" required="required">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Last name:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="lname" value="<%=loggedIn.getLname()%>" type="text" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">City</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="city" value="<%=loggedIn.getCity()%>" type="text" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Country</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="country" value="<%=loggedIn.getCountry()%>" type="text" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Email:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="email" value="<%=loggedIn.getEmail()%>" type="email" required="required">
                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Username:</label>
                        <div class="col-md-8">
                            <input class="form-control" name="username" value="<%=(loggedIn.getUsername() != null && loggedIn.getUsername().isEmpty() ? "" : loggedIn.getUsername())%>" type="text"<%=(loggedIn.getUsername() != null && loggedIn.getUsername().isEmpty() ? "" : "disabled=\"disabled\"")%>>
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
                <% } else if (request.getParameter("action") != null && request.getParameter("id") != null && request.getParameter("action").equals("courses")) { %>
                <div class="container-fluid">
                    <div class="row">
                        <%

                            ArrayList<Course> courses = Models.courseModel.getAllCoursesByUserId(request.getParameter("id"));
                            for (Course c : courses) {

                                User u = Models.userModel.getUser(new Pair<String, String>("userid", String.valueOf(c.getCreatedby())));
                                out.print(c.getItemHtml(u.getUsername(), "1"));
                            }

                        %>
                    </div>
                </div>
                <%} else {%>

                <!-- Overview -->
                <%=User.getProfileImageCard(loggedIn,false, false)%>
                <% }%>
            </div>
        </div>
    </div>
    <hr>
</section>
<!--/ Contact-->
<jsp:include page="template/footer.jsp"></jsp:include>


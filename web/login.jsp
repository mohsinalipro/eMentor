<%@page import="model.Models"%>
<%@page import="javafx.util.Pair"%>
<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CourseModel"%>
<%@page import="model.UserModel"%>
<%
    User loggedIn = null;
    HttpSession httpSession = request.getSession(true);
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
        response.sendRedirect("/eMentor/");
        return;
    }
    String loginAttempt = request.getParameter("login_submitted");

    if (loggedIn == null) {

        if (loginAttempt != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            int userid = Models.userModel.isValidLogin(username, password);
            if (userid != -1) {
                User u = Models.userModel.getUser(new Pair<String, String>("username", username));
                if (u != null) {
                    httpSession.setAttribute("current_user", u);
                    response.sendRedirect("/eMentor/profile.jsp");
                    return;
                }
            }
        }
    }
%>
<% request.setAttribute("pagetitle", "Login");%>
<jsp:include page="template/header.jsp"></jsp:include>
    <div class="container-fluid page-title">
        <div class="container">

            <h3 class="det-txt">Login</h3>
        </div>
    </div>
    <section id="login" class="section-padding">
        <div class="container">
            <div class="alert alert-danger alert-dismissable fade in">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Invalid login!</strong> Username or password is incorrect, please try again.
            </div>
        </div>
    </section>
    <!--/ login-->
<jsp:include page="template/footer.jsp"></jsp:include>

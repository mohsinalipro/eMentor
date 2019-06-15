<%@page import="model.Models"%>
<%@page import="javafx.util.Pair"%>
<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%
    User loggedIn = null;
    HttpSession httpSession = request.getSession(true);
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
        response.sendRedirect("/eMentor/");
    }
    String signupAttempt = request.getParameter("signup_submitted");

    if (loggedIn == null) {

        if (signupAttempt != null) {
            /*String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");*/
            
            /*User u = Models.userModel.getUser(new Pair<String, String>("email", email));

            if (u == null) {
                u = Models.userModel.addUser(fname, lname, email, password);
                httpSession.setAttribute("current_user", u);
                response.sendRedirect("/eMentor/profile.jsp");
                return;
            }*/
            %> 
            <jsp:useBean id="u" class="entity.User" scope="request">
                <jsp:setProperty name="u" property="*" />
            </jsp:useBean>
            
            <%
            u = Models.userModel.addUser(u);
            if(u != null ) {
                httpSession.setAttribute("current_user", u);
                response.sendRedirect("/eMentor/profile.jsp");
                return;
            }
        }
    }
%>
<% request.setAttribute("pagetitle", "Login");%>
<jsp:include page="template/header.jsp"></jsp:include>
    <div class="container-fluid page-title">
        <div class="container">

            <h3 class="det-txt">Signup</h3>
        </div>
    </div>
    <section id="signup" class="section-padding">
        <div class="container">
            <div class="alert alert-danger fade in">
                <strong>Error</strong>, The email address is already registered. <a href="#" class="btn btn-default btn-default" data-target="#login" data-toggle="modal">Login</a>
            </div>
        </div>
    </section>
    <!--/ signup-->
<jsp:include page="template/footer.jsp"></jsp:include>

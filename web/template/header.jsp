<%@page import="javafx.util.Pair"%>
<%@page import="model.Models"%>
<%@page import="entity.Category"%>
<%@page import="model.CategoryModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CourseModel"%>
<%@page import="entity.User"%>
<%@page import="model.UserModel"%>
<%@page import="model.CategoryModel"%>
<%

    User loggedIn = null;
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
    } else {
        // httpSession.setAttribute("current_user", Models.userModel.getUser(new Pair<String, String>("userid", "1")));
    }
    String pageTitle = (String) request.getAttribute("pagetitle");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=pageTitle%> - eMentor</title>
        <meta name="description" content="eMentor is a global marketplace for learning and teaching online where students are mastering new skills and achieving their goals by learning, taught by expert instructors.">
        <meta name="keywords" content="online learning, online teaching">

        <!--link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans"-->
        <link rel="stylesheet" type="text/css" href="/eMentor/css/googlefonts.css">
        <link rel="stylesheet" type="text/css" href="/eMentor/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="/eMentor/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/eMentor/css/imagehover.min.css">
        <link rel="stylesheet" type="text/css" href="/eMentor/css/style.css">
        <link rel="stylesheet" type="text/css" href="/eMentor/css/custom.css">
        <script src="/eMentor/js/jquery.min.js"></script>

    </head>

    <body>
        <!--Navigation bar-->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid" id="top-header">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.jsp">Mentor</a>
                    </div>


                    <div class="collapse navbar-collapse  navbar-right" id="myNavbar">

                        <ul class="nav navbar-nav">
                            <li<%= (pageTitle.toLowerCase().contains("home") ? " class=\"active\"" : "")%>><a href="/eMentor/index.jsp">Home</a></li>
                            <li<%= (pageTitle.toLowerCase().contains("about") ? " class=\"active\"" : "")%>><a href="/eMentor/about.jsp">About</a></li>
                            <li<%= (pageTitle.toLowerCase().contains("faq") ? " class=\"active\"" : "")%>><a href="/eMentor//faq.jsp">FAQ</a></li>
                            <li<%= (pageTitle.toLowerCase().contains("contact") ? " class=\"active\"" : "")%>><a href="/eMentor/contact.jsp">Contact</a></li>
                                <% if (loggedIn != null) {%>
                            <li class="dropdown">
                                <a href="/eMentor/profile.jsp" class="btn-signup" data-toggle="dropdown"><%= loggedIn.getFname()%>! <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" style="background: #0066FF;color:#FFF;">Balance Rs.<%= loggedIn.getBalance()%></a></li>
                                    <li><a href="/eMentor/dashboard.jsp">Dashboard</a></li>
                                    <li><a href="/eMentor/profile.jsp?action=edit">Account Settings</a></li>
                                    <li class="divider"></li>
                                    <li><a href="/eMentor/logout.jsp">Logout</a></li>
                                </ul>
                            </li>
                            <%
                            } else {
                            %>
                            <li><a href="#" data-target="#login" data-toggle="modal">Login</a></li>
                            <li><a href="#"  class="btn-signup" data-target="#signup" data-toggle="modal">Sign Up</a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-3 pull-right">
                        <form onsubmit="return false;" class="navbar-form" role="search">
                            <div class="input-group">
                                <input type="text" class="form-control"  placeholder="Search" name="search" id="search">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                                <div id="ajaxsearchresults"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <!--/ Navigation bar-->
        <div class="container-fluid margin-nav subnavbar" id="subnav">
            <div class="container">


                <div class="dropdown">
                    <button class="btn dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-bars"></i> All Categories</button>
                    <ul class="dropdown-menu">
                        <%
                            CategoryModel categoryModel = new CategoryModel();
                            ArrayList<Category> categories = categoryModel.getAllCategories();
                            for (Category cat : categories) {
                        %>
                        <li><%=cat%></li>
                            <% }%>
                    </ul>
                </div> 

                <!--div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                    </ul>
                </div-->
            </div>
        </div>
        <% if (loggedIn == null) { %>
        <!--Login Modal box-->
        <div class="modal fade" id="login" role="dialog">
            <div class="modal-dialog modal-sm">

                <!-- Modal content no 1-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title text-center form-title">Login</h4>
                    </div>
                    <div class="modal-body padtrbl">
                        <div class="login-box-body">
                            <p class="login-box-msg">Log In to Your eMentor Account!</p>
                            <div class="form-group">
                                <form id="loginForm" method="post" action="/eMentor/login.jsp" onsubmit="return userlogin();">
                                    <div class="form-group has-feedback">
                                        <!----- username -------------->
                                        <input class="form-control" placeholder="Username" id="loginid" type="text" name="username" autocomplete="off" />
                                        <span style="display:none;font-weight:bold; position:absolute;color: red;position: absolute;padding:4px;font-size: 11px;background-color:rgba(128, 128, 128, 0.26);z-index: 17;  right: 27px; top: 5px;" id="span_loginid"></span>
                                        <!---Alredy exists  ! -->
                                        <span class="fa fa-user form-control-feedback"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <!----- password -------------->
                                        <input class="form-control" placeholder="Password" id="loginpsw" type="password" name="password" autocomplete="off" />
                                        <span style="display:none;font-weight:bold; position:absolute;color: grey;position: absolute;padding:4px;font-size: 11px;background-color:rgba(128, 128, 128, 0.26);z-index: 17;  right: 27px; top: 5px;" id="span_loginpsw"></span>
                                        <!---Alredy exists  ! -->
                                        <span class="fa fa-lock form-control-feedback"></span>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <button class="btn btn-green btn-block btn-flat" name="login_submitted">Sign In</button>
                                        </div>
                                    </div>
                                </form>

                                <hr />
                                <div class="text-center">Don't have an account? <a href="#" data-target="#signup" data-dismiss="modal" data-toggle="modal"><strong>Sign up</strong></a></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Signup Modal box -->
        <div class="modal fade" id="signup" role="dialog">
            <div class="modal-dialog modal-sm">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title text-center form-title">Sign Up</h4>
                    </div>

                    <div class="modal-body padtrbl">
                        <div class="login-box-body">
                            <p class="login-box-msg">Sign up to get started</p>
                            <div class="form-group">
                                <form onsubmit="return userupdate();" id="signupForm" method="post" action="/eMentor/signup.jsp" onsubmit="return usersignup();">
                                    <div class="form-group has-feedback">
                                        <!----- fname -------------->
                                        <input class="form-control" placeholder="First Name" id="fname" type="text" name="fname" autocomplete="off" required="required" />
                                        <span class="fa fa-user form-control-feedback"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <!----- lname -------------->
                                        <input class="form-control" placeholder="Last Name" id="lname" type="text" name="lname" autocomplete="off" required="required" />
                                        <span class="fa fa-user form-control-feedback"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <!----- email -------------->
                                        <input class="form-control" placeholder="Email" id="email" type="email" name="email" autocomplete="off" required="required" />
                                        <span style="display:none;font-weight:bold; position:absolute;color: red;position: absolute;padding:4px;font-size: 11px;background-color:rgba(128, 128, 128, 0.26);z-index: 17;  right: 27px; top: 5px;" id="span_loginid"></span>
                                        <!---Alredy exists  ! -->
                                        <span class="fa fa-envelope form-control-feedback"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <!----- password -------------->
                                        <input class="form-control" placeholder="Password" id="password" type="password" name="password" autocomplete="off" required="required" />
                                        <span style="display:none;font-weight:bold; position:absolute;color: grey;position: absolute;padding:4px;font-size: 11px;background-color:rgba(128, 128, 128, 0.26);z-index: 17;  right: 27px; top: 5px;" id="span_loginpsw"></span>
                                        <!---Alredy exists  ! -->
                                        <span class="fa fa-lock form-control-feedback"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <!----- repassword -------------->
                                        <input class="form-control" placeholder="Retype Password" id="repassword" type="password" name="repassword" autocomplete="off" required="required" />
                                        <span style="display:none;font-weight:bold; position:absolute;color: grey;position: absolute;padding:4px;font-size: 11px;background-color:rgba(128, 128, 128, 0.26);z-index: 17;  right: 27px; top: 5px;" id="span_loginpsw"></span>
                                        <!---Alredy exists  ! -->
                                        <span class="fa fa-lock form-control-feedback"></span>
                                    </div>
                                    
                                    <div class="alert alert-danger" id="formerror"></div>
                                    <div class="form-group">
                                        <label class="col-md-12 control-label">Signup as:</label>
                                        <div class="col-md-12" style="z-index: 10001;">
                                           <label class="radio-inline">
                                                <input type="radio" name="usertype" value="2">Teacher
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="usertype" value="3">Student
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <!----- city -------------->
                                        <input class="form-control" placeholder="City" type="text" name="city" required="required" />

                                        <!---Alredy exists  ! -->
                                        <span class="fa fa-lock form-control-feedback"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <!----- country -------------->
                                        <input class="form-control" placeholder="Country" type="text" name="country" required="required" />
                                        <!---Alredy exists  ! -->
                                        <span class="fa fa-lock form-control-feedback"></span>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <button class="btn btn-primary btn-block btn-flat" name="signup_submitted">Sign Up</button>
                                        </div>
                                    </div>
                                </form>
                                <hr />
                                <div class="text-center">Already have an account? <a href="#" data-target="#login" data-dismiss="modal" data-toggle="modal"><strong>Log In</strong></a></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--/ Sign Up -->
        <% }%>
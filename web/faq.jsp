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
%>
<% request.setAttribute("pagetitle", "FAQ");%>
<jsp:include page="template/header.jsp"></jsp:include>
    <div class="container-fluid page-title">
        <div class="container">
            <h3 class="det-txt">FAQ</h3>
        </div>
    </div>
    <!--Feature-->
    <section id="mission-statement" class="section-padding">
        <div class="container">
            <div class="row">
                <div class="header-section">
                    <p class="text-center">Frequently Asked Questions:</p>
                </div>
                <!-- Accordian -->
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">1. What does a typical eMentor course look like?</a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <p>An ideal eMentor course has at least 30 minutes of video content and is packed with insights, examples, and opportunities for students to learn by doing and achieve their goals.</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">2. Are there any costs associated with creating a course on eMentor?</a>
                            </h4>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>No, becoming an instructor, creating, and hosting your course on Udemy is completely FREE. We cover and handle all customer service, payment processing and hosting fees.</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">3. How does eMentor's revenue share work?</a>
                            </h4>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>For every student eMentor brings to your course through our marketing efforts, you keep 50% of the sale.</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">4. How should teacher price his course?</a>
                            </h4>
                        </div>
                        <div id="collapse4" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>First three videos are a trial for learners. So, if a user want to learn more from more video he has to purchase complete course on the cost you given. This cost can vary from insructor to instrucor.</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">5. How long are students able to access a course?</a>
                            </h4>
                        </div>
                        <div id="collapse5" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Once a course is purchased, the student has access to all course materials indefinitely.</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">6. Are there any standards or requirements Instructor should know about while creating his course?</a>
                            </h4>
                        </div>
                        <div id="collapse6" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>
                                    Yes. eMentor reviews all courses published on eMentor to make sure they meet our standards for quality. Here are a few important standards to keep in mind:
                                    <br />
                                    -Courses should contain at least 30 minutes (unless you’re creating a practice test course) <br />
                                    -Have at least 5 separate lectures<br />
                                    -Include valuable educational content<br />
                                    -HD Video Quality (720p or 1080p)<br />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>


                <!--/ Accordian END -->

            </div>
        </div>
    </section>
    <!--/ feature-->
<jsp:include page="template/footer.jsp"></jsp:include>


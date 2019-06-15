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
<% request.setAttribute("pagetitle", "About Us");%>
<jsp:include page="template/header.jsp"></jsp:include>

<div class="container-fluid page-title">
    <div class="container">

        <h3 class="det-txt">About Us</h3>
    </div>
</div>
    <!--Feature-->
    <section id="mission-statement" class="section-padding">
        <div class="container">
            <div class="row">
                <div class="header-section">
                    <p class="text-center">eMentor is a global marketplace for learning and teaching online where students are mastering new skills and achieving their goals by learning, taught by expert instructors.</p>
                    <hr class="bottom-line">
                </div>
                <p>
                    eMentor is an online learning platform. It is aimed at professional adults. eMentor provides a platform for experts of any kind to create courses which can be offered to the public, for a tuition fee. eMentor provides tools which enable users to create a course, promote it and earn money whenever a student purchase their courses.
                    No eMentor courses are currently credentialed for college credit; students take courses largely as a means of improving job-related skills.
                </p>
                <div class="feature-info">
                    <div class="fea">
                        <div class="col-md-6">
                            <div class="heading pull-right">
                                <h4>Teaching</h4>
                                <p>Any user can become an Instructor by submitting ‘Become an Instructor’ form after that our verification department verifies him. And he should be able to upload video lectures.</p>
                            </div>
                            <div class="fea-img pull-left  text-center">
                                <i class="fa fa-institution"></i>
                            </div>
                        </div>
                    </div>
                    <div class="fea">
                        <div class="col-md-6">
                            <div class="heading pull-right">
                                <h4>Learning</h4>
                                <p>Any user can freely access starting 3 videos. User will pay to access all the contents of a course.</p>
                            </div>
                            <div class="fea-img pull-left text-center">
                                <i class="fa fa-graduation-cap"></i>
                            </div>
                        </div>
                    </div>
                    <!--
                              <div class="fea">
                                <div class="col-md-4">
                                  <div class="heading pull-right">
                                    <h4>Award Winning Design</h4>
                                    <p>Donec et lectus bibendum dolor dictum auctor in ac erat. Vestibulum egestas sollicitudin metus non urna in eros tincidunt convallis id id nisi in interdum.</p>
                                  </div>
                                  <div class="fea-img pull-left">
                                    <i class="fa fa-trophy"></i>
                                  </div>
                                </div>
                              </div>
                    -->
                </div>
            </div>
        </div>
    </section>
    <!--/ feature-->

    <!-- ourmoto -->
    <section id="ourmoto" class="section-padding">
        <div class="container">
            <div class="row">
                <h3 class="det-txt text-center">Our Motto</h3>
                <div class="col-md-6">
                    <div class="text-center">
                        <img src="img/our-mission-icon.png" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail-info">
                        <br>
                        <hgroup>
                            <h4 class="sm-txt">To help you learn the skills you need to achieve your full potential.</h4>
                        </hgroup>
                        <ul>
                            <li>To increase access to learning opportunities/increase flexibility for students. </li>
                            <li>To enhance general quality of teaching.</li>
                            <li>To develop the skills and capabilities needed in the 21st century, and in particular to ensure that learners have the ordinal literacy skills required in their discipline, profession or career – or, put simply, to get work in the future.</li>
                            <li>To provide a market place platform to trainers.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ ourmoto -->

    <!--Faculity member-->
    <section id="faculity-member" class="section-padding">
        <div class="container">
            <div class="row">
                <div class="header-section text-center">
                    <h2>Meet Our Team</h2>
                    <p>Alone we can do so little, together we can do so much.</p>
                    <hr class="bottom-line">
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="pm-staff-profile-container">
                        <div class="pm-staff-profile-image-wrapper text-center">
                            <div class="pm-staff-profile-image">
                                <img src="img/mohsinali.jpg" alt="" class="img-thumbnail img-circle" />
                            </div>
                        </div>
                        <div class="pm-staff-profile-details text-center">
                            <p class="pm-staff-profile-name">Mohsin Ali</p>
                            <p class="pm-staff-profile-title">Group Leader</p>

                            <p class="pm-staff-profile-bio">Roll# BSEF15M044</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="pm-staff-profile-container">
                        <div class="pm-staff-profile-image-wrapper text-center">
                            <div class="pm-staff-profile-image">
                                <img src="img/femaleavater.png" alt="" class="img-thumbnail img-circle" />
                            </div>
                        </div>
                        <div class="pm-staff-profile-details text-center">
                            <p class="pm-staff-profile-name">Noor Fatima</p>
                            <p class="pm-staff-profile-title">Group Member</p>

                            <p class="pm-staff-profile-bio">Roll# BSEF15M055</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="pm-staff-profile-container">
                        <div class="pm-staff-profile-image-wrapper text-center">
                            <div class="pm-staff-profile-image">
                                <img src="img/mali.jpg" alt="" class="img-thumbnail img-circle" />
                            </div>
                        </div>
                        <div class="pm-staff-profile-details text-center">
                            <p class="pm-staff-profile-name">Muhammad Ali</p>
                            <p class="pm-staff-profile-title">Group Member</p>

                            <p class="pm-staff-profile-bio">Roll# BSEF15M058</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="pm-staff-profile-container">
                        <div class="pm-staff-profile-image-wrapper text-center">
                            <div class="pm-staff-profile-image">
                                <img src="img/femaleavater.png" alt="" class="img-thumbnail img-circle" />
                            </div>
                        </div>
                        <div class="pm-staff-profile-details text-center">
                            <p class="pm-staff-profile-name">Kinza Younus</p>
                            <p class="pm-staff-profile-title">Group Member</p>

                            <p class="pm-staff-profile-bio">Roll# BSEF15M064</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ Faculity member-->
<jsp:include page="template/footer.jsp"></jsp:include>


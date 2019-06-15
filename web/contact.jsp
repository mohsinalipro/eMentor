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
<% request.setAttribute("pagetitle", "Contact Us");%>
<jsp:include page="template/header.jsp"></jsp:include>

    <div class="container-fluid page-title">
        <div class="container">

            <h3 class="det-txt">Contact Us</h3>
        </div>
    </div>
    <!--Contact-->
    <section id="contact" class="section-padding">
        <div class="container">

            <div id="sendmessage">Your message has been sent. Thank you!</div>
            <div id="errormessage"></div>
            <form action="" method="post" role="form" class="contactForm">
                <div class="col-md-6 col-sm-6 col-xs-12 left">
                    <div class="header-section text-center">
                        <h4>Contact us by filling contact form:</h4> <br>
                    </div>
                    <div class="form-group">
                        <input type="text" name="name" class="form-control form" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                        <div class="validation"></div>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                        <div class="validation"></div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                        <div class="validation"></div>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                        <div class="validation"></div>
                    </div>
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 right">
                    <div class="header-section text-center">
                        <h4>Reach Us:</h4> <br>
                    </div>
                    <p>
                        Address: PUCIT Old Campus, Lahore, Punjab, PK 54000 <br>
                        Toll free: (888) 33-ABC<br>
                        Internationally: +1 (805) 477-3900<br>
                        Fax: (805) 755-1208<br>
                        <br><br>
                        Customer service hours:<br>
                        6:00 AM–5:00 PM PT (Mon–Fri)<br>
                        7:00 AM–4:00 PM PT (Sat–Sun)<br>
                    </p>
                </div>

                <div class="col-xs-12">
                    <!-- Button -->
                    <button type="submit" id="submit" name="submit" class="form contact-form-button light-form-button oswald light">SEND EMAIL</button>
                </div>
            </form>

        </div>
    </div>
</section>
<!--/ Contact-->
<jsp:include page="template/footer.jsp"></jsp:include>


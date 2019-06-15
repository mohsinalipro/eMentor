<%@page import="model.Models"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="javafx.util.Pair"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Course"%>
<%@page import="entity.User"%>
<%
    User loggedIn = null;
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
    }
%>
<% request.setAttribute("pagetitle", "Home"); %>
<jsp:include page="template/header.jsp"></jsp:include>


    <!--Banner-->
    <div class="banner">
        <div class="bg-color">
            <div class="container">
                <div class="row">
                    <div class="banner-text text-center">
                        <div class="text-border">
                            <h2 class="text-dec">eMentor-eLearning System</h2>
                        </div>
                        <div class="intro-para text-center quote">
                           <p class="big-text">Imagine your future!</p>
                            <p class="small-text">What do you want to learn today? What's your dream job? </p>
                            <p class="small-text">Discover the program that's right for you! </p>
              
                        </div>
                        <a href="#courses" class="mouse-hover">
                            <div class="mouse"></div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ Banner-->



    <!--Feature-->
   <section id="feature" class="section-padding">
    <div class="container">
        <a href="home.jsp"></a>
      <div class="row">
        <div class="header-section text-center">
          <h2>Features</h2>
          <p><br></p>
          <hr class="bottom-line">
        </div>
        <div class="feature-info">
          <div class="fea">
            <div class="col-md-4">
              <div class="heading pull-right">
                  
                    <h3  >Master the most 
                             competitive skills</h3>
                  
                <p>Our Nanodegree programs are built with the world's most forward?thinking companies?Google, Facebook, AT&T, IBM, GitHub, and more. Our expert project reviewers, mentors and coaches ensure that you're job-ready.</p>
              </div>
              <div class="fea-img pull-left">
                <i class="fa fa-css3"></i>
              </div>
            </div>
          </div>
          <div class="fea">
            <div class="col-md-4">
                <div class="heading pull-right" >
                    
                    <h3 >Get hired by
                        world?changing companies</h3>
                    
                <p>Hiring partnerships with leaders like IBM, Mercedes?Benz, Didi Chuxing, and more open amazing career opportunities... and Blitz gives you a new path to getting hired.</p>
              </div>
              <div class="fea-img pull-left">
                <i class="fa fa-drupal"></i>
              </div>
            </div>
          </div>
          <div class="fea">
            <div class="col-md-4">
              <div class="heading pull-right">
                  
                    <h3 >Maximize your impact</h3>
                  
                <p>Create an amazing future that you love in any field from transportation to commerce and health care to government. Expand your opportunities. Exceed your expectations. Excel!!</p>
              
              </div>
              <div class="fea-img pull-left">
                <i class="fa fa-trophy"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
    <!--/ feature-->



    <section id="courses" class="section-padding">
        <div class="container">
            <div class="row">
                <div class="header-section text-center">
                    <h2>Courses</h2>
                    <p>Want to learn something? Here are the amazing courses for you</p>
                    <hr class="bottom-line">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
            <%

                ArrayList<Course> courses = Models.courseModel.getAllCourses();
                
                for (Course c : courses) {
 
                    User u = Models.userModel.getUser(new Pair<String, String>("userid", String.valueOf(c.getCreatedby())));
                    double courseRating = Models.reviewModel.getCourseRating(c.getCourseid());
                    if(u != null)
                    out.print(c.getItemHtml(u.getUsername(), String.valueOf(courseRating)));
                }

            %>
        </div>
    </div>
</section> <!-- /courses -->

<jsp:include page="template/footer.jsp"></jsp:include>

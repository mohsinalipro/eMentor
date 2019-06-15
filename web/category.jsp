<%@page import="entity.Category"%>
<%@page import="model.CategoryModel"%>
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
    String categoryId = request.getParameter("id");
    CategoryModel catModel = new CategoryModel();
    Category cat = catModel.getCategoryById(categoryId);
    if(cat != null) {
       
%>
<% request.setAttribute("pagetitle", cat.getName() + " Courses"); %>
<jsp:include page="template/header.jsp"></jsp:include>
 <div class="container-fluid page-title">
        <div class="container">

            <h3 class="det-txt"><%= cat.getName() %> Courses</h3>
        </div>
    </div>


<section id="courses_<%= cat.getCategoryid() %>" class="section-padding">
    <div class="container">
        <div class="row">
            <%
                CourseModel courseModel = new CourseModel();
                ArrayList<Course> courses = courseModel.getCourseByCategoryId(String.valueOf(cat.getCategoryid()));
                for (Course c : courses) {
                    UserModel uModel = new UserModel();
                    User u = uModel.getUser(new Pair<String,String>("userid",String.valueOf(c.getCreatedby())));
                    if(u != null) {
                    out.print(c.getItemHtml(u.getUsername(), "1"));
                    }
                }
            %>
        </div>
    </div>
</section> <!-- /courses -->
<% } else {%>
<p>No Category Found</p>
<% } %>
<jsp:include page="template/footer.jsp"></jsp:include>

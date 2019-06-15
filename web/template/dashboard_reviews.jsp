<%@page import="entity.Review"%>
<%@page import="entity.Course"%>
<%@page import="model.Models"%>
<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%
    User loggedIn = null;
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
    } 
    ArrayList<Review> reviews = Models.reviewModel.getAllReviewsByUserId(String.valueOf(loggedIn.getUserid()));
%>
<h1 class="dashboard-title">Reviews</h1>
<div class="table-responsive"> 
    <table class="table">
        <thead class="thead-inverse"> 
            <tr>
                <th class="text-left"><strong>Course Title</strong></th>
                <th class="text-left"><strong>Your Comment</strong></th>
                <th class="text-center"><strong>Your Rating</strong></th>
                <th class="text-center"><strong>Date</strong></th>
            </tr>
        </thead>
        <tbody>
            <% for(Review r : reviews) { 
            Course c = Models.courseModel.getCourseById(String.valueOf(loggedIn.getUserid()));
            %>
            <tr>
                <td class="text-left"><a href="dashboard.jsp?page=courses&action=lectures&id=<%= c.getCourseid() %>"><%= c.getTitle() %></a></td>
                <td class="text-left">"<%= r.getComment() %>"</td>
                <td class="text-center"><%= r.getRating() %>/5</td>
                <td class="text-center"><%= r.getReveiwedon() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
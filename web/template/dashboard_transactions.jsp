<%@page import="entity.Course"%>
<%@page import="model.Models"%>
<%@page import="entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Transaction"%>
<%
    User loggedIn = null;
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("current_user") != null) {
        loggedIn = (User) httpSession.getAttribute("current_user");
    } 
    ArrayList<Transaction> transactions = Models.transactionModel.getAllTransactionsByUserId(loggedIn.getUserid());
%>
<h1 class="dashboard-title">Transactions</h1>
<div class="table-responsive"> 
    <table class="table">
        <thead class="thead-inverse"> 
            <tr>
                <th class="text-center"><strong>Transaction ID</strong></th>
                <th class="text-left"><strong>Course Title</strong></th>
                <th class="text-center"><strong>Amount</strong></th>
                <th class="text-center"><strong>Date</strong></th>
            </tr>
        </thead>
        <tbody>
            <% for(Transaction t : transactions) { 
            Course c = Models.courseModel.getCourseById(String.valueOf(t.getCourseid()));
            %>
            <tr>
                <td class="text-center"><%= t.getTransactionid() %></td>
                <td class="text-left"><a href="dashboard.jsp?page=courses&action=lectures&id=<%= c.getCourseid() %>"><%= c.getTitle() %></a></td>
                <td class="text-center">Rs.<%= t.getAmount() %></td>
                <td class="text-center"><%= t.getTimestamp() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
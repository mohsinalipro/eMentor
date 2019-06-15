<%@page import="entity.Category"%>
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
    
    String currentaction = (request.getParameter("action") != null ? request.getParameter("action") : "");

%>
<h1 class="dashboard-title">Categories</h1>
<ul class="nav nav-tabs">
    <li<%= currentaction.equals("") || currentaction.equals("viewall") ? " class=\"active\"" : ""%>><a href="?page=categories&action=viewall">View All Categories</a></li>
    <li<%= currentaction.equals("addnew") ? " class=\"active\"" : ""%>><a href="?page=categories&action=addnew">Add New Category</a></li>
        <% if (currentaction.equals("edit")) {%>
    <li<%= currentaction.equals("edit") ? " class=\"active\"" : ""%>><a href="?page=categories&action=edit">Edit Category</a></li>
        <% } %>
</ul>

<% if (currentaction.equals("") || currentaction.equals("viewall")) { %>
<%     ArrayList<Category> categories = Models.categoryModel.getAllCategories(); %>
<div class="table-responsive"> 
    <table class="table">
        <thead class="thead-inverse"> 
            <tr>
                <th class="text-center"><strong>Category ID</strong></th>
                <th class="text-center"><strong>Category Icon</strong></th>
                <th class="text-left"><strong>Category Title</strong></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <% for (Category cat : categories) {%>
            <tr>
                <td class="text-center"><%= cat.getCategoryid()%></td>
                <td class="text-center"><i class="fa fa-<%= cat.getIcon()%>"></i></td>
                <td class="text-left"><%= cat.getName()%></td>
                <td class="text-center">
                    <a class="btn btn-sm btn-info" href="dashboard.jsp?page=categories&action=edit&id=<%=cat.getCategoryid()%>">Edit</a>
                    <a class="btn btn-sm btn-danger" href="dashboard.jsp?page=categories&action=delete&id=<%=cat.getCategoryid()%>">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<% } else if (currentaction.equals("addnew") || currentaction.equals("edit")) {%>
<%  Category cat = null;
    if (currentaction.equals("edit") && request.getParameter("id") != null) {
        cat = Models.categoryModel.getCategoryById(request.getParameter("id"));
    }%>
<form class="form-horizontal" role="form" method="post" action="<%= cat != null ? "do_update_category.jsp" : "do_add_category.jsp"%>">  
    <% if (cat != null) {%>
    <input type="hidden" name="categoryid" value="<%= cat.getCategoryid()%>" />
    <% }%>
    <div class="form-group">
        <label class="col-lg-3 control-label">Icon:</label>
        <div class="col-lg-8">
            <input type="text" name="icon" class="icon-class-input hidden" value="fa fa-<%= cat != null ? cat.getIcon() : "fa-th"%>" />
            <span class="demo-icon picker-button btn btn-block" style="font-size:3rem"></span>
        </div>

        <div id="iconPicker" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Icon Picker</h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <ul class="icon-picker-list">
                                <li>
                                    <a data-class="{{item}} {{activeState}}" data-index="{{index}}">
                                        <span class="{{item}}"></span>
                                        <span class="name-class">{{item}}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="change-icon" class="btn btn-success">
                            <span class="fa fa-check-circle-o"></span>
                            Use Selected Icon
                        </button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div> <!-- Icon Picker --> 

    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">Category Title:</label>
        <div class="col-lg-8">
            <input class="form-control" name="name" value="<%= cat != null ? cat.getName() : ""%>" type="text" required="required">
        </div>
    </div>
    <!-- field -->
    <div class="form-group">
        <label class="col-md-3 control-label"></label>
        <div class="col-lg-8">
            <input class="btn btn-primary" value="Update Category" type="submit">
        </div>
    </div>
</form> 
<% } else if (currentaction.equals("delete")) {
    if (request.getParameter("id") != null && Models.categoryModel.deleteCategory(request.getParameter("id"))) {%>
<div class="alert alert-success">
    Category Deleted Successfully
</div>
<% } else { %>
<div class="alert alert-danger">
    Error deleting category
</div>
<% } %>
<a class="btn btn-sm btn-default" href="dashboard.jsp?page=categories&action=viewall">Go Back</a>
<% }%>

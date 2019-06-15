<%
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("current_user") != null) {
        request.removeAttribute("current_user");
        httpSession.invalidate();
    } else {
        response.sendRedirect("/eMentor/");
    }
%>
<% request.setAttribute("pagetitle", "Logout");%>
<jsp:include page="template/header.jsp"></jsp:include>
    <div class="container-fluid page-title">
        <div class="container">

            <h3 class="det-txt">Logout</h3>
        </div>
    </div>
    <section id="logout" class="section-padding">
        <div class="container">
            <p class="text-center">Logout successfully!</p>
        </div>
    </section>
    <!--/ logout-->
<jsp:include page="template/footer.jsp"></jsp:include>
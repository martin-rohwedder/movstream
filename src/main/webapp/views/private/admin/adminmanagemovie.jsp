<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie/create" class="btn btn-success btn-small"><i class="icon-plus-sign icon-white"></i> Create Movie</a>

<br /><br />

<table class="table table-striped table-condensed table-bordered sortable">
    <thead>
        <tr>
            <th>#</th>
            <th colspan="3">Movie Title</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${movies}" var="movie">
            <tr>
                <td style="width: 40px;"><c:out value="${movie.id}" /></td>
                <td><c:out value="${movie.title}" /></td>
                <td style="width: 70px;"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie/edit/<c:out value="${movie.id}" />" class="btn btn-warning btn-mini"><i class="icon-edit icon-white"></i> Edit</a></td>
                <td style="width: 70px;"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie/delete/<c:out value="${movie.id}" />" class="btn btn-danger btn-mini"><i class="icon-remove-circle icon-white"></i> Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/sorttable.js"></script>

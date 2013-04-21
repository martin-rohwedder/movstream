<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${movies}" var="movie">
    <c:out value="${movie.title}" />
</c:forEach>
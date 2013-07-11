<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1><spring:message code="page.adminmanagesettings.pagetitle.label" /></h1>

<form method="POST">
    <label>System Language</label>
    <select name="languageCode">
    <c:forEach items="${languages}" var="language">
        <c:choose>
            <c:when test="${language.code eq currentLanguageCode}">
                <option value="${language.code}" selected="true"><c:out value="${language.name}" /></option>
            </c:when>
            <c:otherwise>
                <option value="${language.code}"><c:out value="${language.name}" /></option>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    </select>
    <br />
    <button type="submit">Save Settings</button>
</form>

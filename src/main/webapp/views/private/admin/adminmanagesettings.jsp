<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1><spring:message code="page.adminmanagesettings.pagetitle.label" /></h1>

<form method="POST">
    <label>Change Locale</label>
    <input type="text" name="languageCode" />
    <br />
    <button type="submit">Save Settings</button>
</form>

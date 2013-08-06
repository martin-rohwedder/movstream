<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1><spring:message code="page.adminhome.pagetitle.label" /></h1>

<c:if test="${moviePercentageBasedOnGenresMap.size() ne 0}">
<div id="genre-movies-sum-chart" style="width: 470px; height: 300px;"></div>
<script type="text/javascript">
    $(document).ready(function(){
        $('#genre-movies-sum-chart').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            credits: {
                enabled: false
            },
            title: {
                text: '<spring:message code="page.adminhome.graph.moviepercentagebasedongenres.label" />'
            },
            tooltip: {
                pointFormat: '<b>{point.percentage:.2f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        format: '<b>{point.name}</b>: {point.percentage:.2f} %'
                    }
                }
            },
            series: [{
                type: 'pie',
                data: [
                    <c:set var="moviePercentageBasedOnGenresCount" value="1" scope="page" />
                    <c:forEach var="entry" items="${moviePercentageBasedOnGenresMap}">
                        <c:choose>
                            <c:when test="${moviePercentageBasedOnGenresCount eq moviePercentageBasedOnGenresMap.size()}">
                                ['<c:out value="${entry.key}" />', <c:out value="${entry.value}" />]
                            </c:when>
                            <c:otherwise>
                                ['<c:out value="${entry.key}" />', <c:out value="${entry.value}" />],
                            </c:otherwise>
                        </c:choose>
                        <c:set var="moviePercentageBasedOnGenresCount" value="${moviePercentageBasedOnGenresCount + 1}" scope="page" />
                    </c:forEach>
                ]
            }]
        });
    });
</script>
</c:if>

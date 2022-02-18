<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Добавить стол</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<form:form action="newdesk" modelAttribute="newDesk" method="post">
    Введите название стола:<form:input path="description"/>
    Введите количество мест:<form:input path="numberOfPlaces"/>
    <input type="submit" value="Добавить">
</form:form>
Список столов:
<table>
    <tr>
        <th>Название стола</th>
        <th>Количество мест</th>
        <th>Изменить</th>
        <th>Удалить</th>
    </tr>
    <c:forEach var="desk" items="${desks}">
        <c:url var="update" value="/updateDesk">
            <c:param name="deskId" value="${desk.id}"></c:param>
        </c:url>
        <c:url var="delete" value="/deleteDesk">
            <c:param name="deskId" value="${desk.id}"></c:param>
        </c:url>
        <tr>
            <td>${desk.getDescription()}</td>
            <td>${desk.getNumberOfPlaces()}</td>
            <td><input type="button" value="Изменить" onclick="window.location.href='${update}'"></td>
            <td><input type="button" value="Удалить" onclick="window.location.href='${delete}'"></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
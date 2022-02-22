<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Выбор стола</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<table>
    <tr>
        <th>Название стола</th>
        <th>Количество мест</th>
        <th>Выбрать</th>
    </tr>
    <c:forEach var="desk" items="${desks}">
        <c:url var="select" value="/selectDesk">
            <c:param name="deskId" value="${desk.id}"></c:param>
        </c:url>
        <tr>
            <td>${desk.getDescription()}</td>
            <td>${desk.getPlaces()}</td>
            <td><input type="button" value="Выбрать" onclick="window.location.href='${select}'"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Выбор стола</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<p>Выберите стол
    <br>
    Список столов:
    <c:forEach var="desk" items="${desks}">
        <br>
        <a>${desk.getDescription()}</a>
        ${desk.getNumberOfPlaces()}
    </c:forEach>
</p>
</body>
</html>
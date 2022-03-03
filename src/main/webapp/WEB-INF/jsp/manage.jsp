<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <a href="/">Главная</a>
    <a href="/desk">Выбор стола</a>
    <security:authorize access="hasRole('ADMIN')">
        <a href="/admin/manage">Столы</a>
        <a href="/admin/editmenu">Меню</a>
        <a href="/admin/edittypes">Типы</a>
    </security:authorize>
    <title>Добавить стол</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<h3>Добавить новый стол:</h3>
<form:form action="/admin/saveDesk" modelAttribute="desk" method="post">
    Введите название стола:<form:input path="description"/>
    <div><form:errors style="color: red;" id="error" path="description"/></div>
    Введите количество мест:<form:input path="places"/>
    <div><form:errors style="color: red;" id="error" path="places"/></div>
    <input type="submit" value="Добавить">
</form:form>
<a href="editmenu">Изменить меню (ссылка)</a><br>
<h3>Список столов:</h3>
<table>
    <tr>
        <th>Название стола</th>
        <th>Количество мест</th>
        <th>Изменить</th>
        <th>Удалить</th>
    </tr>
    <c:forEach var="desk" items="${desks}">
        <c:url var="edit" value="/admin/editDesk">
            <c:param name="deskId" value="${desk.id}"></c:param>
        </c:url>
        <c:url var="delete" value="/admin/deleteDesk">
            <c:param name="deskId" value="${desk.id}"></c:param>
        </c:url>
        <tr>
            <td>${desk.getDescription()}</td>
            <td>${desk.getPlaces()}</td>
            <td><input type="button" value="Изменить" onclick="window.location.href='${edit}'"></td>
            <td><input type="button" value="Удалить" onclick="window.location.href='${delete}'"></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Добавить стол</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<div class="container">
    <nav class="nav nav-pills nav-fill">
        <a class="nav-link" href="/">Главная</a>
        <a class="nav-link" href="/desk">Выбор стола</a>
        <security:authorize access="hasRole('ADMIN')">
            <a class="nav-link active" aria-current="page" href="/admin/manage">Столы</a>
            <a class="nav-link" href="/admin/editmenu">Меню</a>
            <a class="nav-link" href="/admin/edittypes">Типы</a>
            <a class="nav-link" href="/admin/user">Пользователи</a>
        </security:authorize>
        <form:form action="/logout" method="post">
            <input class="nav-link" type="submit" value="Выйти"/>
        </form:form>
    </nav>
    <div class="bd-content ps-lg-4">
        <h3>Добавить новый стол:</h3>
        <form:form action="/admin/saveDesk" modelAttribute="desk" method="post">
            <div class="input-group mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">
            Введите название стола:
        </span>
                <form:input class="form-control" id="exampleInputName2" path="description"/>
            </div>
            <div>
                <form:errors style="color: red;" id="error" path="description"/>
            </div>
            <div class="input-group mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">
            Введите количество мест:
        </span>
                <form:input class="form-control" path="places"/>
            </div>
            <div>
                <form:errors style="color: red;" id="error" path="places"/>
            </div>
            <input type="submit" class="btn btn-primary mb-3" value="Добавить">
        </form:form>
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
    </div>
</div>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Список пользователей</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <nav class="nav nav-pills nav-fill">
        <a class="nav-link" href="/">Главная</a>
        <a class="nav-link" href="/desk">Выбор стола</a>
        <security:authorize access="hasRole('ADMIN')">
            <a class="nav-link" href="/admin/manage">Столы</a>
            <a class="nav-link" href="/admin/editmenu">Меню</a>
            <a class="nav-link" href="/admin/edittypes">Типы</a>
            <a class="nav-link active" aria-current="page" href="/admin/user">Пользователи</a>
        </security:authorize>
        <form:form action="/logout" method="post">
            <input class="nav-link" type="submit" value="Выйти"/>
        </form:form>
    </nav>
    <h3>Список пользователей</h3>
    <table>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <th>${user.getUsername()}</th>
                <th>
                    <c:forEach items="${user.roles}" var="role">
                        ${role}
                    </c:forEach>
                </th>
                <th><a href="/admin/user/${user.id}">Изменить</a></th>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
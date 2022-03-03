<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Редактирование пользователя</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
            <a class="nav-link" href="/admin/user">Пользователи</a>
        </security:authorize>
        <form:form action="/logout" method="post">
            <input class="nav-link" type="submit" value="Выйти"/>
        </form:form>
    </nav>
    <h3>Редактирование пользователя</h3>
<form:form modelAttribute="user" method="post" action="/admin/user/update">
    <c:url var="delete" value="/admin/user/delete">
        <c:param name="userDelId" value="${user.id}"></c:param>
    </c:url>
    <input type="text" value="${user.username}" name="username">
    <c:forEach var="role" items="${roles}">
        <label><input type="checkbox" name="${role}">${role}</label>
    </c:forEach>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="submit" value="Сохранить"/>
    <input type="button" value="Удалить" onclick="window.location.href='${delete}'">
</form:form>
</div>
</body>
</html>
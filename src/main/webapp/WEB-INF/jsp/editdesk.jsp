<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Выбор стола</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
            <a class="nav-link" href="/admin/user">Пользователи</a>
        </security:authorize>
        <form:form action="/logout" method="post">
            <input class="nav-link" type="submit" value="Выйти"/>
        </form:form>
    </nav>
    <h3>Введите обновленные данные</h3>
    <form:form action="updateDesk" modelAttribute="desk">
        <form:hidden path="id"/>
        <div class="input-group mb-3">
    <span class="input-group-text" id="inputGroup-sizing-default">
        Название:
    </span>
            <form:input class="form-control" path="description"/>
        </div>
        <div><form:errors style="color: red;" id="error" path="description"/></div>
        <div class="input-group mb-3">
    <span class="input-group-text" id="inputGroup-sizing-default">
        Мест посадки:
    </span>
            <form:input class="form-control" path="places"/>
        </div>
        <div><form:errors style="color: red;" id="error" path="places"/></div>
        <input class="btn btn-primary mb-3" type="submit" value="OK">
    </form:form>
</div>
</body>
</html>
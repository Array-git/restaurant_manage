<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Начальная страница</title>
    <link rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <nav class="nav nav-pills nav-fill">
        <a class="nav-link active" aria-current="page" href="/">Главная</a>
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
    <h1>Добро пожаловать в систему управления рестораном</h1>

    <a href="/desk">Выбрать стол</a>
    <security:authorize access="hasRole('ADMIN')">
        <br>
        <a href="/admin/manage">Добавить стол</a>
    </security:authorize>
    <security:authorize access="hasRole('ADMIN')">
        <br>
        <a href="/admin/user">Управление пользователями</a>
    </security:authorize>
</div>
</body>
</html>
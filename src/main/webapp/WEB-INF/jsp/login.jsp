<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>РестМенеджер</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="w-25 p-3">
        <h3>Авторизация</h3>
        <c:if test="${param.logout==''}">Вы вышли из аккаунта.</c:if>
        <c:if test="${param.error==''}">Неверный логин или пароль.</c:if>
        <form:form action="/login" modelAttribute="user" method="post">
            <div class="input-group mb-3">
                <span class="input-group-text" id="inputGroup-sizing-default">Логин :</span>
                <input type="text" name="username" class="form-control" id="exampleInputName2"/>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="inputGroup-sizing-default">Пароль:</span>
                <input type="password" name="password" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-default"/>
            </div>
            <div class="col-auto">
                <input type="submit" class="btn btn-primary mb-3" value="Войти"/>
            </div>
        </form:form>
        <a href="/registration">Зарегистрироваться</a>
    </div>
</div>
</body>
</html>
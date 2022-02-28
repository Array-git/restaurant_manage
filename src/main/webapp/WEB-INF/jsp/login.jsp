<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>РестМенеджер</title>
</head>
<body>
<h3>Авторизация</h3>
<c:if test="${param.logout==''}"><br/>Вы вышли из аккаунта.</c:if>
<c:if test="${param.error==''}"><br/>Неверный логин или пароль.</c:if>
<form:form action="/login" modelAttribute="user" method="post">
    <div><label> Логин : <input type="text" name="username"/> </label></div>
    <div><label> Пароль: <input type="password" name="password"/> </label></div>
    <div><input type="submit" value="Войти"/></div>
</form:form>
<a href="/registration">Зарегистрироваться</a>
</body>
</html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>РестМенеджер</title>
</head>
<body>
Авторизация
<form:form action="/login" modelAttribute="user" method="post">
    <div><label> Логин : <input type="text" name="username"/> </label></div>
    <div><label> Пароль: <input type="password" name="password"/> </label></div>
    <div><input type="submit" value="Войти"/></div>
</form:form>
<a href="/registration">Зарегистрироваться</a>
</body>
</html>
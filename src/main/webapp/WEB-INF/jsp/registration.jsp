<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Spring Security Example </title>
</head>
<body>
Регистрация
<c:set var="mess" value="message"></c:set>
<c:if test="${not empty mess}">${message}<br/></c:if>
<form:form action="registration" modelAttribute="user" method="post">
    <div><label> Логин : <input type="text" name="username"/> </label></div>
    <div><label> Пароль: <input type="password" name="password"/> </label></div>
    <div><input type="submit" value="Зарегистрироваться"/></div>
</form:form>
</body>
</html>
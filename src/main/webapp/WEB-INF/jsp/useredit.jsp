<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Редактирование пользователя</title>
</head>
<body>
Редактирование пользователя
<form:form modelAttribute="user" method="post" action="/user/update">
    <input type="text" value="${user.username}" name="username">
    <c:forEach var="role" items="${roles}">
        <label><input type="checkbox" name="${role}">${role}</label>
    </c:forEach>
    <input type="text" value="${user.id}" name="userId">
    <input type="submit" value="Сохранить"/>
</form:form>
</body>
</html>
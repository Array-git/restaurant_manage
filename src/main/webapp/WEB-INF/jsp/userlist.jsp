<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Список пользователей</title>
</head>
<body>
Список пользователей
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
        <th><a href="/user/${user.id}">edit</a></th>
    </tr>
</c:forEach>
</table>
</body>
</html>
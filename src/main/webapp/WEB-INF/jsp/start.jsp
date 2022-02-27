<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Начальная страница</title>
    <link rel="stylesheet" type="text/css"/>
</head>
<body>
<form:form action="logout" method="post">
    <input type="submit" value="Sign Out"/>
</form:form>
<h1>Добро пожаловать в систему управления рестораном</h1>

<a href="/desk">Выбрать стол</a>
<security:authorize access="hasRole('ADMIN')">
    <br>
    <a href="/admin/manage">Добавить стол (только админ)</a>
</security:authorize>
<security:authorize access="hasRole('ADMIN')">
    <br>
<a href="/user">Управление пользователями (только админ)</a>
</security:authorize>
</body>

</html>
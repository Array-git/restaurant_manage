<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Выбор стола</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<form:form action="newdesk" modelAttribute="desk">
    <form:hidden path="id"/>
    Название: <form:input path="description"/>
    <br>
    Мест посадки: <form:input path="numberOfPlaces"/>
    <input type="submit" value="OK">
</form:form>
</body>
</html>
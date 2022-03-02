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
<form:form action="updateDesk" modelAttribute="desk">
    <form:hidden path="id"/>
    Название: <form:input path="description"/>
    <div><form:errors style="color: red;" id="error" path="description"/></div>
    <br>
    Мест посадки: <form:input path="places"/>
    <div><form:errors style="color: red;" id="error" path="places"/></div>
    <input type="submit" value="OK">
</form:form>
</body>
</html>
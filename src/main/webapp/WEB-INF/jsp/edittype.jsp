<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Редактирование типа</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<form:form action="addType" modelAttribute="type">
    <form:hidden path="id"/>
    Название: <form:input path="type"/>
    <br>
    <input type="submit" value="OK">
</form:form>
</body>
</html>
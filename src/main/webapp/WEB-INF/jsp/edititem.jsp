<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Редактирование позиции</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<h3>Изменение позиции меню</h3>
<form:form action="updateItem" modelAttribute="menuItem">
    <form:hidden path="id"/>
    Название: <form:input path="item"/>
    <div><form:errors style="color: red;" id="error" path="item"/></div>
    <br>
    Стоимость: <form:input path="cost"/>
    <div><form:errors style="color: red;" id="error" path="cost"/></div>
    <br>
    Тип позиции:
    <form:select path="selectType">
        <form:option value="${insert}" label="${insert}"/>
        <form:options items="${types}"/>
    </form:select>
<br/>
    <input type="submit" value="OK">
</form:form>
</body>
</html>
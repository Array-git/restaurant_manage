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
<p>Текст ${insert}</p>
<form:form action="saveItem" modelAttribute="menuItem">
    <form:hidden path="id"/>
    Название: <form:input path="item"/>
    <br>
    Стоимость: <form:input path="cost"/>
    <br>
    Тип позиции:
    <form:select path="selectType">
<%--        <c:choose>--%>
<%--            <c:when test="${insert}">--%>

<%--            </c:when>--%>
<%--        </c:choose>--%>
        <form:option value="${insert}" label="${insert}"/>
        <form:options items="${types}"/>
    </form:select>

    <input type="submit" value="OK">
</form:form>
</body>
</html>
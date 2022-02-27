<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Добавить стол</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<%--Добавить позицию в меню:--%>
<%--<form:form action="saveItem" modelAttribute="menuItems" method="post">--%>
<%--    Введите название позиции:<form:input path="item"/>--%>
<%--    Введите стоимость позиции:<form:input path="cost"/>--%>
<%--&lt;%&ndash;    Выберите тип позиции:<form:select path=""><form:options items="${types.type}"/></form:select>&ndash;%&gt;--%>
<%--    <input type="submit" value="Добавить">--%>
<%--</form:form>--%>
<h2>Добавить позицию в меню:</h2>
<form:form action="/admin/saveItem" modelAttribute="newItems" method="post">
    Введите название позиции:<form:input path="item"/>
    Введите стоимость позиции:<form:input path="cost"/>
    Выберите тип позиции:
    <form:select path="selectType">
        <form:option value="NONE" label="Выберите тип"/>
        <form:options items="${types}"/>
    </form:select>
    <input type="submit" value="Добавить">
</form:form>

<a href="edittypes">Управление типами позиций</a>

<h3>Меню:</h3>
<table>
    <tr>
        <th>Название позиции</th>
        <th>Стоимость</th>
        <th>Тип позиции</th>
        <th>Изменить</th>
        <th>Удалить</th>
    </tr>
    <c:forEach var="item" items="${menuItems}">
        <c:url var="update" value="/admin/updateItem">
            <c:param name="itemId" value="${item.id}"></c:param>
        </c:url>
        <c:url var="delete" value="/admin/deleteItem">
            <c:param name="itemId" value="${item.id}"></c:param>
        </c:url>
        <tr>
            <td>${item.getItem()}</td>
            <td>${item.getCost()}</td>
            <td>${item.getType_item().getType()}</td>
            <td><input type="button" value="Изменить" onclick="window.location.href='${update}'"></td>
            <td><input type="button" value="Удалить" onclick="window.location.href='${delete}'"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
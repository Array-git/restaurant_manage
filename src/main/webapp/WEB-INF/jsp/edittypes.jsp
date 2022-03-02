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
<h4>Добавить тип позиции:</h4>
<form:form action="addType" modelAttribute="newType" method="post">
    <form:input path="type"></form:input>
    <div><form:errors style="color: red;" id="error" path="type"/></div>
    <input type="submit" value="Добавить">
</form:form>

<h4>Типы:</h4>
<table>
    <tr>
        <th>Название</th>
        <th>Изменить</th>
        <th>Удалить</th>
    </tr>
    <c:forEach var="type" items="${menuTypes}">
        <%--<c:url var="update" value="/updateType">
            <c:param name="typeId" value="${type.id}"></c:param>
            <c:param name="typeName"></c:param>
        </c:url>--%>
        <c:url var="delete" value="/admin/deleteType">
            <c:param name="typeId" value="${type.id}"></c:param>
        </c:url>
        <tr>
            <form:form action="/admin/updateType" modelAttribute="newType">
                <form:hidden path="id"/>
            <td>
                <input type="text" name="typeName" value="${type.getType()}">
                <input hidden type="text" name="typeId" value="${type.getId()}">
            </td>
                <td>
                    <input type="submit" value="Изменить">
                </td>
            </form:form>
<%--            <td>${type.getType()}</td>--%>
<%--            <td><input type="button" value="Изменить" onclick="window.location.href='${update}'"></td>--%>
            <td><input type="button" value="Удалить" onclick="window.location.href='${delete}'"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Добавить стол</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
<nav class="nav nav-pills nav-fill">
    <a class="nav-link" href="/">Главная</a>
    <a class="nav-link" href="/desk">Выбор стола</a>
    <security:authorize access="hasRole('ADMIN')">
        <a class="nav-link" href="/admin/manage">Столы</a>
        <a class="nav-link" href="/admin/editmenu">Меню</a>
        <a class="nav-link active" aria-current="page" href="/admin/edittypes">Типы</a>
        <a class="nav-link" href="/admin/user">Пользователи</a>
    </security:authorize>
    <form:form action="/logout" method="post">
        <input class="nav-link" type="submit" value="Выйти"/>
    </form:form>
</nav>

<%--Добавить позицию в меню:--%>
<%--<form:form action="saveItem" modelAttribute="menuItems" method="post">--%>
<%--    Введите название позиции:<form:input path="item"/>--%>
<%--    Введите стоимость позиции:<form:input path="cost"/>--%>
<%--&lt;%&ndash;    Выберите тип позиции:<form:select path=""><form:options items="${types.type}"/></form:select>&ndash;%&gt;--%>
<%--    <input type="submit" value="Добавить">--%>
<%--</form:form>--%>
<h3>Добавить тип позиции:</h3>
<form:form action="addType" modelAttribute="newType" method="post">
    <div class="input-group mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">
            Укажите тип:</span>
        <form:input class="form-control" path="type"></form:input>
    </div>
    <div><form:errors style="color: red;" id="error" path="type"/></div>
    <input class="btn btn-primary mb-3" type="submit" value="Добавить">
</form:form>

<h4>Типы:</h4>
<table>
    <tr>
        <th>Название</th>
        <th>Изменить</th>
        <th>Удалить</th>
    </tr>
    <c:forEach var="type" items="${menuTypes}">
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
</div>
</body>
</html>
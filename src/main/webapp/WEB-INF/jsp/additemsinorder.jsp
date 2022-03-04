<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Выбор стола</title>
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
            <a class="nav-link" href="/admin/edittypes">Типы</a>
            <a class="nav-link" href="/admin/user">Пользователи</a>
        </security:authorize>
        <form:form action="/logout" method="post">
            <input class="nav-link" type="submit" value="Выйти"/>
        </form:form>
    </nav>
<h2>Добавляем позиции в заказ №${orderId}.</h2>
<h3>Добавьте позицию из меню:</h3>
<form:form action="addItems" method="post" modelAttribute="newOrder">
    <c:forEach var="type" items="${menuTypes}">
        <table>
        <c:if test="${not empty type.menuItems}">
            <tr><b>${type.type}</b></tr>
            <c:forEach items="${type.menuItems}" var="item">
                <tr>
                    <td>${item.item}</td>
                    <td>${item.getCost()}р.</td>
                    <td><input type="number" min="0" name="${item.id}" value="0"></td>
                </tr>
            </c:forEach>
        </c:if>
        </table>
    </c:forEach>
    <%--    <input hidden type="text" name="orderId" value="${orders.id}">--%>
    <input type="hidden" name="orderId" value="${orderId}">
    <tr><input type="submit" value="Добавить в заказ"></tr>
</form:form>
</div>
</body>
</html>
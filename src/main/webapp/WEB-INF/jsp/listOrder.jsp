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
<h2>Заказ №${order.id} для ${order.desk_id.description}.</h2>
<c:url value="/addItemsInOrder" var="addItems">
    <c:param name="orderId" value="${order.id}"></c:param>
</c:url>
<input class="btn btn-primary mb-3" type="submit" onclick="window.location.href='${addItems}'" value="Добавить позиции в заказ"><br>
<h3>Заказанные позиции из меню:</h3>
<c:forEach items="${receipts}" var="receipt">
    ${receipt.item_id.item} - ${receipt.item_id.cost}р. х ${receipt.count}<br/>
</c:forEach>

<c:url value="/editOrder" var="edit">
<c:param name="orderId" value="${order.id}"></c:param>
</c:url>
<input class="btn btn-primary mb-3" type="submit" onclick="window.location.href='${edit}'" value="Изменить заказ"><br>

<c:url value="/closeOrder" var="close">
    <c:param name="orderId" value="${order.id}"></c:param>
</c:url>
<input class="btn btn-primary mb-3" type="submit" onclick="window.location.href='${close}'" value="Закрыть заказ"><br>
</div>
</body>
</html>
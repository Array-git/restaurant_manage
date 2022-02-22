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
Создаем заказ №${orders.id} для ${orders.desk_id.description}.

<c:url value="/deleteOrders" var="delete">
<c:param name="ordersId" value="${orders.id}"></c:param>
</c:url>
<input type="submit" onclick="window.location.href='${delete}'" value="Удалить заказ"></input><br>
Добавьте в заказ позицию из меню:
<table>
    <tr>
        <th>Название позиции</th>
        <th>Стоимость</th>
        <th>Тип позиции</th>
        <th>Количество</th>
    </tr>
    <c:forEach var="item" items="${menu}">
        <c:url var="update" value="/createOrder">
            <c:param name="itemId" value="${item.id}"></c:param>
        </c:url>
        <tr>
            <td>${item.getItem()}</td>
            <td>${item.getCost()}</td>
            <td>${item.getType_item().getType()}</td>
            <td><input type="text"></td>
<%--            <td><input type="button" value="Изменить" onclick="window.location.href='${update}'"></td>--%>
        </tr>
    </c:forEach>
</table>

<form:form action="createOrder" modelAttribute="menuTypes" method="post">
<c:forEach var="type" items="${menuTypes}">
    <c:if test="${not empty type.menuItems}">
    <b>${type.type}</b>
    <c:forEach items="${type.menuItems}" var="item">
        <li>${item.item} - ${item.getCost()}р.
            <input hidden name="itemId" value="${item.id}">
            <input hidden name="orderId" value="${orders.id}">
            <input type="text" name="count" value="0">
<%--            <form:input path="menuTypes."></form:input>--%>
        </li>
    </c:forEach>
    </c:if>
</c:forEach>
    <input type="submit" value="Сделать заказ">
</form:form>
</body>
</html>
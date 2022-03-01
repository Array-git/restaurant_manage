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
<h2>Заказ №${order.id} для ${order.desk_id.description}.</h2>
<h3>Заказанные позиции из меню:</h3>
<c:forEach items="${receipts}" var="receipt">
    ${receipt.item_id.item} - ${receipt.item_id.cost}р. х ${receipt.count}<br/>
</c:forEach>
<c:url value="/addItemsInOrder" var="addItems">
    <c:param name="orderId" value="${order.id}"></c:param>
</c:url>
<input type="submit" onclick="window.location.href='${addItems}'" value="Добавить позиции в заказ"><br>
<c:url value="/editOrder" var="edit">
<c:param name="orderId" value="${order.id}"></c:param>
</c:url>
<input type="submit" onclick="window.location.href='${edit}'" value="Изменить заказ"><br>
<c:url value="/closeOrder" var="close">
    <c:param name="orderId" value="${order.id}"></c:param>
</c:url>
<input type="submit" onclick="window.location.href='${close}'" value="Закрыть заказ"><br><%--Передать ид заказа и в нем проставить время закрытия--%>
</body>
</html>
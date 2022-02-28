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
Создаем заказ для ${desk.description}.

<%--<c:url value="/deleteOrders" var="delete">
<c:param name="ordersId" value="${orders.id}"></c:param>
</c:url>
<input type="submit" onclick="window.location.href='${delete}'" value="Удалить заказ"><br>--%>

<h2>Добавьте в заказ позицию из меню:</h2>
<form:form action="createOrder" method="post" modelAttribute="newOrder">
    <c:forEach var="type" items="${menuTypes}">
        <table>
        <c:if test="${not empty type.menuItems}">
            <tr><b>${type.type}</b></tr>
            <c:forEach items="${type.menuItems}" var="item">
                <tr>
                    <td>${item.item}</td>
                    <td>${item.getCost()}р.</td>
                        <%--            <td><input hidden name="orderId" value="${orders.id}"></td>--%>
                    <td><input type="number" name="${item.id}" value="0"></td>
<%--                    <td><input type="checkbox" name="order${item.id}" value="${item.id}"></td>--%>
                </tr>
            </c:forEach>
        </c:if>
    </c:forEach>
    <%--    <input hidden type="text" name="orderId" value="${orders.id}">--%>
        <input type="hidden" name="deskId" value="${desk.id}">
    <tr><input type="submit" value="Сделать заказ"></tr>
    </table>
</form:form>
</body>
</html>
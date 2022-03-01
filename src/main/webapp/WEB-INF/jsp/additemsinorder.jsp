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
                    <td><input type="number" name="${item.id}" value="0"></td>
                </tr>
            </c:forEach>
        </c:if>
    </c:forEach>
    <%--    <input hidden type="text" name="orderId" value="${orders.id}">--%>
    <input type="hidden" name="orderId" value="${orderId}">
    <tr><input type="submit" value="Добавить в заказ"></tr>
    </table>
</form:form>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Подтверждение заказа</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<table>
<c:forEach var="receipt" items="${receipts}">
    <tr>
        <c:url var="delete" value="/deletereceipt">
            <c:param name="receiptId" value="${receipt.id}"></c:param>
            <c:param name="order_id" value="${receipt.order.id}"></c:param>
        </c:url>
        <form:form action="confirmOrder" modelAttribute="receipts">
            <td>${receipt.item_id.item}</td>
            <td><input type="text" name="count${receipt.item_id.id}" value="${receipt.count}"></td>
            <td><input hidden type="text" name="orderId" value="${receipt.order.id}"></td>
            <td><input hidden type="text" name="typeId" value="${receipt.item_id.id}"></td>
            <td><input hidden type="text" name="receiptId" value="${receipt.id}"></td>
            <td>
                <input type="button" value="Удалить" onclick="window.location.href='${delete}'">
            </td>
        </form:form>
    </tr>
</c:forEach>
<tr><td><input type="submit" value="Подтвердить заказ"></td></tr>
</table>
</body>
</html>
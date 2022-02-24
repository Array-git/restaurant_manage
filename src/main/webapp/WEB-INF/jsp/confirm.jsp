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
<table>
<c:forEach var="receipt" items="${receipts}">
    <tr>
        <form:form action="confirmOrder" modelAttribute="receipts">
            <td><input type="text" name="typeName" value="${receipt.item_id.item}"></td>
            <td><input type="text" name="count" value="${receipt.count}"></td>
            <td><input hidden type="text" name="orderId" value="${receipt.order_id.id}"></td>
            <td><input hidden type="text" name="typeId" value="${receipt.item_id.id}"></td>
            <td><input hidden type="text" name="receiptId" value="${receipt.id}"></td>
            <td>
                <input type="submit" value="Обновить">
            </td>
        </form:form>
    </tr>
</c:forEach>
<tr><td><input type="submit" value="Подтвердить заказ"></td></tr>
</table>
</body>
</html>
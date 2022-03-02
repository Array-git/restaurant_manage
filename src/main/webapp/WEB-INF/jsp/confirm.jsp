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
Для сохранения измененного количество, нажмите Обновить.
<br/>Для удаления позиции - Удалить.
<%--<form:form method="post" action="/addItemInOrder" modelAttribute="newItem">
    <form:select path="selectType">
        <form:option value="NONE" label="Выберите позицию"/>
        <form:options  items="${allMenu}"/>
    </form:select>
    <input type="submit" value="Добавить">
</form:form>--%>
<%--<select name="item">
    <c:forEach var="item" items="${allMenu}">
        ${item.item}
        <option value="${item.item}">${item.item}</option>
    </c:forEach>
&lt;%&ndash;    <input type="submit" value="Добавить">&ndash;%&gt;
</select>--%>
<table>
<c:forEach var="receipt" items="${receipts}">
    <c:set var="orderId" value="${receipt.order.id}"/>
    <tr>
        <c:url var="delete" value="/deletereceipt">
            <c:param name="receiptId" value="${receipt.id}"></c:param>
        </c:url>
        <form:form action="editOrder" modelAttribute="receipts" method="post">
            <td>${receipt.item_id.item}</td>
            <td><input type="number" name="count" value="${receipt.count}"></td>
            <td><input hidden type="text" name="orderId" value="${receipt.order.id}"></td>
            <td><input hidden type="text" name="receiptId" value="${receipt.id}"></td>
            <td>
                <input type="submit" value="Обновить">
            </td>
        </form:form>
        <td>
            <input type="button" value="Удалить" onclick="window.location.href='${delete}'">
        </td>
    </tr>
</c:forEach>
<tr><td><a href="listOrder?orderId=${orderId}">Подтвердить заказ</a></td></tr>
</table>
</body>
</html>
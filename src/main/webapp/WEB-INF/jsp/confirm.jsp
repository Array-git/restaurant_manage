<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Подтверждение заказа</title>
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
    <h4>Для сохранения измененного количество, нажмите Обновить.</h4>
    <h4>Для удаления позиции - Удалить.</h4>
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
            <td><input type="number" min="1" name="count" value="${receipt.count}"></td>
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
</div>
</body>
</html>
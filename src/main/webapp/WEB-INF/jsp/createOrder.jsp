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
<input type="submit" onclick="window.location.href='${delete}'" value="Удалить заказ"><br>
<h2>Добавьте в заказ позицию из меню:</h2>
<%--<table>
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
&lt;%&ndash;            <td><input type="button" value="Изменить" onclick="window.location.href='${update}'"></td>&ndash;%&gt;
        </tr>
    </c:forEach>
</table>--%>

<%--<script>
    var quantity = document.getElementById("index-${item.id}").value;
    alert(quantity)
    function eventForm(value) {
        var count = value;
        alert=('value')
    }
</script>--%>

<form:form action="createOrder" method="post" modelAttribute="newOrder">
    <c:forEach var="type" items="${menuTypes}">
        <table>
        <c:if test="${not empty type.menuItems}">
            <tr><b>${type.type}</b></tr>
            <c:forEach items="${type.menuItems}" var="item">
                <tr>
                    <td>${item.item} - ${item.getCost()}р.</td>
                        <%--            <td><input hidden name="orderId" value="${orders.id}"></td>--%>
                    <td><input type="checkbox" name="order" value="${item.id}"></td>
                </tr>
            </c:forEach>
        </c:if>
    </c:forEach>
    <input hidden type="text" name="orderId" value="${orders.id}">
    <tr><input type="submit" value="Сделать заказ"></tr>
    </table>
</form:form>

<%--<c:forEach var="configParams" items="${maps}">
    <!--  KEY: ${configParams.key}  - VALUE: ${configParams.value} -->

    <tr>
        <td>
            <c:out value="${configParams.key}" />
        </td>
        <td><input type="text" name="" value="${configParams.value}" /></td>

    </tr>
</c:forEach>--%>
</body>
</html>
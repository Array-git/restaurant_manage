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
<h3>Выберите стол для формирования заказа</h3>
<h4>Свободые столы</h4>
<table>
    <tr>
        <th>Название стола</th>
        <th>Количество мест</th>
        <th>Выбрать</th>
    </tr>
    <form:form>
    <c:forEach var="desk" items="${freeDesks}">
        <c:url var="select" value="/createOrder">
            <c:param name="deskId" value="${desk.id}"></c:param>
        </c:url>
        <tr>
            <td>${desk.getDescription()}</td>
            <td>${desk.getPlaces()}</td>
            <td><input type="button" value="Выбрать" onclick="window.location.href='${select}'"></td>
        </tr>
    </c:forEach>
    </form:form>
</table>
<h4>Занятые столы</h4>
<table>
    <tr>
        <th>Название стола</th>
        <th>Количество мест</th>
        <th>Выбрать</th>
    </tr>
    <form:form>
        <c:forEach var="openOrder" items="${openOrders}">
            <c:url var="select" value="/listOrder">
                <c:param name="orderId" value="${openOrder.id}"></c:param>
            </c:url>
            <tr>
                <td>${openOrder.desk_id.description}</td>
                <td>${openOrder.desk_id.places}</td>
                <td><input type="button" value="Открыть заказ" onclick="window.location.href='${select}'"></td>
            </tr>
        </c:forEach>
    </form:form>
</table>
</body>
</html>
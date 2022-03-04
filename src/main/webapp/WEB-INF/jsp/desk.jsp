<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Выбор стола</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <nav class="nav nav-pills nav-fill">
        <a class="nav-link" href="/">Главная</a>
        <a class="nav-link active" aria-current="page" href="/desk">Выбор стола</a>
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
                    <td><input class="btn btn-primary mb-1" type="button" value="Выбрать"
                               onclick="window.location.href='${select}'"></td>
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
                    <td><input class="btn btn-primary mb-1" type="button" value="Открыть заказ"
                               onclick="window.location.href='${select}'"></td>
                </tr>
            </c:forEach>
        </form:form>
    </table>
</div>
</body>
</html>
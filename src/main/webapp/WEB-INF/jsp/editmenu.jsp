<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Добавить стол</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <nav class="nav nav-pills nav-fill">
        <a class="nav-link" href="/">Главная</a>
        <a class="nav-link" href="/desk">Выбор стола</a>
        <security:authorize access="hasRole('ADMIN')">
            <a class="nav-link" href="/admin/manage">Столы</a>
            <a class="nav-link active" aria-current="page" href="/admin/editmenu">Меню</a>
            <a class="nav-link" href="/admin/edittypes">Типы</a>
            <a class="nav-link" href="/admin/user">Пользователи</a>
        </security:authorize>
        <form:form action="/logout" method="post">
            <input class="nav-link" type="submit" value="Выйти"/>
        </form:form>
    </nav>

    <h3>Добавить позицию в меню:</h3>
    <form:form action="/admin/saveItem" modelAttribute="newItems" method="post">
        <div class="input-group mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">
            Введите название позиции:
         </span>
            <form:input class="form-control" path="item"/>
        </div>
        <div>
            <form:errors style="color: red;" id="error" path="item"/>
        </div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">
            Введите стоимость позиции:
        </span>
            <form:input class="form-control" path="cost"/>
        </div>
        <div><form:errors style="color: red;" id="error" path="cost"/></div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">
            Выберите тип позиции:
        </span>
            <form:select class="form-control" path="selectType">
                <form:option value="" label="Выберите тип"/>
                <form:options items="${types}"/>
            </form:select>
        </div>
        <div><form:errors style="color: red;" id="error" path="selectType"/></div>
        <input type="submit" class="btn btn-primary mb-3" value="Добавить">
    </form:form>

    <h2>Меню:</h2>
    <table>
        <tr>
            <th>Название позиции</th>
            <th>Стоимость</th>
            <th>Тип позиции</th>
            <th>Изменить</th>
            <th>Удалить</th>
        </tr>
        <c:forEach var="item" items="${menuItems}">
            <c:url var="edit" value="/admin/editItem">
                <c:param name="itemId" value="${item.id}"></c:param>
            </c:url>
            <c:url var="delete" value="/admin/deleteItem">
                <c:param name="itemId" value="${item.id}"></c:param>
            </c:url>
            <tr>
                <td>${item.getItem()}</td>
                <td>${item.getCost()}</td>
                <td>${item.getType_item().getType()}</td>
                <td><input type="button" value="Изменить" onclick="window.location.href='${edit}'"></td>
                <td><input type="button" value="Удалить" onclick="window.location.href='${delete}'"></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
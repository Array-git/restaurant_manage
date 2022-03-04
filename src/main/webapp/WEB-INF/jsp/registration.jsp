<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Spring Security Example </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="w-25 p-3">
        <h3>Регистрация</h3>
        <c:set var="mess" value="message"></c:set>
        <c:if test="${not empty mess}">${message}</c:if>
        <c:set var="mess" value="passwordError"></c:set>
        <c:if test="${not empty mess}">${passwordError}</c:if>
        <form:form action="registration" modelAttribute="user" method="post">
            <div class="input-group mb-3">
                <span class="input-group-text" id="inputGroup-sizing-default">Логин:</span>
                <input type="text" name="username" class="form-control"/>
            </div>
            <div>
                <form:errors style="color: red;" id="error" path="username"/>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="inputGroup-sizing-default">Пароль:</span>
                <input type="password" name="password" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-default"/>
            </div>
            <div>
                <form:errors style="color: red;" id="error" path="password"/>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="inputGroup-sizing-default">Пароль:</span>
                <input type="password" name="password2" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-default"/>
            </div>
            <div class="col-auto">
                <input type="submit" class="btn btn-primary mb-3" value="Зарегистрироваться"/>
            </div>
        </form:form>
    </div>
</div>
</body>
</html>
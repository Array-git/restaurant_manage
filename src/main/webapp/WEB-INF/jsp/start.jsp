<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Welcome</title>
    <link rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>Привет</h1>
<h2>${message}</h2>



<a href="${pageContext.request.contextPath}/personList">Person List</a>
<a href="/desk">Выбрать стол</a>

</body>

</html>
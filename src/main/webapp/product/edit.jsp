<%--
  Created by IntelliJ IDEA.
  User: TungDao
  Date: 9/27/2022
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Form Edit</h1>
<button><a href="/Products">Back Menu</a></button>
<c:if test='${requestScope["message"] != null}'>
    <span style="color: green">${requestScope["message"]}</span>
</c:if>

<form method="post">
    <label>Name</label>
    <input type="text" name="name" value="${requestScope["name"].getName()}"><br>
    <label>Price</label>
    <input type="text" name="price" value="${requestScope["price"].getPrice()}"><br>
    <label>Description</label>
    <input type="text" name="description" value="${requestScope["description"].getDescription()}"><br>
    <button>Edit</button>
</form>

</body>
</html>

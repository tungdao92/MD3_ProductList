<%--
  Created by IntelliJ IDEA.
  User: TungDao
  Date: 9/27/2022
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Creat Product</h1>
<button><a href="/Products">Back Menu</a></button>
<c:if test='${requestScope["message"] != null}'>
    <span style="color: green">${requestScope["message"]}</span>
</c:if>
<form method="post">
    <label>Name</label>
    <input type="text" name="name" placeholder = "Enter Product Name"><br>
    <label>Price</label>
    <input type="text" name="price" placeholder="Enter Product Price"><br>
    <label>Description</label>
    <input type="text" name="description" placeholder="Enter Product Description">
    <button>Creat</button>
</form>

</body>
</html>

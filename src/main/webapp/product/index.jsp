<%--
  Created by IntelliJ IDEA.
  User: TungDao
  Date: 9/27/2022
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<h1> Product Manager</h1>
<button><a href="/Products?action=create">Creat</a></button>

<table border="1" style="width: 50%">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="pr" items='${requestScope["listProduct"]}'>
        <tr>
            <td>${pr.id}</td>
            <td>${pr.name}</td>
            <td>${pr.price}</td>
            <td>${pr.description}</td>
            <td>
                <a href="/Products?action=edit& id=${st.id}">Edit</a>
            </td>
            <td>
                <a href="/Products?action=delete& id=${st.id}">Delete</a>

            </td>
        </tr>

    </c:forEach>


</table>

</body>
</html>

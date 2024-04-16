<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<sql:setDataSource driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost/jstl_db" user="root" 
password="" var="db"/>
</head>
<body>
<%--Script d'insertion --%>
<c:if test="${param.btn=='Insert' }">
<sql:update dataSource="${db }" 
sql="insert into Employe values(${param.mat },'${param.nom}',${param.sal })"></sql:update>
<c:out value="Employe Inserted"></c:out>
</c:if>
<%--Script de suppreion --%>
<c:if test="${param.btn=='Delete' }">
<sql:update dataSource="${db }" 
sql="delete from Employe where mat=${param.mat }"></sql:update>
<c:out value="Employe Deleted"></c:out>
</c:if>
<%--Script de mise à jour --%>
<c:if test="${param.btn=='Update' }">
<sql:update dataSource="${db }" 
sql="update Employe set nom='${param.nom}',sal=${param.sal } where mat=${param.mat }"></sql:update>
<c:out value="Employe Updated"></c:out>
</c:if>
<div class="container">
<form method="post">
Matricule :
<input type="text" name="mat" class="form-control" value="">
Nom :
<input type="text" name="nom" class="form-control" value="">
Salaire :
<input type="text" name="sal" class="form-control"value="">

<button name="btn" class="btn btn-success" type="submit" value="Insert">Insert</button>
<button name="btn" class="btn btn-success" type="submit" value="Search">Search</button>
<button name="btn" class="btn btn-success" type="submit" value="Delete">Delete</button>
<button name="btn" class="btn btn-success" type="submit" value="Update">Update</button>

</form>
<sql:query var="employe" dataSource="${db }" sql="select * from Employe"></sql:query>
<table border="1" class="table table-striped">
<tr><th>Matricule</th><th>Nom</th><th>Salaire</th></tr>
<c:forEach items="${employe.rows }" var="emp">
<tr>
<td><c:out value="${emp.mat }"></c:out></td>
<td><c:out value="${emp.nom }"></c:out></td>
<td><c:out value="${emp.sal }"></c:out></td>
</tr>
</c:forEach>
</table>
</div>

</body>
</html>
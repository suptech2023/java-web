<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

</head>
<body>
<%--Script JSTL --%>
<c:if test="${param.nb1!=null && param.nb2!=null  }">

<c:set var="result" scope="request" value="${param.nb1+param.nb2 }"></c:set>

</c:if>
<div class="container">
<form method="post">
Nombre 1:
<input type="text" name="nb1" class="form-control" value="${param.nb1 }">
Nombre 2:
<input type="text" name="nb2" class="form-control" value="${param.nb2 }">
Resultat :
<input type="text" name="rs" class="form-control" readonly="readonly" value="${result }">

<button name="btn_somme" class="btn btn-success" type="submit">Somme</button>

</form>
</div>

</body>
</html>
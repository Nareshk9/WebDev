<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//allow access only if session exists
String user = "";
if(session.getAttribute("flag")==null){
	response.sendRedirect("loginform.jsp");
}else user = (String) session.getAttribute("user");
%>
<table>
	<thead>
		<tr>
		<th>User</th>
		<th>Message</th>
		</tr>
	</thead>
		<c:forEach var="it" items="${i}">
			<tr>
				<td><c:out value="${it.getuser()}"/></td>
				<td><c:out value="${it.getmessage()}"/></td>
         
			</tr>
		</c:forEach>
</table>
</body>
</html>
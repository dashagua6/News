<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uname = request.getParameter("uanme");
	String pwd = request.getParameter("pwd");
	if (uname == "cc" && pwd == "123") {
		
		//重定向
		response.sendRedirect("newspages/admin.jsp");
	}
	pageContext.setAttribute("uname", uname);
	pageContext.setAttribute("pwd", pwd);
%>
<html>
<head></head>
<body>


</body>
</html>
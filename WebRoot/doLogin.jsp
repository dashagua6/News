<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uname=request.getParameter("uanme");
	String pwd=request.getParameter("pwd");
	//重定向
	response.sendRedirect("newspages/admin.jsp");
%>
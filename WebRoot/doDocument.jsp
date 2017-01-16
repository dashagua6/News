<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="com.mysql.jdbc.jmx.LoadBalanceConnectionGroupManager"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doDocument.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   FileItemFactory fif=new DiskFileItemFactory();
   ServletFileUpload sfu=new ServletFileUpload(fif);
   sfu.setFileSizeMax(1024*100);
   List<String> str= new ArrayList<String>();
   str.add("jpg");
   str.add("jpeg");
   str.add("bmp");
  	if(sfu.isMultipartContent(request)){
  		List<FileItem> list= sfu.parseRequest(request);
  		for(FileItem item:list){
  			//6
  			if(item.isFormField()){
  			String name=item.getFieldName();
  			if(name.equals("pname")) item.getString("utf-8");
  			}else{
  				String pa= item.getName();
  				File file= new File(pa);
  				
  				application.getRealPath("file");
  			}
  		}
  		
  		
  	}
  	
    %>
  </body>
</html>

<%@page import="java.io.PrintWriter"%>
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
		/*  FileItemFactory fif=new DiskFileItemFactory();
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
			  			
			  			  // 处理不在表单中的字段
			              if (!item.isFormField()) {
			                 String fileName = new File(item.getName()).getName();
			                // String filePath = uploadPath + File.separator + fileName;
			                String filePath =  File.separator +fileName;
			                 File storeFile = new File(filePath);
			                 // 在控制台输出文件的上传路径
			                 out.print(filePath);
			                // 保存文件到硬盘
			                item.write(storeFile);
			                request.setAttribute("message",
			                            "文件上传成功!");
			            }
			  		
			  		}
			  		
			  		
			  	} */
		//上传文件的存储目录
	    String UPLOAD_DIRECTORY ="upload";
	    //上传配置
	    int MEMORY_THRESHOLD=1024*1024*3;
	    int MAX_FILE_SIZE=1024*1024*30;
		int MAX_REQUEST_SIZE=1024*1024*40;
		//上传数据及保存文件
		//检查是否为多媒体上传
	   if(!ServletFileUpload.isMultipartContent(request)){
			//如果不是则停止
			PrintWriter writer=response.getWriter();
			writer.print("Error: 表单必须包含 enctype=multipart/form-data");
			writer.flush();
		    return;
			}
			//配置上传参数
			DiskFileItemFactory factory=  new DiskFileItemFactory();
			//设置内存临界值，超过后将产生临时文件并存储于临时目录中
			factory.setSizeThreshold(MEMORY_THRESHOLD);
			//设置临时存储目录
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
			ServletFileUpload upload=new ServletFileUpload(factory);
			//设置最大文件上传值
			upload.setFileSizeMax(MAX_FILE_SIZE);
			  	
			//设置最大请求值（包含文件和表单数据）
			upload.setSizeMax(MAX_REQUEST_SIZE);
			//构造临时路径来存储上传的文件
			//这个路径相对当前应用的路径
			String uploadPath=getServletContext().getRealPath("./")+File.separator+UPLOAD_DIRECTORY;
			//如果目录不存在则创建
			File uploadDir=new File(uploadPath);
			if(!uploadDir.exists()){
			  uploadDir.mkdir();
			}
			//解析请求的内容提取文件数据
			List<FileItem> formItem= upload.parseRequest(request);
			if(formItem!=null && formItem.size()>0){
			  //迭代表单数据
			 for(FileItem item:formItem){
			 //处理不在表单中的数据
			 if(!item.isFormField()){
			  	String fileName=new File(item.getName()).getName();
			    String filePath=uploadPath+File.separator+fileName;
			  	File storeFile=new File(filePath);
			  	//在控制台输出上传路径
			  	out.print(filePath);
			    //保存文件到硬盘
			    item.write(storeFile);
			    //request.setAttribute("message", "文件上传成功！");
			  	out.print("文件上传成功！");
			       }
			    }
			  }
	%>
</body>
</html>

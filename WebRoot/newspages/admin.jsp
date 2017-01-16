<%@page import="com.hisoft.util.PageBean"%>
<%@page import="com.hisoft.biz.*"%>
<%@page import="com.hisoft.entity.NewsInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>添加主题--管理后台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
<script>
	function endCheck(num,end){
		if(num>end){
			alert("已到最后一页");
			location='admin.jsp?num='+end;
		}else{
			location='admin.jsp?num='+num;
		}	
	}
	function beginCheck(num){
		if(num==0){
			alert("已经到首页");
			num=1;
		}
		location="admin.jsp?num"+num;
	}
</script>

</head>
<body>
	<div id="main">
		<div>
			<iframe src="console_element/top.html" scrolling="no" frameborder="0"
				width="947px" height="180px"></iframe>
		</div>
		<div id="opt_list">
			<iframe src="console_element/left.html" scrolling="no"
				frameborder="0" width="130px"></iframe>
		</div>
		<div id="opt_area">
			<ul class="classlist">

				<%
					String num1=request.getParameter("num");
					if(num1==null) num1="1";
				    int num=Integer.parseInt(num1);
					INewsBiz newsBiz= new NewsBizImpl();
					PageBean pageBean=newsBiz.getNewsBean(num);
					List<NewsInfo> list= pageBean.getCurrentPageData();
					for(NewsInfo news:list){
				%>
				<li><%=news.getContent()%><span> 作者： <%=news.getAuthor()%>
						&#160;&#160;&#160;&#160; <a href='news_modify.html'>修改</a>
						&#160;&#160;&#160;&#160; <a href='#'>删除</a>
				</span></li>
				<%
					}
				%>

				<li class='space'></li>
				<p align="right">
					当前页数:[<%=pageBean.getCurrentPage()%>/<%=pageBean.getTotalPage()%>]&nbsp;
					<a href="admin.jsp?num=1">首页</a> 
					<a href="javascript:beginCheck(<%= pageBean.getCurrentPage()-1 %>)">上一页</a> 
					<a href="javascript:endCheck(<%=pageBean.getCurrentPage()+1%>,<%=pageBean.getTotalPage()%>)">下一页</a> 
					<a href="admin.jsp?num=<%=pageBean.getTotalPage()%>">末页</a>
				</p>
			</ul>
		</div>
		<iframe src="console_element/bottom.html" scrolling="no"
			frameborder="0" width="947px" height="190px"></iframe>
	</div>
</body>
</html>


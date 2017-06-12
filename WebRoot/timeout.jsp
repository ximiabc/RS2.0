<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
  </head>
  
  <body>
  	<!-- 查看struts框架在运行时期产生的所有错误信息 -->
	<p>连接超时！<a onClick="location.replace(location.href)">刷新</a>，
	<a onClick="javascript :history.back(-1);">返回</a></p>
  	<%@ taglib uri="/struts-tags" prefix="s" %>
  	<s:fielderror></s:fielderror>
  </body>
</html>








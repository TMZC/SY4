<%@ page language="java" import="java.util.*,com.dbutil.*,com.entity.*,com.model.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>显示数据页面</title>
  </head>
  <body>
    <%
    int id=Integer.parseInt(request.getParameter("id"));
     Model model=new Model();
 	 User user=model.load(id);
	%>
	用户ID：<%=user.getId() %>
	用户名：<%=user.getName() %>
	密码：<%=user.getPassword() %>
  </body>
</html>

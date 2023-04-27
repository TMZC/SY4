<%@ page language="java" import="java.util.*,com.dbutil.*,com.entity.*,com.model.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>显示数据页面</title>
  </head>
  <body>
    <%
     Model model=new Model();
 	 ArrayList<User> arraylist=model.userSelect();
			%>
			数据库中所有用户
			<table width="400"  border="1" style="border-collapse: collapse;">
			<thead>
					<tr>
					<th>id</th>
					<th>用户名</th>
					<th>密码</th>
					
					</tr>
				</thead>
				<tbody align="center" >
			<%for(int i=0;i<arraylist.size();i++){%>
				<tr>
				<td><%=arraylist.get(i).getId()%></td>
				<td><%=arraylist.get(i).getName() %></td>
				<td><%=arraylist.get(i).getPassword() %></td>
				</tr>
		<% 	
		}
     %>
     </tbody>
     </table>
  </body>
</html>

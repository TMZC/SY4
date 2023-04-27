<%@ page language="java" import="java.util.*,com.dbutil.*,com.entity.*,com.model.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="utf-8" />
    <title>excel导入</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->

    <script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
    
</head>
<body>
    <div class="container">
        <!-- <h2 class="text-center mt-4 mb-4">Convert Excel to HTML Table using JavaScript</h2> -->
        <div>
            <div class="card-header"><b>请选择Excel文件</b><a href="file/User.xlsx">模板</a></div>
            <div class="card-body">
                
                
        <form id="file_form" action="File" enctype="multipart/form-data" method="post">
            <input type="file" name="file"  />
            <input type="submit" value="上传Excel">
        </form>
            </div>
        </div>
        <!-- <div id="excel_data"></div> -->
    </div>
    <div>
    <c:if test="${not empty usersList}">
    <table width="400"  border="1" style="border-collapse: collapse;">
				<thead>
					<tr>
					<th>id</th>
					<th>用户名</th>
					<th>密码</th>
					<th>状态</th>
					
					</tr>
				</thead>
				<tbody align="center" >
				<c:forEach  varStatus="i" var="u" items="${usersList }">
					<tr>
						<td>${u.id }</td>
						<td>${u.name }</td>
						<td>${u.password }</td>
						<td>${u.zt}</td>
						
					</tr>
				</c:forEach>
				
				</tbody>
			</table>
			</c:if>
			</div>
</body>
</html>


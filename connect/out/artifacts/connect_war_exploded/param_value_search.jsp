<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>JSP读取数据库</title>
</head>
<body>
<h1 align="center"><br></h1><h1 align="center">    用户信息</h1>

<input type="hidden" name="id">
<table align="center" border="1" width="80%">
    <tr>
        <td colspan="8" align="right">
            <a href="index.jsp">返回主界面</a>
            <a href="add.jsp">添加新信息</a>
            <a href="search.jsp">查询信息</a>
        </td>
    </tr>


    <tr>
        <th>id</th>
        <th>param_name</th>
        <th>param_value</th>
        <th>remark</th>

    </tr>
    <%
        String driverClass="com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/weiyidata";
        String user = "root";
        String password = "";
        Connection conn;
        PreparedStatement pst = null;
        request.setCharacterEncoding("UTF-8");

        String param_value = request.getParameter("param_value");

        try{
            Class.forName(driverClass).newInstance();
            conn = DriverManager.getConnection(url,user,password);
            String sql = "select * from test where param_value = "+param_value+"";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
    %>
    <tr>
        <td><%=rs.getString("id") %></td>
        <td><%=rs.getString("param_name") %></td>
        <td><%=rs.getString("param_value") %></td>
        <td><%=rs.getString("remark") %></td>

        <td>
            <a href="delete.jsp?id=<%=rs.getString("id")%>">删除</a>
            <a href="update.jsp?id=<%=rs.getString("id")%>">修改</a>
        </td>
    </tr>
    <%
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    %>
</table>

</body>
</html>
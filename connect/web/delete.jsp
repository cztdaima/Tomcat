<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%

    String path = request.getContextPath();

    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>



<%

    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");

    Connection conn = null;

    Statement stat = null;

    ResultSet rs = null;

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/weiyidata";

    String user = "root";

    String password = "";

    conn = DriverManager.getConnection(url,user,password);

    stat = conn.createStatement();

    stat.executeUpdate("delete from test where id = " + id + "");

    rs = stat.executeQuery("select * from test");



    if(rs.next())

    {

        out.print("<center><br><br><h3>删除成功！</h3></center>");

    }

    else{

        out.print("<center><h3>删除失败！</h3></center>");

    }

%>

<br>

<br>

<center> <a href=add.jsp>返回添加信息页面</a> <a href=index.jsp>返回主界面</a></center>

<%

    if(rs != null)

    {

        rs.close();

        rs = null;

    }

    if(stat != null)

    {

        stat.close();

        stat = null;

    }

    if(conn != null)

    {

        conn.close();

        conn = null;

    }

%>

</body>

</html>
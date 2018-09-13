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

    String param_name = request.getParameter("param_name");

    String param_value = request.getParameter("param_value");

    String remark = request.getParameter("remark");


    Connection conn = null;

    Statement stat = null;

    ResultSet rs = null;

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/weiyidata";

    String user = "root";

    String password = "";

    conn = DriverManager.getConnection(url,user,password);

    stat = conn.createStatement();



    String sql = "update test set param_name ="+param_name+", param_value = "+param_value+", remark = "+remark+" where id = "+id+"";

    stat.executeUpdate(sql);

    rs = stat.executeQuery("select * from test");

%>



<center>

    <%

        if(rs.next())

        {

            out.print("<br><h3>成功更新！</h3>");

        }

        else{

            out.print("<br><h3>更新失败！</h3>");

        }



    %>





    <br>

    <a href=add.jsp>返回添加信息页面</a>   <a href=index.jsp>进入主界面</a>

</center>

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